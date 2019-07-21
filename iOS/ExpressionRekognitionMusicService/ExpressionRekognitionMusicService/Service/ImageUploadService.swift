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
    
    //MARK: 표정 인식 API
    static func postImage(image: UIImage, completion: @escaping (_ result: String) -> Void) {
        
        //앞서 APIService에 정의했던 메소드를 사용하여 경로만 추가합니다.
        let URL = url("api/rekognition")

        let imageData = image.jpegData(compressionQuality: 0.3)
        
        //MultipartFormData 통신
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            multipartFormData.append(imageData!, withName: "image", fileName: "photo.jpg", mimeType: "image/jpeg")
            
        }, to: URL, method: .post, headers: nil) { (encodingResult) in
            
            switch encodingResult {
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _) :
                
                upload.responseData(completionHandler: {(res) in
                    switch res.result {
                        
                    //서버 연결 성공
                    case .success :
                        if let value = res.result.value {
                            
                            //JSON 값 중 emotion에 해당하는 Value 값을 가져오는 것입니다.
                            let emotion = JSON(value)["emotion"].string
                            
                            completion(emotion ?? "")
                        }
                        
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                })
                
                break
                
            //서버 연결 실패
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    
}


