//
//  ViewController.swift
//  1102clock
//
//  Created by 503-17 on 02/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController { 
    //타이머가 수행할 메소드
    @objc func timerProc(){
        //현재 날짜 가져오기
        let date = Date()
        //날짜를 문자열로 변경하기 위한 클래스의 객체 만들기
        let fomatter = DateFormatter()
        //문자열 형식 만들기
        fomatter.dateFormat = "yyyy-MM-dd ccc hh:mm:ss"
        //레이블에 날짜를 문자열로 변경해서 출력
        label.text = fomatter.string(from: date)
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1,
                             target:self,
                             selector:#selector(timerProc),
                             userInfo:nil,
                             repeats:true)
        
    }
    
    
}


