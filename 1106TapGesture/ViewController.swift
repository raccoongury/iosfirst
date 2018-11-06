//
//  ViewController.swift
//  1106TapGesture
//
//  Created by 503-17 on 06/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //탭 동작이 발생했을 때 수행할 메소드
    @objc func tapMethod(sender:UITapGestureRecognizer){
        print("더블 클릭")
    }

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //텝 제스쳐 만들기
        let tapGesture = UITapGestureRecognizer.init(
            target: self, action: #selector(tapMethod(sender: )))
        //제약조건 설정
        tapGesture.numberOfTapsRequired = 2
        //뷰와 제스쳐 연결
        imageView.addGestureRecognizer(tapGesture)
    }


}

