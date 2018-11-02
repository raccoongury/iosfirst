//
//  ViewController.swift
//  1102textfieldtest
//
//  Created by 503-17 on 02/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func move(_ sender: Any) {
        txtAge.becomeFirstResponder()
    }
    
    @IBAction func hide(_ sender: Any) {
        txtAge.resignFirstResponder()
    }
    
    //화면을 터치할 때
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtName.resignFirstResponder()
        txtAge.resignFirstResponder()
    }
    
    @IBOutlet weak var lblDisplay: UILabel!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    
    @IBAction func click(_ sender: Any) {
        let name = txtName.text
        let age = txtAge.text
        //!를 붙이지 않으면 Optional이 같이 출력됩니다.
        let msg = "이름:\(name!) 나이:\(age!)"
        
        lblDisplay.text = msg
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //텍스트 필드를 FirstResponder로 설정
        //키보드가 화면에 출력됩니다.
        txtName.becomeFirstResponder()
    }


}

