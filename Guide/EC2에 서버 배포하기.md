# EC2에 서버 배포하기

##### 1단계: [로컬 터미널] 프로젝트 폴더 압축하기

* node_modules 파일을 제거한 후, 압축해야합니다.

```
$ 
```



##### 2단계 : [로컬 터미널] EC2에 프로젝트 압축 파일 업로드하기

```
$ scp -i [pem파일경로] [압축한 파일 이름] ubuntu@[ec2 instance의 public DNS]:~/[경로]
```

터미널 사진 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!1



#####3단계 : [원격 터미널] 업로드한 프로젝트 압축 파일 풀기

```
$ ls //파일이 업로드 되었는지 확인해보세요.
$ sudo apt install unzip
$ unzip aws-reko-sever.zip
```



##### 4단계 : [원격 터미널] EC2에 node.js 및 npm 설치하기

```
//이 과정에서 에러가 난다면 $sudo apt-get update 를 실행해주세요.
$ sudo apt install nodejs
$ sudo apt install npm

$ npm -v
$ node -v
// 버전 정보가 확인된다면 설치가 완료된 것입니다.
```



##### 5단계 : [원격 터미널] 서버 실행하기

```
$ cd aws-reko-server //경로 이동
$ npm install
$ npm start
```

터미널 사진 추가해ㅡㅡ



-----

### [다음 목차]

- [iOS 네트워크 통신하기]()
- [삭제 가이드]()