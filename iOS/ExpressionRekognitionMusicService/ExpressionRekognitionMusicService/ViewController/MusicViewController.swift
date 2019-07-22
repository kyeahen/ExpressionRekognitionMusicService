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
    
    //MARK: View Life Cycle
    
    /* ViewController가 메모리에 로드되고 난 후, 호출됩니다.
     해당 메소드는 뷰의 로딩이 완료되었을 때, 시스템에 의해 자동으로 호출되기 때문에
     일반적으로 리소스를 초기화하거나 초기 화면을 구성하는 용도로 주로 사용합니다.
     화면이 처음 만들어질 때, 한번만 실행됩니다. */
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        setCollecionView()
        
        //이전 뷰에서 전달받는 감정 값을 받아 화면에 보여줍니다.
        emtionLabel.text = emotion
        
        //네트워킹 함수
        getMusicList()
    }
    
    func setCollecionView() {
        /* 일반 ViewController에 UICollectionViewDelegate, UICollectionViewDataSource를 상속받은 상태이기 때문에
         collectionView 객체에 아래와 같은 설정을 해주어야 연결이 됩니다.
         흔히 "대리자 위임"이라고 합니다.*/
        self.musicCollectionView.delegate = self
        self.musicCollectionView.dataSource = self
    }
    
}

//MARK: 네트워킹 Extension
extension MusicViewController {
    
    //MARK: 추천 뮤직 리스트 불러오기 - GET
    func getMusicList() {
        
        /* completion에 보낸 emotion 값을 music이라는 변수로 받아 사용합니다.
         변수명은 이름은 원하시는대로 지으셔도 상관없습니다.
         */
        MusicService.getMusicRecommandList(emotion: emotion) { (music) in
            /* 받아온 데이터 값을 우리가 만든 배열에 넣어줍니다.
             컬렉션 뷰에 데이터를 넣어주기 위해서 입니다. */
            self.musicList = music
            
            /* 컬렉션 뷰의 행, 섹션을 다시 로드하기 위한 함수입니다.
             통신 후에 받은 데이터들로 컬렉션 뷰를 구성하기 위해서 다시 로드해줍니다. */
            self.musicCollectionView.reloadData()
        }
    }
}

//MARK:CollectionView DataSource Extension
extension MusicViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: 컬렉션 뷰 셀 개수를 반환하는 함수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
    //MARK: 각 컬렉션 뷰 셀 요소에 맞는 내용을 반환하는 함수
    //해당 컬렉션 뷰 셀은 앨범 사진, 곡 제목, 가수 이름으로 구성되어 있고 그에 해당하는 데이터들이 인덱스에 맞게 배치됩니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCollectionViewCell", for: indexPath) as! MusicCollectionViewCell
        
        //Kingfisher 라이브러리를 사용하여 이미지를 로드합니다.
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
