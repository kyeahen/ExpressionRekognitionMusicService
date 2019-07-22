//
//  YoutubeViewController.swift
//  ExpressionRekognitionMusicService
//
//  Created by 김예은 on 20/07/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class YoutubeViewController: UIViewController {

    @IBOutlet weak var playerView: WKYTPlayerView!
        
    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //이전 뷰에서 전달받은 url로 유튜브를 로드합니다.
        playerView.load(withVideoId: url)
    }
    
}
