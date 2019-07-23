# node.js로 API 만들기

## 🚩 1. node.js 설치하기

* node.js [설치](https://nodejs.org/ko/) :  **10.16.0 버전**을 설치해주세요!

  설치 후, 아래의 명령어를 입력했을 시에 버전 정보가 뜬다면 설치 완료된 상태입니다.

```
$ node -v
$ npm -v
```

![node-v](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/node-v.png)

<br/>

**[Homebrew로 node.js 설치하기]**

- Homebrew를 이용하신다면 아래와 같이 설치하셔도 무관합니다.

```
$ brew install node@10
```

<br/>

## 🚩 2. 프로젝트 구성하기

* Desktop > **aws-reko-server** 폴더를 생성해주세요.

  터미널 상에서 해당 경로로 이동한 후, 아래의 명령어를 실행해주세요.

```
$ npm init
```

![npm_init](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/npm_init.png)

<br/>

#### ❗️1단계 : node express 설치하기

```
$ npm install express --save
$ express 
$ npm install
```

![npm_express](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/npm_express.png)

---------



<br/>

#### ❗️2단계 : 추가 node module 설치하기

* Recognition API에 필요한 추가 모듈을 설치하도록 하겠습니다.

```
$ npm install fs-extra multer aws-sdk --save
```

> - fs-extra : fs 모듈은 FileSystem의 약자로 파일 처리와 관련된 모듈입니다. 
> - multer : 파일 업로드를 위해서 사용되는 multipart/form-data를 다루기 위한 node.js 미들웨어입니다. 이미지 업로드를 도와주는 모듈입니다.
> - aws-sdk : node.js에서 AWS를 사용할 수 있는 모듈입니다. SDK를 사용하면 Amazon S3, Amazon EC2, DynamoDB 및 Amazon SWF를 포함하는 AWS 서비스를 위한 JavaScript 객체가 제공되므로 복잡하게 코드를 작성하지 않아도 됩니다.

<br/>

```
$ npm start
```

- http://localhost:3000/ 으로 접속하시면 이렇게 express 페이지가 뜨는 것을 보실 수 있습니다!

![express](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/express.png)

* 터미널에서는 이렇게 로그가 뜨는 것을 볼 수 있어요!

![npm_start](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/npm_start.png)

-----------



<br/>

#### ❗️3단계 : 프로젝트 열기

* 앞서 다운받은 코드편집기를 통해 프로젝트(aws-reko-server)를 열어주세요!

![vscode](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/vscode.png)

--------------

<br/>

#### ❗️4단계 : .js 파일 추가하기

- **routes 폴더 하위**에 아래의 파일들을 추가해주세요.

![routes](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/routes.png)

<br/>

* **index.js** 

```javascript
var express = require('express');
var router = express.Router();

var config = require('./config.js');
var multer  = require('multer');
var AWS = require('aws-sdk');
var fs = require('fs-extra');

//파일을 저장할 경로 지정
var upload = multer({ dest: './uploads' });

//config.js에서 작성한 리전 정보를 설정합니다.
AWS.config.region = config.region;
var rekognition = new AWS.Rekognition(
	{
		region: config.region
	}
);

//POST - Rekognition을 이용한 얼굴 분석 API 
router.post('/api/rekognition', upload.single("image"), function (req, res, next) {
	//클라이언트와 통신 시, 받아온 이미지 데이터를 변수로 저장합니다.
	var bitmap = fs.readFileSync(req.file.path);

	/* deteceFaces는 이미지내의 얼굴을 감지하는 메소드입니다.
	Rekognition에서 제공됩니다.*/
	rekognition.detectFaces({
		//Rekognition에 전송할 요청 바디입니다.
	 	"Image": { 
			 //우리가 전송한 이미지 데이터를 value 값으로 넣어줍니다.
	 		"Bytes": bitmap,
		 },
		 "Attributes": [
			"ALL",
		  ]
	}, function(err, data) {
	 	if (err) { //통신 실패
	 		res.send(err);
	 	} else { //통신 성공

			/* 올바른 사진 분석을 하지 못했을 시 (인물 사진이 아닐 경우)에는 FaceDetail 값이 빈 배열로 오게 됩니다. 
			그럴 시에 클라이언트에게 올바를 에러 처리를 할 수 있도록 아래와 같은 결과를 반환하도록 하였습니다.
			*/
			if(data.FaceDetails && data.FaceDetails.length > 0)
			{	
				var bestEmotion = {
					emotion : getBestEmotion(data)
				};

				//Rekognition이 반환해준 표정 인식 값 중 최대 값을 반환합니다.
				res.json(bestEmotion);

			} else {
				var errorEmotion = {
					emotion : "none"
				};

				//표정 인식 값이 없을 시에는 임의로 none 값을 반환했습니다.
				res.json(errorEmotion)
			}
		}
	});
});

/* 저희는 얼굴 분석 API에서 표정 인식 기능만을 사용할 것이기 때문에 FaceDetails에 있는 모든 값들이 필요하지 않습니다.
그래서 emtion 값만 추출할 수 있도록 하였습니다. 
그 중에서도 저희는 가장 높은 감정 값이 필요하기 때문에 가장 높은 감정 값을 반환할 수 있도록 하였습니다. */
var getBestEmotion = function(data) {
	var emotionList = data.FaceDetails[0].Emotions;
	var MAX = 0;
	var type;

	for(var i = 0;i < emotionList.length; i++){
		if(emotionList[i].Confidence > MAX) {
			MAX = emotionList[i].Confidence;
			type = emotionList[i].Type;
		}
	}

	return type;
}

module.exports = router;
```

<br/>

* **config.js** 

```javascript
module.exports.region = "ap-northeast-2"; //CLI에서 설정했던 리전 위치
```

<br/>



## 🚩 다음 목차

- [EC2에 서버 배포하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/EC2%EC%97%90%20%EC%84%9C%EB%B2%84%20%EB%B0%B0%ED%8F%AC%ED%95%98%EA%B8%B0.md)

- [iOS 네트워크 통신하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/iOS%20%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%82%B9%20%ED%86%B5%EC%8B%A0%ED%95%98%EA%B8%B0.md)
- [삭제 가이드]()

