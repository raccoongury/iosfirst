//
//  LogVC.swift
//  1115CoreDB
//
//  Created by 503-17 on 16/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

//열거형 상수
public enum LogType:Int16{
case create = 0
case edit = 1
}

//클래스의 기능 확장을 위한 extension
extension Int16{
    func toLogType() -> String{
        switch self{
        case 0: return "생성"
        case 1: return "수정"
        default: return ""
        }
    }
}


class LogVC: UITableViewController {
    
    //상위 뷰 컨트롤러로 부터 데이터를 넘겨받을 변수
    var board:BoardMO!
    
    //테이블 뷰에 데이터를 출력할 변수
    lazy var list : [LogMO]! = {
        return self.board.log?.allObjects as! [LogMO]
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //return 0
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.list.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logcell", for: indexPath)

        //행 번호에 해당하는 데이터 가져오기
        let row = self.list[indexPath.row]
        cell.textLabel?.text = "\(row.regdate!) 에 \(row.type.toLogType()) 을 수행했습니다."

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
