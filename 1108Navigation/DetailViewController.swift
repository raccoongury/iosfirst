//
//  DetailViewController.swift
//  1108Navigation
//
//  Created by 503-17 on 08/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var category:String=""

    override func viewDidLoad() {
        super.viewDidLoad()
        //타이트 설정
        self.title = category
        
        

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
