var express = require('express');
var router = express.Router();

var config = require('./config.js');
var multer  = require('multer');
var AWS = require('aws-sdk');
var fs = require('fs-extra');

var upload = multer({ dest: './uploads' });

AWS.config.region = config.region;
var rekognition = new AWS.Rekognition({region: config.region});

//Post
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
			if(data.FaceDetails && data.FaceDetails.length > 0)
			{	
				var bestEmotion = {
					emotion : getBestEmotion(data)
				};

				res.json(bestEmotion);

			} else {
				res.send("Not rekognition");
			}
		}
	});
});

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