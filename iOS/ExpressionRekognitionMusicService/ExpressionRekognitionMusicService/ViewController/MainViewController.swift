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

    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: 사진 선택 액션 - ActionSheet
    @IBAction func openCameraAction(_ sender: UITapGestureRecognizer) {
        
        /* UIAlertController는 alert(우리가 흔히 보는 팝업창), actionSheet을 지원합니다.
        우리는 actionSheet을 사용할 것이기 때문에 actionSheet Style의 UIAlertController 객체를 생성합니다. */
        
        let actionSheet = UIAlertController(title: "", message: "방법을 선택해주세요.", preferredStyle: .actionSheet)
        
        /* ActionSheet에서 사용할 Action을 정의합니다.
        Action Style는 default, cancle, destructive를 지원합니다. */
        let cameraAction = UIAlertAction(title: "사진 촬영", style: .default, handler : {
            (action) in
            
            //handler에는 해당 Action을 누르면 동작해야할 코드를 작성합니다.
            self.openCamera()
        })
        let galleryAction = UIAlertAction(title: "앨범에서 사진 선택", style: .default, handler : {
            (action) in
            
            //handler에는 해당 Action을 누르면 동작해야할 코드를 작성합니다.
            self.openGallery()
        })
        //취소 액션에는 딱히 동작할 코드가 없기 때문에 그냥 nil로 설정합니다.
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        //ActionSheet 객체에 위에서 정의한 3개의 액션을 추가합니다.
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(galleryAction)
        actionSheet.addAction(cancelAction)
        
        //화면에 ActionSheet을 띄웁니다.
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    //MARK: 음악 추천 액션
    @IBAction func musicRecommendAction(_ sender: UIButton) {

        /* 여기에서 Flag 변수 값을 사용한 이유는
        사진을 선택하지 않았을 시에는 서버 통신을 미리 방지하여 400대 에러를 예방하기 위함입니다. */
        
        if imagePickerFlag == false {
            let alert = UIAlertController(title: "", message: "사진을 선택해주세요.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            postImage()
        }
    }
    
}


/* Extension은 해당 클래스를 확장하는 기능을 갖습니다. 클래스 뿐만이 아니라 다양한 요소들(구조체, 열거형 타입)을 확장시킬 수 있습니다.
예를 들어, UIButton, UIView와 같은 View 요소들도 확장시킬 수 있고, Int, Double과 같은 타입들도 확장시킬 수 있습니다.
확장 시킨다는 의미는 해당 요소들에 기능을 추가할 수 있다는 의미입니다.
저는 해당 클래스에 네트워킹, 이미지피커 부분으로 기능적으로 분류하기 위해 Extension을 사용했습니다. */

//MARK: 네트워킹 Extension
extension MainViewController {
    
    //MARK: 이미지 업로드 - POST
    //Rekognition 서버에 이미지를 업로드하여 가장 높은 표정 값을 반환받습니다.
    func postImage() {
        ImageUploadService.postImage(image: imageView.image!) {
            (result) in
            
            //성공적인 emotion 값을 받았을 시에는 음악 추천 View를 보여주도록 합니다.
            if result != "none" {
                let musicVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MusicViewController") as! MusicViewController
                musicVC.emotion = result
                self.navigationController?.pushViewController(musicVC, animated: true)
            }
            
            /* 사진 분석이 불가능하여 성공적인 emtion 값을 받지 못했을 시에는 아래의 팝업창을 띄웁니다.
            인물 사진이 아닐 시에는 Rekognition이 FaceDetail을 빈 배열 값으로 반환하게 됩니다.
            그래서 서버 쪽에서 FaceDetail의 값이 비었을 시에는 emotion 값에 "none" 값을 넣어줬습니다. */
                
            else {
                let alert = UIAlertController(title: "", message: "인물 사진을 선택해주세요.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

//MARK: 이미지 첨부 Extension
extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Method : 갤러리를 여는 함수
    @objc func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.delegate = self
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: { print("이미지 피커 나옴") })
        }
    }
    
    //Method : 카메라를 여는 함수
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
