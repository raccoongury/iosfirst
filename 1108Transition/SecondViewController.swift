//
//  SecondViewController.swift
//  1108Transition
//
//  Created by 503-17 on 08/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    //상위 뷰 컨트롤러로부터 넘겨받을 데이터 프로퍼티
    var data : String = ""
    
    @IBOutlet weak var lblSecond: UILabel!
    @IBAction func movePrev(_ sender: Any) {
        //이전 화면으로 돌아가기
        var parent = self.presentingViewController as! ViewController
        //데이터 넘겨주기
        parent.name = "홍콩반점"
        //현재 화면 제거
        parent.dismiss(animated:true)

        
        //self.presentingViewController?.dismiss(animated:true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //넘겨받은 데이터를 레이블에 출력
        lblSecond.text = data

        // Do any additional setup after loading the view.
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
