//
//  ViewController.swift
//  1121Album
//
//  Created by 503-17 on 21/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBAction func pick(_ sender: Any) {
        //앨범 출력
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        //미리 촬영한 이미지 가져오기
        imagePicker.sourceType = .photoLibrary
        
        //delegate 메소드 위치 설정
        imagePicker.delegate = self
        
        //화면에 출력
        self.present(imagePicker, animated: true)
    }
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
    }
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //취소를 눌렀을 때 호출되는 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        //현재 창을 닫고
        self.dismiss(animated: false){
            () in
            let alert = UIAlertController(title: "선택 취소", message: "사진 선택을 취소하셨습니다.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .cancel){(alert) in
                
            })
            
            self.present(alert, animated:  true)
            
        }
    }
    
    //사진을 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true){
            () in
            //선택한 이미지를 가져와서 imagView에 출력
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imgView.image = img
        }
    }
}
