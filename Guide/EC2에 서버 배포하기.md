# EC2에 서버 배포하기

‼️ [프로젝트 다운받기](https://github.com/kyeahen/ExpressionRekognitionMusicService/archive/master.zip)

- 해당 프로젝트에 오늘 구현하게 될 서버 프로젝트와 iOS 프로젝트가 있습니다.

  다운받아주세요!

- 서버 압축 파일은 **Server** 폴더 안에 있습니다!

![server](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/server.png)

<br>

- 오늘 세미나는 **AWS Rekognition**과 **iOS 앱 개발**에 중점을 둔 세미나이기 때문에

  시간 관계 상 서버 개발에 관련된 부분은 깊게 다루지 않도록 하겠습니다!

  궁금하신 분들은 아래 문서를 참고해주세요! 

  ✅ [node.js로 API 만들기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/node.js%EB%A1%9C%20API%20%EB%A7%8C%EB%93%A4%EA%B8%B0.md)

<br>

-----

<br/>

### ❗️1단계 : EC2에 프로젝트 압축 파일 업로드하기

```
$ scp -i [pem 파일 경로] [압축한 파일 이름] ubuntu@[ec2 인스턴스의 퍼블릭 DNS]:~/[ec2에 저장할 경로]
```

* **ec2 instance의 public DNS**는 AWS EC2 페이지에서 찾으실 수 있습니다.

![public_dns](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/public_dns.png)

<br/>

* **pem 파일 경로**와 **다운받은 프로젝트 서버 압축 파일 경로**를 잘 확인하세요!

![scp](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/scp.png)

<br/>

### ❗️2단계 : EC2 서버 접속하기

```
$ ssh -i [pem 파일 경로] ubuntu@[ec2 인스턴스의 퍼블릭 DNS]
```

![ssh](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/ssh.png)

<br/>

### ❗️3단계 : 업로드한 프로젝트 압축 파일 풀기

```
$ ls //파일이 업로드 되었는지 확인해보세요.
$ unzip aws-reko-sever.zip
```

![node_unzip](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/node_unzip.png)

<br/>

### ❗️4단계 : EC2에 node.js 및 npm 설치하기

```
//이 과정에서 에러가 난다면 $sudo apt-get update를 실행해주세요.
$ sudo apt install nodejs
$ sudo apt install npm

$ npm -v
$ node -v
// 버전 정보가 확인된다면 설치가 완료된 것입니다.
```

<br/>

### ❗️5단계 : 서버 실행하기

```
$ cd aws-reko-server //경로 이동
$ npm install
$ npm start
```

![ec2_npm_start](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/npm_start.png)

* **http:// [ec2 퍼블릭 DNS or IPv4 퍼블릭 IP] :3000/api/rekognition** 으로 접속해보세요!

  배포가 잘되었다면 터미널에서 로그를 확인할 수 있습니다.

![ec2_log](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/ec2_log.png)

<br/>

----------

<br/>

## 🚩 다음 목차

- [iOS 네트워크 통신하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/iOS%20%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%82%B9%20%ED%86%B5%EC%8B%A0%ED%95%98%EA%B8%B0.md)
- [삭제 가이드](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/%EC%82%AD%EC%A0%9C%20%EA%B0%80%EC%9D%B4%EB%93%9C.md)
