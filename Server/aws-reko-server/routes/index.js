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

	//deteceFaces는 이미지내의 얼굴을 감지하는 메소드입니다.
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