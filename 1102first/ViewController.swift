//
//  ViewController.swift
//  1102first
//
//  Created by 503-17 on 02/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func click(_ sender: Any) {
         label.text = "버튼 클릭"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

