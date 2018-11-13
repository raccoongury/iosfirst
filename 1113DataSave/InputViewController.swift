//
//  InputViewController.swift
//  1113DataSave
//
//  Created by 503-17 on 13/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    

    @IBAction func back(_ sender: Any) {
        //텍스트 필드에 입력한 내용을 AppDelegate와 UserDefaults에 저장하기
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.name = txtName.text!
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(txtEmail!.text, forKey:"email")
        
        //이전 뷰 컨트롤러에서 present 메소드로 호출 한 경우 돌아가기
        self.presentingViewController?.dismiss(animated:true, completion:nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //AppDelegate 에 대한 참조 만들기
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        txtName.text = appDelegate.name
        
        //UserDefaults 에 대한 참조 만들기
        let userDefaults = UserDefaults.standard
        if let email = userDefaults.string(forKey:"email"){
            txtEmail.text=email
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
