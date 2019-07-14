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
    
    @IBOutlet weak var musicCollectionView: UICollectionView! {
        didSet {
            self.musicCollectionView.reloadData()
        }
    }
    @IBOutlet weak var emtionLabel: UILabel!
    
    var emotion: String = ""
    var musicList = [Music]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.musicCollectionView.delegate = self
        self.musicCollectionView.dataSource = self
        
        emtionLabel.text = emotion
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
    
    //MARK:
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
    //MARK:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCollectionViewCell", for: indexPath) as! MusicCollectionViewCell
        
        cell.albumImageView.kf.setImage(with: URL(string: musicList[indexPath.row].image), placeholder: UIImage())
        cell.titleLabel.text = musicList[indexPath.row].title
        cell.singerLabel.text = musicList[indexPath.row].singer
        
        return cell
    }
    
}
