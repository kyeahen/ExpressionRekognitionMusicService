# IAM 생성하기

Amazon Rekognition 같은 AWS 서비스를 사용하려면 액세스할 때 자격 증명을 제공해야 합니다. 이를 통해 서비스가 소유한 리소스에 액세스할 수 있는 권한이 있는지를 확인합니다.



* **IAM** 검색

![iam_search](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam_search.png)



* **IAM** 생성

  목차에서 **사용자** 선택 후, **사용자 추가** 버튼을 선택해주세요.

![iam_add](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam_add.png)

<br/>

##### 1단계 : 사용자 세부 정보 설정

- <u>사용자 이름</u>은 아래와 같이 **AWS-Reko-iOS**로 설정해주세요.
- <u>AWS 액세스 유형</u>은 **AWS-Reko-iOS**를 선택해주세요.

![iam1](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 3.59.51.png)

<br/>

##### 2단계 : 권한 추가

- **기존 정책 직접 연결**을 선택한 후, **다음**을 클릭해주세요.

![iam2](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.04.06.png)

<br/>

* 아래 3개의 정책을 **추가**해주세요.

> - **AmazonRekognitionFullAccess** – 모음 생성 및 삭제를 포함하여 Amazon Rekognition 리소스에 대한 모든 액세스 권한을 부여합니다.
> - **AmazonRekognitionReadOnlyAccess** – Amazon Rekognition 리소스에 대한 읽기 전용 액세스 권한을 부여합니다.
> - **AmazonRekognitionServiceRole** – Amazon Rekognition은 Amazon Kinesis Data Streams 및 Amazon SNS 서비스를 자동으로 호출할 수 있습니다.

<br/>

* 3개의 정책을 모두 추가하셨으면 **다음**을 클릭해주세요.

![iam2-1](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.29.23.png)

<br/>

#####3단계 : 태그 추가 (선택사항)

* **다음**을 클릭해주세요.

![iam3](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.31.01.png)

<br/>

##### 4단계 : 검토

* 아래의 사진과 동일한다면 **사용자 만들기**를 클릭해주세요.

![iam4](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.33.09.png)

<br/>

##### 5단계 : 완료

* **.csv 파일**을 꼭! 다운로드해주세요.

![iam5](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.35.20.png)

<br/>

* Desktop > **IAM_Key** 폴더 생성 후, **AWS-Reko-iOS.csv**로 저장하는 것을 추천드립니다.

  해당 경로가 아니여도 자신이 기억하기 편한 폴더 및 이름으로 저장해주세요.

  ![스크린샷 2019-07-13 오후 4.39.40](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.39.40.png)



<br/>

------

### [다음 목차]

- [EC2 생성하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/%EB%AC%B4%EC%A0%9C.md)
- [EC2에 AWS CLI 설치하기]()
- [node.js로 RESTAPI 만들기]()
- [EC2에 서버 배포하기]()
- [iOS 네트워크 통신하기]()
- [삭제 가이드]()





