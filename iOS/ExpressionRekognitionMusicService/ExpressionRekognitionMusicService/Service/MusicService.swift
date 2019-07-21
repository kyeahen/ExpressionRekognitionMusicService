//
//  MusicService.swift
//  ExpressionRekognitionMusicService
//
//  Created by 김예은 on 14/07/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import Alamofire

struct MusicService {
    
    //MARK: 음악 추천 리스트 API - GET
    static func getMusicRecommandList(emotion: String, completion: @escaping ([Music]) -> Void) {
        
        let URL = "http://ec2-13-125-219-247.ap-northeast-2.compute.amazonaws.com:3000/api/music?emotion=\(emotion)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData() { res in
            switch res.result {
                
            //서버 연결 성공
            case .success:
                
                if let value = res.result.value {
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        //music에 맞게 디코딩을 합니다.
                        let musicData = try decoder.decode([Music].self, from: value)
                        completion(musicData)
                        
                    } catch {
                        /* catch 문으로 오게되면 제대로 디코딩이 이루어지지 못한 것입니다.
                        보통 codable 실수가 대부분입니다.
                         변수명이 틀렸거나 타입 값이 일치하지 않거나 널처리를 제대로 하지 않은 이유입니다.
                        */
                        print("변수 문제")
                    }
                }
                
                break
             
            //서버 연결 실패
            case .failure(let err):
                
                //에러를 출력해줍니다.
                print(err.localizedDescription)
                break
            }
        }
    }
}
