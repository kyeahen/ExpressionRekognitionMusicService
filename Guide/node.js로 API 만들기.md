# node.js로 API 만들기

### 🚩 1. node.js 설치하기

* node.js [설치](https://nodejs.org/ko/) :  10.16.0 버전을 설치해주세요!

  설치 후, 아래의 명령어를 입력했을 시에 버전 정보가 뜬다면 설치 완료된 상태입니다.

```
$ node -v
$ npm -v
```

![node-v](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/node-v.png)

<br/>

------

### 🚩 2. 프로젝트 구성하기

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

<br/>

#### ❗️2단계 : 추가 node module 설치하기

* Recognition API에 필요한 추가 모듈을 설치하도록 하겠습니다.

```
$ npm install fs-extra klaw-sync multer aws-sdk --save
```

<br/>

```
$ npm start
```

- http://localhost:3000/ 으로 접속하시면 이렇게 express 페이지가 뜨는 것을 보실 수 있습니다!

![express](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/express.png)

* 터미널에서는 이렇게 로그가 뜨는 것을 볼 수 있어요!

![npm_start](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/npm_start.png)



#### ❗️3단계 : 프로젝트 열기

* 앞서 다운받은 코드편집기를 통해 프로젝트(aws-reko-server)를 열어주세요!

![vscode](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/vscode.png)

<br/>

#### ❗️4단계 : .js 파일 추가하기

- **routes 폴더 하위**에 아래의 파일들을 추가해주세요.

![routes](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/routes.png)

<br/>

* **import.js** 

```javascript
/*
 * Copyright 2013. Amazon Web Services, Inc. All Rights Reserved.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
**/

// Load the SDK and UUID
var config = require('./config')
var AWS = require('aws-sdk');
var fs = require('fs-extra');
var path = require('path');

AWS.config.region = config.region;
var rekognition = new AWS.Rekognition({region: config.region});

// AWS allows you to create separate collections of faces to search in. 
// This creates the collection we'll use.
function createCollection() {
	// Index a dir of faces
	rekognition.createCollection( { "CollectionId": "aws-reko-server" }, function(err, data) {
	  if (err) {
		console.log(err, err.stack); // an error occurred
	  } else {
		console.log(data);           // successful response
	  }
	});
}

// This loads a bunch of named faces into a db. It uses the name of the image as the 'externalId'
// Reads from a sub folder named 'faces'
function indexFaces() {
	var klawSync = require('klaw-sync')
	var paths = klawSync('./faces', { nodir: true, ignore: [ "*.json" ] });

	paths.forEach((file) => {
		console.log(file.path);
		var p = path.parse(file.path);
		var name = p.name.replace(/\W/g, '');
		var bitmap = fs.readFileSync(file.path);

		rekognition.indexFaces({
		   "CollectionId": "aws-reko-server",
		   "DetectionAttributes": [ "ALL" ],
		   "ExternalImageId": name,
		   "Image": { 
			  "Bytes": bitmap
		   }
		}, function(err, data) {
			if (err) {
				console.log(err, err.stack); // an error occurred
			} else {
				console.log(data);           // successful response
				fs.writeJson(file.path + ".json", data, err => {
					if (err) return console.error(err)
				});
			}
		});
	});
}

createCollection();
indexFaces();
```

<br/>

* **index.js** 

```javascript
var express = require('express');
var router = express.Router();

var config = require('./config.js');
var multer  = require('multer');
var AWS = require('aws-sdk');
var fs = require('fs-extra');

var upload = multer({ dest: './uploads' });

AWS.config.region = config.region;
var rekognition = new AWS.Rekognition({region: config.region});

//Post - Rekognition을 이용한 얼굴 분석 API 
router.post('/api/rekognition', upload.single("image"), function (req, res, next) {
	var bitmap = fs.readFileSync(req.file.path);

	rekognition.detectFaces({
	 	"Image": { 
	 		"Bytes": bitmap,
		 },
		 "Attributes": [
			"ALL",
		  ]
	}, function(err, data) {
	 	if (err) {
	 		res.send(err);
	 	} else {

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

	for(var i=0;i<emotionList.length;i++){
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
module.exports.collectionName = "aws-reko-server";
module.exports.region = "ap-northeast-2"; //리전 위치
```

<br/>

----------

<br/>

## 🚩 다음 목차

- [EC2에 서버 배포하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/EC2%EC%97%90%20%EC%84%9C%EB%B2%84%20%EB%B0%B0%ED%8F%AC%ED%95%98%EA%B8%B0.md)

- [iOS 네트워크 통신하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/iOS%20%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%82%B9%20%ED%86%B5%EC%8B%A0%ED%95%98%EA%B8%B0.md)
- [삭제 가이드]()

