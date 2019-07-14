# IAM 생성하기

Amazon Rekognition 같은 AWS 서비스를 사용하려면 액세스할 때 자격 증명을 제공해야 합니다. 이를 통해 서비스가 소유한 리소스에 액세스할 수 있는 권한이 있는지를 확인합니다.



* **IAM** 검색

![iam_search](/Users/kyeahen/Desktop/AWS-Rekognition-iOS/AWS-Rekognition-iOS/Guide/iam_search.png)



* **IAM** 생성

  목차에서 **사용자** 선택 후, **사용자 추가** 버튼을 선택해주세요.

![iam_add](/Users/kyeahen/Desktop/AWS-Rekognition-iOS/AWS-Rekognition-iOS/Guide/iam_add.png)

<br/>

##### 1단계 : 사용자 세부 정보 설정

	- <u>사용자 이름</u>은 아래와 같이 **AWS-Reko-iOS**로 설정해주세요.
	
	- <u>AWS 액세스 유형</u>은 **AWS-Reko-iOS**를 선택해주세요.

![스크린샷 2019-07-13 오후 3.59.51](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 3.59.51.png)

<br/>

##### 2단계 : 권한 추가

	- **기존 정책 직접 연결**을 선택한 후, **다음**을 클릭해주세요.

![스크린샷 2019-07-13 오후 4.04.06](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.04.06.png)

<br/>

* 아래 3개의 정책을 **추가**해주세요.

> - **AmazonRekognitionFullAccess** – 모음 생성 및 삭제를 포함하여 Amazon Rekognition 리소스에 대한 모든 액세스 권한을 부여합니다.
> - **AmazonRekognitionReadOnlyAccess** – Amazon Rekognition 리소스에 대한 읽기 전용 액세스 권한을 부여합니다.
> - **AmazonRekognitionServiceRole** – Amazon Rekognition은 Amazon Kinesis Data Streams 및 Amazon SNS 서비스를 자동으로 호출할 수 있습니다.

<br/>

* 3개의 정책을 모두 추가하셨으면 **다음**을 클릭해주세요.

![스크린샷 2019-07-13 오후 4.29.23](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.29.23.png)

<br/>

#####3단계 : 태그 추가 (선택사항)

* **다음**을 클릭해주세요.

![스크린샷 2019-07-13 오후 4.31.01](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.31.01.png)

<br/>

##### 4단계 : 검토

* 아래의 사진과 동일한다면 **사용자 만들기**를 클릭해주세요.

![스크린샷 2019-07-13 오후 4.33.09](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.33.09.png)

<br/>

##### 5단계 : 완료

* **.csv 파일**을 꼭! 다운로드해주세요.

![스크린샷 2019-07-13 오후 4.35.20](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.35.20.png)

<br/>

* Desktop > **IAM_Key** 폴더 생성 후, **AWS-Reko-iOS.csv**로 저장하는 것을 추천드립니다.

  해당 경로가 아니여도 자신이 기억하기 편한 폴더 및 이름으로 저장해주세요.

  ![스크린샷 2019-07-13 오후 4.39.40](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.39.40.png)



<br/>

------

<br/>

### 이씨투!!!!



------



### 2. AWS CLI 설치하기

<br/>

##### 1단계 : 번들 설치 관리자를 사용하여 AWS CLI 설치

**1.  [AWS CLI 번들 설치 관리자](https://s3.amazonaws.com/aws-cli/awscli-bundle.zip) 다운로드하기**

​	자신이 알아볼 수 있는 경로에 저장하시면 됩니다.

​	발표자는 Desktop에 저장할 예정입니다.

[터미널로 AWS CLI 번들 설치 관리자 다운로드 하기]

```
$ curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
```

<br/>

**2. 패키지 압축 풀기**

```
$ unzip awscli-bundle.zip
```

<br/>

![스크린샷 2019-07-13 오후 4.55.49](/Users/kyeahen/Desktop/aws 세미나 가이드 자료/스크린샷 2019-07-13 오후 4.55.49.png)

<br/>

**3. 설치 프로그램 실행**

```
$ sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
```

<br/>

##### 2단계 : AWS CLI 구성하기

* 아까 저장했던 **AWS-Reko-iOS.csv** 파일에 있는 **Access Key**, **Secret Access Key**를 입력해주세요. 나머지 항목은 아래와 같이 동일하게 입력해주시면 됩니다.

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
> * `Default output format`은 결과의 형식을 지정하는 방법을 지정합니다.

<br/>

* 아래 명령을 실행하면, [default] 항목에 설정한 Key들이 저장되어 있는 것을 확인하실 수 있습니다.

```
$ cd ~/.aws
$ cat credentials
```

<br/>

------

**[다음 목차]**



