//
//  APIService.swift
//  ExpressionRekognitionMusicService
//
//  Created by 김예은 on 14/07/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

/* protocol은 인터페이스입니다. 최소한으로 가져야 할 속성이나 메서드를 정의합니다.
구현은 하지 않습니다. 진짜로 정의만 합니다.*/
protocol APIService {
    
}

/* Extension은 해당 클래스를 확장하는 기능을 갖습니다. 클래스 뿐만이 아니라 다양한 요소들(구조체, 열거형 타입)을 확장시킬 수 있습니다.
 예를 들어, UIButton, UIView와 같은 View 요소들도 확장시킬 수 있고, Int, Double과 같은 타입들도 확장시킬 수 있습니다.
 확장 시킨다는 의미는 해당 요소들에 기능을 추가할 수 있다는 의미입니다.
 여기서는 APIService라는 프로토콜에 기능을 추가하였습니다.
 */

extension APIService {
    
    /* 네트워킹 통신을 할 때, 보통 하나의 서버 URL을 가지고 경로만 바뀌게 됩니다.
    네트워킹 통신 메소드마다 하나하나 주소를 넣는 번거로움을 덜기 위해 또는 주소가 바뀌었을 때, 한번에 변경할 수 있도록
    아래의 메소드를 정의하여 조금더 편리하게 통신할 수 있도록 합니다.
     */
    static func url(_ path: String) -> String {
//        return "http:// EC2퍼블릭 DNS or IPv4 퍼블릭 IP을 넣어주세요 :3000/" + path
        
        return  "http://localhost:3000/" + path
    }
}
