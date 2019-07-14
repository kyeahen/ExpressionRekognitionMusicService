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

struct ImageUploadService {
    
    //MARK: 표정 인식 API
    static func postImage(image: UIImage, completion: @escaping (_ result: String) -> Void) {
        let URL = "http://13.125.249.142:3000/api/rekognition"

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


