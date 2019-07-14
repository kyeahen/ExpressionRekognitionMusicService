//
//  MusicService.swift
//  ExpressionRekognitionMusicService
//
//  Created by 김예은 on 14/07/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import Alamofire
import SwiftyJSON

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
//                        let JSON = res.result.value as! [[String: Any]]
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
