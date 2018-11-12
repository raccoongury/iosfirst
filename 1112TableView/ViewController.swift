//
//  ViewController.swift
//  1112TableView
//
//  Created by 503-17 on 12/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //데이터 배열
    var ar : [Dictionary<String, String>] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dic1 = ["name":"달", "distance":"3000", "imageName":"h1.png"]
        let dic2 = ["name":"금성", "distance":"2000", "imageName":"h2.png"]
        let dic3 = ["name":"화성", "distance":"5000", "imageName":"h3.png"]
        let dic4 = ["name":"수성", "distance":"1000", "imageName":"h4.png"]
        ar.append(dic1)
        ar.append(dic2)
        ar.append(dic3)
        ar.append(dic4)
        

        //테이블 뷰의 delegate 와 dataSource 설정
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

//ViewController의 기능확장
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    //행의 개수를 설정하는 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")as? CustomCell
        
        //데이터 찾아오기
        var dic = ar[indexPath.row]
        //찾아온 데이터를 출력
        cell!.lblName.text = dic["name"]
        cell!.lblDistance.text = dic["distance"]
        cell!.imgView1.image = UIImage(named:dic["imageName"]!)
        
        return cell!
    }
    
    //셀의 높이를 설정하는 메소드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 120
    }
}

