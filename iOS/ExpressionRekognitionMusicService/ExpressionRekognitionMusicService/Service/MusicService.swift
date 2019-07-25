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
    
    /* 아래 매개변수에 있는 completion은 클로져(고차함수) 입니다.
     @escaping이 붙어 있어 이 것은 escaping closure라고 부릅니다.
     클로져가 함수로부터 escape한다는 의미인데 해당 함수의 인자로 클로저가 전달되지만 함수가 반환된 후, 실행되는 것을 의미합니다.
     
     즉, getMusicRecommandList 함수가 반환되고 (완전히 서버로부터 값을 가져온 상태) 실행됩니다.
     저는 이 함수를 MusicViewController에서 호출할 것이기 때문에 서버에서 받은 값을 해당 뷰컨트롤러에서 사용할 수 있게됩니다.
     */
    static func getMusicRecommandList(emotion: String, completion: @escaping ([Music]) -> Void) {
        
        let URL = "http://13.125.219.247:3000/api/music?emotion=\(emotion)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData() { res in
            switch res.result {
                
            //서버 연결 성공
            case .success:
                
                /* 아래의 if-let 구문은 옵셔널 타입을 안전하게 추출하기 위해 사용합니다.
                 Optional 타입이란 값이 있을 수도 없을 수도 있는 경우를 위한 타입입니다.
                 해당 value 값은 data 형의 값이 있을 수도 없을 수도 있는 상태이기 때문에
                 안전하게 옵셔널 해제를 해주기 위해서 아래와 같은 구문을 사용하였습니다.
                 */
                
                //결과값이 있는지 확인합니다.
                if let value = res.result.value {
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        //Codable로 정의된 music 모델에 맞게 디코딩을 합니다.
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
