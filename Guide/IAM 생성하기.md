# IAM 생성하기

Amazon Rekognition 같은 AWS 서비스를 사용하려면 액세스할 때 자격 증명을 제공해야 합니다. <br/>
이를 통해 서비스가 소유한 리소스에 액세스할 수 있는 권한이 있는지를 확인합니다.



* **IAM** 검색

![iam_search](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam_search.png)



* **IAM** 생성

  목차에서 **사용자** 선택 후, **사용자 추가** 버튼을 선택해주세요.

![iam_add](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam_add.png)

<br/>

### 1단계 : 사용자 세부 정보 설정

- <u>사용자 이름</u>은 아래와 같이 **AWS-Reko-iOS**로 설정해주세요.
- <u>AWS 액세스 유형</u>은 **AWS-Reko-iOS**를 선택해주세요.

![iam1](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam1.png)

<br/>

### 2단계 : 권한 추가

- **기존 정책 직접 연결**을 선택한 후, **다음**을 클릭해주세요.

![iam2](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam2.png)

<br/>

* 아래 3개의 정책을 **추가**해주세요.

> - **AmazonRekognitionFullAccess** – 모음 생성 및 삭제를 포함하여 Amazon Rekognition 리소스에 대한 모든 액세스 권한을 부여합니다.
> - **AmazonRekognitionReadOnlyAccess** – Amazon Rekognition 리소스에 대한 읽기 전용 액세스 권한을 부여합니다.
> - **AmazonRekognitionServiceRole** – Amazon Rekognition은 Amazon Kinesis Data Streams 및 Amazon SNS 서비스를 자동으로 호출할 수 있습니다.

<br/>

* 3개의 정책을 모두 추가하셨으면 **다음**을 클릭해주세요.

![iam2-1](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam2-1.png)

<br/>

### 3단계 : 태그 추가 (선택사항)

* **다음**을 클릭해주세요.

![iam3](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam3.png)

<br/>

### 4단계 : 검토

* 아래의 사진과 동일한다면 **사용자 만들기**를 클릭해주세요.

![iam4](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam4.png)

<br/>

### 5단계 : 완료

* **.csv 파일**을 꼭! 다운로드해주세요.

![iam5](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam5.png)

<br/>

* Desktop > **IAM_Key** 폴더 생성 후, **AWS-Reko-iOS.csv**로 저장하는 것을 추천드립니다.

  해당 경로가 아니여도 자신이 기억하기 편한 폴더 및 이름으로 저장해주세요.

  ![스크린샷 2019-07-13 오후 4.39.40](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.39.40.png)



<br/>

------

### [다음 목차]

- [AWS EC2 생성하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/AWS%20EC2%20%EC%83%9D%EC%84%B1%ED%95%98%EA%B8%B0.md)
- [EC2에 AWS CLI 설치하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/EC2%EC%97%90%20AWS%20CLI%20%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0.md)
- [node.js로 RESTAPI 만들기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/node.js%EB%A1%9C%20API%20%EB%A7%8C%EB%91%98%EA%B8%B0.md)
- [EC2에 서버 배포하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/EC2%EC%97%90%20%EC%84%9C%EB%B2%84%20%EB%B0%B0%ED%8F%AC%ED%95%98%EA%B8%B0.md)
- [iOS 네트워크 통신하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/iOS%20%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%82%B9%20%ED%86%B5%EC%8B%A0%ED%95%98%EA%B8%B0.md)
- [삭제 가이드]()





