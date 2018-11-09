//
//  ViewController.swift
//  1109CellStyle
//
//  Created by 503-17 on 09/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //출력할 데이터 배열
    var data : [VO] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="행성 거리"
        
        let vo1 = VO()
        vo1.planet = "달"
        vo1.image = "h1.png"
        vo1.distans = "3000"
        data.append(vo1)
        
        let vo2 = VO()
        vo2.planet = "금성"
        vo2.image = "h2.png"
        vo2.distans = "2000"
        data.append(vo2)
        
        let vo3 = VO()
        vo3.planet = "화성"
        vo3.image = "h3.png"
        vo3.distans = "4000"
        data.append(vo3)
        
        let vo4 = VO()
        vo4.planet = "수성"
        vo4.image = "h4.png"
        vo4.distans = "1000"
        data.append(vo4)
        
    }


}

//테이블 뷰 출력을 위한 extension
extension ViewController : UITableViewDataSource, UITableViewDelegate{
    //셀을 클릭했을 때 호출되는 메소드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(indexPath)
    }
    //섹션별 행의 개수를 설정하는 메소드 - 필수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return data.count
    }
    
    //셀을 만들어주는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //재사용이 가능한 셀이 있으면 그 셀을 이용
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil{
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "Cell")
        }
        
        //배열에서 행번호에 해당하는 데이터 찾아오기
        let sub : VO = data[indexPath.row]
        cell?.textLabel?.text = sub.planet
        cell?.detailTextLabel?.text = sub.distans
        cell?.imageView?.image = UIImage(named: sub.image)
        
        return cell!
    }
}
