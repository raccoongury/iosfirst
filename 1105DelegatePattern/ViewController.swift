//
//  ViewController.swift
//  1105DelegatePattern
//
//  Created by 503-17 on 05/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tf dp 이벤트가 발생하면 현재 클래스에서 메소드를 찾아서 실행시킵니다.(위임)
        tf.delegate = self
    }
}

//ViewController의 기능을 확장
extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        print("리턴키를 누르셨습니다.")
        
        return true
    }
}
