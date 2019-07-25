//
//  Music.swift
//  ExpressionRekognitionMusicService
//
//  Created by 김예은 on 14/07/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

/* Swift4부터 추가된 프로토콜입니다.
 외부표현식 처리를 손쉽게 할 수 있도록 도와줍니다.
 저희는 서버에서 JSON 형식으로 반환해주기 때문에 Codable이 JSON 변환 처리를 해주는 것입니다.
 서버 측의 Key값과 Type 값을 정확하게 입력해주어야 알맞은 변환이 가능합니다.
 */
struct Music: Codable {
    let id : Int
    let singer : String
    let title : String
    let emotion : String
    let image : String
    let url : String
}
