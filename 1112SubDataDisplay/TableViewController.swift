//
//  TableViewController.swift
//  1112SubDataDisplay
//
//  Created by 503-17 on 12/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    //이미지 파일 이름을 저장할 배열
    var attractionImages = [String]()
    //레이블에 출력할 텍스트 배열
    var attractionNames = [String]()
    //하위 뷰 컨트롤러에 넘겨줄 URL 배열
    var attractionURLs = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "가보고 싶은 곳"
        attractionNames = ["금강산", "남산", "지리산", "백두산", "한라산"]
        attractionURLs = [
            "https://ko.wikipedia.org/wiki/%EA%B8%88%EA%B0%95%EC%82%B0",
            "https://ko.wikipedia.org/wiki/%EB%82%A8%EC%82%B0_(%EC%84%9C%EC%9A%B8)",
            "https://ko.wikipedia.org/wiki/%EC%A7%80%EB%A6%AC%EC%82%B0",
            "https://ko.wikipedia.org/wiki/%EB%B0%B1%EB%91%90%EC%82%B0",
            "https://ko.wikipedia.org/wiki/%ED%95%9C%EB%9D%BC%EC%82%B0"]
        attractionImages = [
        "금강산.jpeg",
        "남산.jpeg",
        "지리산.jpeg",
        "백두산.jpeg",
        "한라산.jpeg"]
        //테이블 뷰의 셀 높이 설정
        //tableView.estimatedRowHeight = 200
        
    }
    //셀의 높이를 설정하는 메소드
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }
    // MARK: - Table view data source
    
    //섹션(그룹)의 개수를 설정하는 메소드
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //섹션별 행의 개수를 설정해주는 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attractionImages.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //셀을 생성
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        //행번호에 해당하는 문자열 출력
        cell.attractionLabel.text = attractionNames[indexPath.row]
        //이미지 출력
        cell.attractionImage.image = UIImage(named: attractionImages[indexPath.row])
        
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
