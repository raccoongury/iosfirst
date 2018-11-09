//
//  ViewController.swift
//  1109TableView2
//
//  Created by 503-17 on 09/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    //테이블 뷰에 출력할 데이터 배열 선언
    var names : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        names.append("피카츄")
        names.append("라이츄")
        names.append("파이리")
        names.append("꼬부기")
        names.append("버터플")
        names.append("야도란")
        names.append("피존투")
        names.append("또가스")
        
        //테이블 뷰의 delegate 와 dataSource 지정
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//테이블 뷰 관련 메소드
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    //섹션 별 행의 개수를 리턴하는 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    //셀을 생성해주는 메소드
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //재사용 가능한 셀을 가져오기
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        //재사용 가능한 셀이 없으면 셀을 새로 생성
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        //셀의 레이블에 names 배열의 데이터를 출력
        cell?.textLabel!.text = names[indexPath.row]
        return cell!
    }
}



