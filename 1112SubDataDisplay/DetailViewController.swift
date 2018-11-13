//
//  DetailViewController.swift
//  1112SubDataDisplay
//
//  Created by 503-17 on 13/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

//WebKitView를 사용하기 위한 import
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    //웹 주소를 넘겨받을 변수 생성
    var address : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //swift에서는 변수에 값을 대입할 때 nil 이 대입되면 false
        //그리고 데이터가 대입되면 true가 리턴됩니다.
        //if 참조형변수 != null{}
        if let addr = address{
            //URL 객체 생성
            let webURL = URL(string:addr)
            //Request 객체 생성
            let urlRequest = URLRequest(url:webURL!)
            //웹 뷰가 로딩
            webView.load(urlRequest)
            print(address!)
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
