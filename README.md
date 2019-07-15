# AWS 뿌시기 - 얼굴분석을 통한 표정에 알맞은 음악 추천 서비스

### 사전 준비 사항

원할한 세미나 진행을 위해 사전 준비를 꼭! 해오시길 바랍니다.

1. **AWS 계정 생성**

   해당 세션은 AWS 기술을 사용할 예정이기 때문에 AWS 계정이 필요합니다.

   - AWS 계정 만들기 [이동](https://portal.aws.amazon.com/billing/signup#/start)
- AWS 프리티어 계정 만들기 [이동](https://aws.amazon.com/ko/free)
  
   본 세션의 일환으로 시작하는 모든 리소스는 AWS 계정이 12개월 미만인 경우, 제공하는 AWS 프리티어로 충분히 가능합니다. 프리티어를 넘어서는 경우, 과금 될 수도 있습니다. 따라서, 새로운 실습용 계정을 만드시길 권장합니다. 자세한 내용은 [AWS 프리 티어 페이지](https://aws.amazon.com/free/)를 참조하세요.
   
2. **Xcode 설치**

   해당 세션은 iOS 어플리케이션을 구현할 예정이기 때문에 Xode 설치 및 CocoaPods 설치가 필요합니다. 가이드를 참고하여 설치해주시기 바랍니다.

   - Xcode 설치하기 [이동](https://github.com/AUSG/ausg-seminar-2019/tree/master/iOSTrack/Preparation)
   - CocoaPods 설치하기 [이동]()


3. **코드 편집기 설치**

   해당 세션에서 Back-End 개발 시, 코드 편집기를 사용할 예정이기 때문에 코드 편집기 설치가 필요합니다. <br/>
   (발표자는 **Visual Studio Code**를 사용할 예정입니다.) 

   - Visual Studio Code [설치](https://code.visualstudio.com/)  **적극 추천:-)**
   - Atom [설치](https://atom.io/)
   - Sublime Text [설치](https://www.sublimetext.com/)

------

### 사용 기술 소개

#### AWS

- [Rekognition](https://ap-northeast-2.console.aws.amazon.com/rekognition/home?region=ap-northeast-2#/) : 딥러닝 기반 시각 분석 서비스
- 우리는 **얼굴 분석 기술**을 사용할 예정입니다. [자세히 알아보기](https://ap-northeast-2.console.aws.amazon.com/rekognition/home?region=ap-northeast-2#/face-detection)
- [IAM](https://aws.amazon.com/ko/iam/) : AWS 리소스에 대한 액세스를 안전하게 관리할 수 있게 해주는 서비스
- [AWS CLI](https://aws.amazon.com/ko/cli/) : AWS 서비스를 관리하는 통합 도구
- [EC2](https://aws.amazon.com/ko/ec2/?nc2=h_m1) : AWS 상에서 크기를 조절 가능한 컴퓨팅 파워를 제공하는 웹 서비스
#### Front-End : iOS

- [Alamofire](https://github.com/Alamofire/Alamofire) : iOS 네트워킹 라이브러리
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) : JSON 파싱 자동화 라이브러리
- [Kingfisher](https://github.com/onevcat/Kingfisher) : 이미지 다운로드 및 캐싱 라이브러리

#### Back-End : Node.js

- [Express](https://github.com/expressjs/express) : Web 어플리케이션 프레임워크

  -Web 응용 프로그램을 위한 기본적인 시스템이 구축되어 있습니다.

------

### [다음 목차]

- [IAM 생성하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/IAM%20%EC%83%9D%EC%84%B1%ED%95%98%EA%B8%B0.md)
- [AWS EC2 생성하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/AWS%20EC2%20%EC%83%9D%EC%84%B1%ED%95%98%EA%B8%B0.md)
- [EC2에 AWS CLI 설치하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/EC2%EC%97%90%20AWS%20CLI%20%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0.md)
- [node.js로 RESTAPI 만들기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/node.js%EB%A1%9C%20API%20%EB%A7%8C%EB%91%98%EA%B8%B0.md)
- [EC2에 서버 배포하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/EC2%EC%97%90%20%EC%84%9C%EB%B2%84%20%EB%B0%B0%ED%8F%AC%ED%95%98%EA%B8%B0.md)
- [iOS 네트워크 통신하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/iOS%20%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%82%B9%20%ED%86%B5%EC%8B%A0%ED%95%98%EA%B8%B0.md)
- [삭제 가이드]()

