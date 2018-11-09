//
//  DetailViewController.swift
//  1109Master
//
//  Created by 503-17 on 09/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

import WebKit
class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    var addr:String?
    
    //MasterViewController에서 테이블의 항목을 선택하면 호출되는 메소드
    func configureView() {
        //addr 이 없을 때는 더조은 홈페이지 출력
        if addr == nil{
            addr = "http://tjoeun.co.kr"
        }
        //문자열로 된 주소를 URL로 변환해서 웹 뷰에 출력
        let url = URL(string:addr!)
        let request = URLRequest(url:url!)
        webView.load(request)
    
        
//        // Update the user interface for the detail item.
//        if let detail = detailItem {
//            if let label = detailDescriptionLabel {
//                label.text = detail.description
//            }
//        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

