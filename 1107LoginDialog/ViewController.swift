//
//  ViewController.swift
//  1107LoginDialog
//
//  Created by 503-17 on 07/11/2018.
//  Copyright © 2018 the. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    //화면에 뷰가 보여질 때 보여지는 메소드
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        if appDelegate.session == nil{
            print("로그인이 안된 상태 입니다.")
        }else{
            print("\(appDelegate.session!)님 로그인 되어 있습니다.")
        }
    }
    
    @IBOutlet weak var result: UILabel!
    @IBAction func login(_ sender: Any) {
        //자신의 앱에 있는 AppDelegate 클래스의 객체에 접근
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        //공유 변수를 nil로 설정
        appDelegate.session = nil
        
        //대화상자를 생성
        let loginDialog = UIAlertController.init(title: nil, message: "로그인", preferredStyle: .alert)
        //텍스트 필드 추가 : handler는 텍스트 필드의 모양을 설정
        loginDialog.addTextField(configurationHandler: {
            (tf) in tf.placeholder = "아이디를 입력하세요"
            tf.isSecureTextEntry = false
        })
        loginDialog.addTextField(configurationHandler: {
            (tf) in tf.placeholder = "비밀번호를 입력하세요"
            tf.isSecureTextEntry = true
        })
        
        let cancel = UIAlertAction.init(title: "취소", style: .cancel)
        let ok = UIAlertAction.init(title: "확인", style: .default)
        {
            (btn) in
            //첫번째 텍스트 필드와 두번째 텍스트 필드의 입력내용을 가져오기
            let loginid = loginDialog.textFields?[0].text
            let loginpw = loginDialog.textFields?[1].text
            
            //id 와 pw를 비교해서 로그인 여부 결정
            if loginid == "root" && loginpw == "1234"{
                self.result.text = "로그인에 성공하셨습니다."
                //자신의 앱에 있는 AppDelegate 클래스의 객체에 접근
                let appDelegate =
                    UIApplication.shared.delegate as! AppDelegate
                //공유 변수를 nil로 설정
                appDelegate.session = loginid
            }else{
                self.result.text = "없는 아이디 이거나 비밀번호가 잘못되었습니다."
            }
        }
        //버튼을 대화상자에 부착
        loginDialog.addAction(cancel)
        loginDialog.addAction(ok)
        //화면에 출력
        self.present(loginDialog, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
