//
//  ListViewController.swift
//  1130Practice
//
//  Created by 503-17 on 30/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    //자신을 포함한 인스턴스에 대한 포인터
    var p : ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize.height = 250
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //행번호를 출력
        cell.textLabel!.text = "\(indexPath.row)번째 옵션"
        return cell
    }
    
    //셀을 선택했을 때 호출되는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //p가 가지고 있는 select 라는 메소드 호출
        p?.select(indexPath)
    }
}
