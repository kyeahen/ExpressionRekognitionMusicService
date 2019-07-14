# 표정 인식을 통한 음악 추천 서비스

### [사전 준비 사항]

원할한 세미나 진행을 위해 사전 준비를 꼭! 해오시길 바랍니다.

1. **AWS 계정 생성**

   해당 세션은 AWS 기술을 사용할 예정이기 때문에 AWS 계정이 필요합니다.

   - AWS 계정 만들기 [이동](https://aws.amazon.com/ko/)

   본 세션의 일환으로 시작하는 모든 리소스는 AWS 계정이 12개월 미만인 경우, 제공하는 AWS 프리티어로 충분히 가능합니다. 프리티어를 넘어서는 경우, 과금 될 수도 있습니다. 따라서, 새로운 실습용 계정을 만드시길 권장합니다. 자세한 내용은 [AWS 프리 티어 페이지](https://aws.amazon.com/free/)를 참조하세요.
   
   
2. **Xcode 설치**

   해당 세션은 iOS 어플리케이션을 구현할 예정이기 때문에 Xode 설치 및 CocoaPods 설치가 필요합니다. 가이드를 참고하여 설치해주시기 바랍니다.

   - Xcode 설치하기 [이동](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/Xcode%20%EC%84%A4%EC%B9%98%20%EA%B0%80%EC%9D%B4%EB%93%9C.md)


3. **코드 편집기 설치**

   해당 세션에서 Back-End 개발 시, 코드 편집기를 사용할 예정이기 때문에 코드 편집기 설치가 필요합니다. (발표자는 **Visual Studio Code**를 사용할 예정입니다.) 

   - Visual Studio Code [설치](https://code.visualstudio.com/)  **적극 추천:-)**
   - Atom [설치](https://atom.io/)
   - Sublime Text [설치](https://www.sublimetext.com/)

------

### [사용 기술]

#### AWS

- [Rekognition](https://ap-northeast-2.console.aws.amazon.com/rekognition/home?region=ap-northeast-2#/) : 딥러닝 기반 시각 분석 서비스

  -우리는 **얼굴 분석 기술**을 사용할 예정입니다. [자세히 알아보기](https://ap-northeast-2.console.aws.amazon.com/rekognition/home?region=ap-northeast-2#/face-detection)
  
#### Front-End : iOS

- [Alamofire](https://github.com/Alamofire/Alamofire) : iOS 네트워킹 라이브러리
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) : JSON 파싱 자동화 라이브러리

#### Back-End : Node.js

- [Express](https://github.com/expressjs/express) : Web 어플리케이션 프레임워크

  -Web 응용 프로그램을 위한 기본적인 시스템이 구축되어 있습니다.

------

### [다음 목차]

- [IAM 생성하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/Rekognition%20%EC%83%9D%EC%84%B1%ED%95%98%EA%B8%B0.md)
- [EC2 생성하기](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/%EB%AC%B4%EC%A0%9C.md)
- [EC2에 AWS CLI 설치하기]()

- [node.js로 RESTAPI 만들기]()
- [EC2에 서버 배포하기]()
- [iOS 네트워크 통신하기]()
- [삭제 가이드]

