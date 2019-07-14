//
//  APIService.swift
//  ExpressionRekognitionMusicService
//
//  Created by 김예은 on 14/07/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

protocol APIService {
    
}

extension APIService {
    static func url(_ path: String) -> String {
        return "http:// EC2퍼블릭 DNS or IPv4 퍼블릭 IP을 넣어주세요 :3000/" + path
    }
}
