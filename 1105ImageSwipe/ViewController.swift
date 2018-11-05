//
//  ViewController.swift
//  1105ImageSwipe
//
//  Created by 503-17 on 05/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //스크롤 뷰를 생성
        let scrollView = UIScrollView.init(frame: CGRect.init(x: 60, y: 60, width: 200, height: 300))
        //스크롤 뷰에 배치될 ContentView
        //가로로 8배
        let contentView =
            UIView.init(frame: CGRect.init(x: 0, y: 0, width: 1600, height: 300))
        
        //내용이 되는 뷰에 이미지 뷰들을 추가
        var total = 0
        for i in 0...5{
            //x 좌표를 200씩 옮기면서 ImageView를 생성
            let imageView = UIImageView(frame:CGRect(x:total, y:0, width:200, height:300))
            //print("이미지 뷰:\(imageView.frame)")
            total = total + 200
            //imageView에 이미지 설정
            imageView.image = UIImage(named: "fruit\(i).jpg")
            print("fruit\(i).jpg")
            //contentView에 imageView를 추가
            contentView.addSubview(imageView)
        }
        
        
        //contentView를 scrollView 위에 배치
        scrollView.addSubview(contentView)
        //scrollView에서 스크롤을 사용할 수 있도록 설정
        scrollView.isScrollEnabled = true
        //스와이프 할 때 페이지 단위로 이동하도록 설정
        scrollView.isPagingEnabled = true
        //스크롤 뷰의 화면 사이즈 설정
        scrollView.contentSize = contentView.frame.size
        //scrollView를 현재 화면 위에 배치
        self.view.addSubview(scrollView)
    }
}
