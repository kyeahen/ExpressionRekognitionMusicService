var express = require('express');
var router = express.Router();
var mysql = require('mysql');

//GET - 표정에 알맞은 음악 추천 API
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/api/music', function(req, res) {
  //클라이언트에게서 받은 emotion 값을 변수에 저장합니다.
	var emotion = req.query.emotion;
  
  //AWS RDS 생성 후, 알맞은 정보를 기입하시면 됩니다.
  //저는 mysql을 선택하여 생성하였지만 Oracle, Maria DB 등 다양한 유형을 제공하고 있으니 원하시는 유형을 선택하시면 됩니다.
	var connection = mysql.createConnection({
		host     : '입력하세요.',    // RDS 엔드포인트 (RDS 생성 후, 얻을 수 있습니다.)
		user     : '입력하세요.',    // Master username (RDS 생성 시, 설정한 정보입니다.)
		password : '입력하세요.',    // 마스터 암호 (RDS 생성 시, 설정한 정보입니다.)
		database : '입력하세요.'     // mysql 데이터베이스 이름
	  });

  connection.connect();
  
  //해당 데이터베이스에서 클라이언트에게 받은 emotion 값에 알맞은 음악을 검색합니다.
	connection.query("SELECT * FROM music_list WHERE emotion LIKE ?", "%" + emotion + "%", 
	function (err, data) {
		if(err) {
			connection.end();
			res.send("Not found data");
		} else{
			result = data;
			connection.end();
			res.send(result);
		} 
	});
});

module.exports = router;
