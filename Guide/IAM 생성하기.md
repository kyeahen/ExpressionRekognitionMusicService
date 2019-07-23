# IAM 생성하기

### IAM(Identitiy & Access Management)

> AWS 리소스에 대한 액세스를 안전하게 관리할 수 있게 해주는 서비스로
>
> AWS 사용자 및 그룹을 만들고 관리하며, 권한을 사용해 AWS 리소스에 대한 액세스를 허용 및 거부할 수 있습니다.

<br/>

저희는 이번 실습에서 표정 인식 기술을 사용하기 위해 AWS Rekognition을 사용하게 됩니다.

이러한 AWS 서비스를 사용하려면 액세스 할 때, 자격 증명을 제공해야 합니다.

이를 통해, 사용자가 서비스가 소유한 리소스에 액세스 할 수 있는 권한이 있는지를 확인합니다.

그렇기 때문에, IAM을 생성하는 것입니다!

<br/>

------

<br/>

본격적으로 IAM을 만들어보도록 하겠습니다.

아래 과정을 잘 따라와주세요!🤗

<br/>

* **IAM**을 검색해주세요.

![iam_search](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam_search.png)



* **IAM** 생성하도록 하겠습니다.

  목차에서 **사용자** 선택 후, **사용자 추가** 버튼을 선택해주세요.

![iam_add](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam_add.png)

<br/>

## ❗️1단계 : 사용자 세부 정보 설정

- 사용자 이름은 아래와 같이 **AWS-Reko-iOS**로 설정해주세요.
- AWS 액세스 유형은 **프로그래밍 방식 액세스**를 선택해주세요.

![iam1](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam1.png)

<br/>

## ❗️2단계 : 권한 추가

- **기존 정책 직접 연결**을 선택해주세요.

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

## ❗️3단계 : 태그 추가 (선택사항)

* **다음**을 클릭해주세요.

![iam3](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam3.png)

<br/>

## ❗️4단계 : 검토

* 아래의 사진과 동일한다면 **사용자 만들기**를 클릭해주세요.

![iam4](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam4.png)

<br/>

## ❗️5단계 : 완료

* **.csv 파일**을 꼭! 다운로드해주세요. 지금이 다운받을 수 있는 마지막 기회입니다.

* IAM 사용자 이름과 동일한 파일명인 **AWS-Reko-iOS.csv**로 저장하는 것을 추천드립니다.

  자신이 기억할 수 있는 폴더에 저장해주세요!

  다음 목차에서 해당 파일을 사용할 예정입니다.

![iam5](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iam5.png)

<br/>



## 🚩 다음 목차

- [AWS EC2 생성하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/AWS%20EC2%20%EC%83%9D%EC%84%B1%ED%95%98%EA%B8%B0.md)
- [EC2에 AWS CLI 설치하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/EC2%EC%97%90%20AWS%20CLI%20%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0.md)
- [EC2에 서버 배포하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/EC2%EC%97%90%20%EC%84%9C%EB%B2%84%20%EB%B0%B0%ED%8F%AC%ED%95%98%EA%B8%B0.md)
- [iOS 네트워크 통신하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/iOS%20%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%82%B9%20%ED%86%B5%EC%8B%A0%ED%95%98%EA%B8%B0.md)
- [삭제 가이드](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/%EC%82%AD%EC%A0%9C%20%EA%B0%80%EC%9D%B4%EB%93%9C.md)





