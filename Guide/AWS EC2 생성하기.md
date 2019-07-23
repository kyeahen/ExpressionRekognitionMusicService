# AWS EC2 생성하기
### EC2 (Elastic Compute Cloud)

> AWS 상에서 안정적이며, 크기를 조정 가능한 컴퓨팅 파워를 제공하는 웹서비스를 말합니다.
>
> 이러한 가상화 서버(Virtual Server)를 '인스턴스(Instance)'라 부르며,
>
> 필요에 따라 한 개의 인스턴스에서 수천개의 인스턴스로 손쉽게 컴퓨팅 파워를 확장할 수 있습니다.

<br/>

오늘 세미나에서 EC2를 생성하는 이유는 Rekognition의 얼굴 분석 기술을 이용한 표정 인식 API를 

원격 서버에 올려 iOS 앱에서 사용하기 위함입니다!

<br/>

-----



* EC2에 들어가 **인스턴스 시작**을 클릭해주세요.

![ec2](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/ec2.png)

<br/>

## ❗️1단계 : Amazon Machine Image(AMI) 선택

* **Ubuntu Server 18.04 LTS (HVM), SSD Volume Type** 를 선택해주세요.

  ![ec2-1](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/ec2-1.png)

<br/>

## ❗️2단계 : 인스턴스 유형 선택

* 기본으로 선택 되어 있는 **프리티어 사용 가능** 인스턴스 유형을 선택해주세요.

![ec2-2](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/ec2-2.png)

<br/>

## ❗️3단계 : 인스턴스 세부 정보 구성

* 바로 **다음**을 클릭해주세요.

![ec2-3](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/ec2-3.png)

<br/>

## ❗️4단계 : 스토리지 추가

* 바로 **다음**을 클릭해주세요.

  ![ec2-4](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/ec2-4.png)

<br/>

## ❗️5단계 : 태그 추가

- **태그 추가**를 클릭해주세요.

![ec2-51](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/ec2-51.png)



* 키는 **Name**으로 작성해주세요.
* 값은 **aws-reko-server**로 작성해주세요.

![ec2-52](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/ec2-52.png)

<br/>

## ❗️6단계 : 보안 그룹 생성

* **규칙 추가**를 클릭해주세요.

![ec2-61](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/ec2-61.png)

* 아래 사진과 같은 **규칙 2개**를 추가한 후, **검토 시작**을 클릭해주세요.

![ec2-62](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/ec2-62.png)

<br/>

## ❗️7단계 : 인스턴스 시작 검토

* 저와 함께 잘 따라오셨다면 검토 후, **시작하기**를 클릭해주세요.

![ec2-7](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/ec2-7.png)

<br/>

## ❗️8단계 : 키페어 생성 및 선택

* **새 키페어 생성**을 선택해주세요.

* 키 페어 이름을 **aws-reko-server-key**로 설정하는 것을 추천드려요!

* 키페어 다운로드를 해주세요. **지금 다운로드 받은 후, 다시 다운로드 받으실 수 없으니 주의하세요!**

  자신이 기억할 수 있는 경로에 저장하시면 됩니다. 

* 키페어 다운로드가 완료되셨다면, **인스턴스 시작**을 클릭해주세요.

![ec2-71](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/ec2-71.png)

<br/>


## 🚩 다음 목차

- [EC2에 AWS CLI 설치하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/EC2%EC%97%90%20AWS%20CLI%20%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0.md)
- [EC2에 서버 배포하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/EC2%EC%97%90%20%EC%84%9C%EB%B2%84%20%EB%B0%B0%ED%8F%AC%ED%95%98%EA%B8%B0.md)
- [iOS 네트워크 통신하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/iOS%20%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%82%B9%20%ED%86%B5%EC%8B%A0%ED%95%98%EA%B8%B0.md)
- [삭제 가이드](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/%EC%82%AD%EC%A0%9C%20%EA%B0%80%EC%9D%B4%EB%93%9C.md)



