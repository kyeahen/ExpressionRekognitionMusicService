# EC2에 AWS CLI 설치하기

### 로컬에서 EC2 사용하기

- 연결을 클릭해주세요.

![cli-1](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.39.40.png)

- 연결을 클릭하면 아래의 사진이 뜹니다.

![cli-2](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.39.40.png)

- 위의 사진에 빨간 사각형에 있는 2개의 명령어를 차례대로 터미널에 입력해주세요.

  자신의 <u>키페어 파일이 저장되어있는 경로</u>에서 첫번째 명령어를 입력해야겠죠?

  저는 Desktop에 저장되어있기 때문에 Desktop에서 시작했습니다.

```
//이러한 의미의 명령어랍니다.
$ chmod 400 자신의 키페어 파일명
$ ssh -i "aws-reko-server-key.pem" ubuntu@자신의 Ec2 퍼블릭 DNS
```

![cli-3](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.39.40.png)

**이제 우리가 만든 가상 컴퓨터에 접속이 되었습니다!**

----------

### EC2에 AWS CLI 설치하기

##### 1단계 : 번들 설치 관리자를 사용하여 AWS CLI 설치

* <u>EC2에 접속된 터미널</u>에서 차례대로 명령어를 입력해주세요.

**1.  AWS CLI 번들 설치 관리자 다운로드하기**

```
$ curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
```

**2. 패키지 압축 풀기**

```
$ unzip awscli-bundle.zip
```

**3. 설치 프로그램 실행**

```
$ sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
```

<br/>

##### 2단계 : AWS CLI 구성하기

- 아까 저장했던 **AWS-Reko-iOS.csv** 파일에 있는 **Access Key**, **Secret Access Key**를 입력해주세요. 나머지 항목은 아래와 같이 동일하게 입력해주시면 됩니다.

```
$ aws configure
AWS Access Key ID [None]: //자신의 Access Key
AWS Secret Access Key [None]: //자신의 Secret Access Key
Default region name [None]: ap-northeast-2
Default output format [None]: json
```

> Default region name : 리전
>
> - `Default region name`은 기본적으로 요청을 전송할 서버가 있는 AWS 리전을 식별합니다. 이 리전은 일반적으로 가장 가까운 리전이지만 어떤 리전이든 될 수 있습니다. 
>
> Default output format : 출력 형식
>
> - `Default output format`은 결과의 형식을 지정하는 방법을 지정합니다.



- 아래 명령을 실행하면, [default] 항목에 설정한 Key들이 저장되어 있는 것을 확인하실 수 있습니다.

```
$ cd ~/.aws
$ cat credentials
```

![cli-4](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.39.40.png)

-----------------------

### [다음 목차]

- [node.js로 RESTAPI 만들기]()
- [EC2에 서버 배포하기]()
- [iOS 네트워크 통신하기]()
- [삭제 가이드]()