# iOS 네트워킹 통신하기

✅ 앞서 다운받은 프로젝트 파일에서 **iOS 폴더**로 이동하면 제가 만들어놓은 iOS 프로젝트가 있습니다.

![ios_path](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iOS-2.png)

​	  다운받지 않으신 분들은 지금 다운받아주세요!

​	 ‼️ [iOS 프로젝트 다운받기](https://github.com/kyeahen/ExpressionRekognitionMusicService/archive/master.zip)

✅ 시간 관계 상 **네트워킹 위주**로 진행하도록 하겠습니다.

​	  View 부분이 궁금하신 분들은 세미나가 끝난 후, 따로 질문해주시면 감사하겠습니다.

<br/>

---------



### ❗️1단계 : 프로젝트 세팅하기

* 터미널 상에서 **iOS > ExpressionRekognitionMusicService**로 이동해주세요.

  이동한 후, 아래 명령어를 실행해주세요.

  라이브러리를 설치하는 과정입니다.

```
$ pod install
```

<br/>

* 파인더로 이동하면 아래와 같이 파일들이 추가되어 있습니다.

  **ExpressionRekognitionMusicService.xcworkspace** 파일을 열어주세요.

![iOS-2](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iOS-2.png)


<br/>


### ❗️2단계 : 통신 파일 작성하기

* **APIService.swift**

```swift
protocol APIService {
    
}

extension APIService {
    static func url(_ path: String) -> String {
        return "http:// EC2퍼블릭 DNS or IPv4 퍼블릭 IP을 넣어주세요 :3000/" + path
    }
}
```

<br/>

* **ImageUploadService.swift**

```swift
import UIKit
import Alamofire
import SwiftyJSON

struct ImageUploadService: APIService {
    
    //MARK: 이미지 업로드 및 표정 인식 API - POST
    static func postImage(image: UIImage, completion: @escaping (_ result: String) -> Void) {
        let URL = url(api/rekognition)

        let imageData = image.jpegData(compressionQuality: 0.3)
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            multipartFormData.append(imageData!, withName: "image", fileName: "photo.jpg", mimeType: "image/jpeg")
            
        }, to: URL, method: .post, headers: nil) { (encodingResult) in
            
            switch encodingResult {
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _) :
                
                upload.responseData(completionHandler: {(res) in
                    switch res.result {
                    case .success :
                        print("통신 성공")
                        if let value = res.result.value {
                            
                            let emotion = JSON(value)["emotion"].string
                            print(emotion)
                            completion(emotion ?? "")
                        }
                        
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                })
                
                break
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
```

  <br/>

* **Music.swift**

```swift
struct Music: Codable {
    let id : Int
    let singer : String
    let title : String
    let emotion : String
    let image : String
}
```

 <br/>

* **MusicService.swift**

  음악 추천 API는 제가 따로 구현해놓았습니다!

  제 임의대로 음악 추천을 해놓았으니 양해부탁드립니다☺️

```swift
import Alamofire

struct MusicService {
    
    //MARK: 음악 추천 리스트 API - GET
    static func getMusicRecommandList(emotion: String, completion: @escaping ([Music])->Void) {
        
        let URL = "http://ec2-13-125-219-247.ap-northeast-2.compute.amazonaws.com:3000/api/music?emotion=\(emotion)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData() { res in
            switch res.result {
            case .success:
                
                if let value = res.result.value {
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        let musicData = try decoder.decode([Music].self, from: value)
                        completion(musicData)
                        print(musicData)
                        
                    } catch {
                        print("변수 문제")
                    }
                }
                
                break
            case .failure(let err):
                print(err.localizedDescription)
                break
            }
        }
    }
}
```

  <br/>

### ❗️3단계 : 앱 실행하기

* 자신의 **디바이스**를 연결하거나 **시뮬레이터**를 선택해주세요.

![iOS3](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iOS3.png)

* **Cmd + R** 또는 아래 사진의 ▶️ 버튼을 누르면 앱이 실행됩니다.

![iOS4](https://github.com/kyeahen/ExpressionRekognitionMusicService/blob/master/Guide/images/iOS4.png)

  <br/>

### ❗️4단계 :  앱 완성

동영상 넣기

----------

<br/>

## 🚩 다음 목차

- [삭제 가이드]()



