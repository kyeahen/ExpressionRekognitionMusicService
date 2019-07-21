//
//  MusicViewController.swift
//  ExpressionRekognitionMusicService
//
//  Created by 김예은 on 13/07/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit
import Kingfisher

class MusicViewController: UIViewController {
    
    @IBOutlet weak var musicCollectionView: UICollectionView!
    @IBOutlet weak var emtionLabel: UILabel!
    
    var emotion: String = ""
    var musicList: [Music] = [Music]() //서버에서 받아온 음악 리스트를 담을 배열입니다.

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        /* 일반 ViewController에 UICollectionViewDelegate, UICollectionViewDataSource를 상속받은 상태이기 때문에
        collectionView 객체에 아래와 같은 설정을 해주어야 연결이 됩니다.
        흔히 "대리자 위임"이라고 합니다.*/
        self.musicCollectionView.delegate = self
        self.musicCollectionView.dataSource = self
        
        //이전 뷰에서 전달받는 감정 값을 받아 화면에 보여줍니다.
        emtionLabel.text = emotion
        
        //네트워킹 함수
        getMusicList()
    }
    
    
    //MARK: View Life Cycle
    /* View가 나타날 것이라고 컨트롤러에게 알리는 역할을 합니다.
     View가 나타나기 직전 호출되는 메소드입니다.
     화면이 보여질 때마다 호출됩니다. */
    override func viewWillAppear(_ animated: Bool) {
        getMusicList()
    }
    
    //MARK: 추천 뮤직 리스트 불러오기 - GET
    func getMusicList() {
        MusicService.getMusicRecommandList(emotion: emotion) { (music) in
            self.musicList = music
            self.musicCollectionView.reloadData()
        }
    }
}

//MARK:
extension MusicViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK : CollectionView DataSource
    
    //MARK: 컬렉션 뷰 셀 개수를 반환하는 함수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
    //MARK: 각 컬렉션 뷰 셀 요소에 맞는 내용을 반환하는 함수
    //해당 컬렉션 뷰 셀은 앨범 사진, 곡 제목, 가수 이름으로 구성되어 있고 그에 해당하는 데이터들이 인덱스에 맞게 배치됩니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCollectionViewCell", for: indexPath) as! MusicCollectionViewCell
        
        cell.albumImageView.kf.setImage(with: URL(string: musicList[indexPath.row].image), placeholder: UIImage())
        cell.titleLabel.text = musicList[indexPath.row].title
        cell.singerLabel.text = musicList[indexPath.row].singer
        
        return cell
    }
    
    //MARK: 셀을 클릭했을 때, 이벤트 처리를 하는 함수
    //음악을 클릭했을 때, 해당 음악에 맞는 유튜브를 보여주는 ViewController로 이동합니다.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let youtubeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "YoutubeViewController") as! YoutubeViewController
        
        youtubeVC.url = musicList[indexPath.row].url
        
        self.navigationController?.pushViewController(youtubeVC, animated: true)
    }
    
}
