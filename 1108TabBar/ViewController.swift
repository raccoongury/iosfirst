//
//  ViewController.swift
//  1108TabBar
//
//  Created by 503-17 on 08/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
    }
}

extension ViewController : UITabBarControllerDelegate{
    //탭 바의 항목을 누른 후 호출되는 메소드
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
        print("\(tabBarController.selectedIndex)번 뷰 컨트롤러 선택")
    }
}

