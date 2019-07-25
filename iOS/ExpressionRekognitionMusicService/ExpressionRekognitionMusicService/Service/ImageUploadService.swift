//
//  ImageUploadService.swift
//  ExpressionRekognitionMusicService
//
//  Created by 김예은 on 14/07/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

//해당 구조체에 프로토콜을 구현하였습니다.
struct ImageUploadService: APIService {
    
    //MARK: 표정 인식 API - POST
    
    /* 아래 매개변수에 있는 completion은 클로져(고차함수) 입니다.
     @escaping이 붙어 있어 이 것은 escaping closure라고 부릅니다.
     클로져가 함수로부터 escape한다는 의미인데 해당 함수의 인자로 클로저가 전달되지만 함수가 반환된 후, 실행되는 것을 의미합니다.
     
     즉, postImage 함수가 반환되고 (완전히 서버로부터 값을 가져온 상태) 실행됩니다.
     저는 이 함수를 MainViewController에서 호출할 것이기 때문에 서버에서 받은 값(emotion)을
     해당 뷰컨트롤러에서 사용할 수 있게됩니다.
     */
    static func postImage(image: UIImage, completion: @escaping (_ result: String) -> Void) {
        
        //앞서 APIService에 정의했던 메소드를 사용하여 경로만 추가합니다.
        let URL = url("api/rekognition")
        
        //업로드하는 이미지는 Data 인스턴스로 변환시켜야 합니다.
        let imageData = image.jpegData(compressionQuality: 0.3)
        
        //multipart, stream, file, data method를 사용하여 파일을 업로드 합니다.
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            //JPEG 데이터 부분(imageData)을 MIME multipart 요청으로 변환하여 전송합니다.
            multipartFormData.append(imageData!, withName: "image", fileName: "photo.jpg", mimeType: "image/jpeg")
            
        }, to: URL, method: .post, headers: nil) { (encodingResult) in
            
            switch encodingResult {
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _) :
                
                upload.responseData(completionHandler: {(res) in
                    
                    switch res.result {
                        
                    //업로드 성공
                    case .success :
                        
                        /* 아래의 if-let 구문은 옵셔널 타입을 안전하게 추출하기 위해 사용합니다.
                         Optional 타입이란 값이 있을 수도 없을 수도 있는 경우를 위한 타입입니다.
                         해당 value 값은 data 형의 값이 있을 수도 없을 수도 있는 상태이기 때문에
                         안전하게 옵셔널 해제를 해주기 위해서 아래와 같은 구문을 사용하였습니다.
                         */
                        
                        //결과값이 있는지 확인합니다.
                        if let value = res.result.value {
                            
                            /* SwfityJson 라이브러리를 사용하여
                             JSON 값 중 emotion에 해당하는 Value 값을 가져오는 것입니다. */
                            let emotion = JSON(value)["emotion"].string
                            
                            completion(emotion ?? "")
                        }
                        
                    //업로드 실패
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                })
                
                break
                
            //서버 연결 실패
            case .failure(let err):
                //에러를 출력해줍니다.
                print(err.localizedDescription)
            }
        }
    }
}
