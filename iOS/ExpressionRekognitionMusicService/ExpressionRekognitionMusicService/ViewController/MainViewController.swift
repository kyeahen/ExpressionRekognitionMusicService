//
//  MainViewController.swift
//  ExpressionRekognitionMusicService
//
//  Created by 김예은 on 13/07/2019.
//  Copyright © 2019 kyeahen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker : UIImagePickerController = UIImagePickerController()
    var imagePickerFlag : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: 사진 선택 액션
    @IBAction func openCameraAction(_ sender: UITapGestureRecognizer) {
        
        let actionSheet = UIAlertController(title: "", message: "방법을 선택해주세요.", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "사진 촬영", style: .default, handler : {
            (action) in
            self.openCamera()
        })
        
        let galleryAction = UIAlertAction(title: "앨범에서 사진 선택", style: .default, handler : {
            (action) in
            self.openGallery()
        })
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(galleryAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    //MARK: 음악 추천 액션
    @IBAction func musicRecommendAction(_ sender: UIButton) {

        if imagePickerFlag == false {
            let alert = UIAlertController(title: "", message: "사진을 선택해주세요.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            postImage()
        }
    }
    
    //MARK: 이미지 업로드 - POST
    func postImage() {
        ImageUploadService.postImage(image: imageView.image!) {
            (result) in
            
            let musicVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MusicViewController") as! MusicViewController
            musicVC.emotion = result
            self.navigationController?.pushViewController(musicVC, animated: true)
        }
    }
}


//MARK: 이미지 첨부 Extension
extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Method
    @objc func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.delegate = self
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: { print("이미지 피커 나옴") })
        }
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.imagePicker.sourceType = .camera
            self.imagePicker.delegate = self
            self.present(self.imagePicker, animated: true, completion: { print("이미지 피커 나옴") })
        }
    }
    
    // imagePickerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("사용자가 취소함")
        self.dismiss(animated: true) {
            print("이미지 피커 사라짐")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[.editedImage] as? UIImage {
            imageView.image = editedImage
            imageView.image = editedImage
            self.imagePickerFlag = true

        } else if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
            imageView.image = selectedImage
            self.imagePickerFlag = true
        }
        
        self.dismiss(animated: true) {
            print("이미지 피커 사라짐")
        }
    }
}
