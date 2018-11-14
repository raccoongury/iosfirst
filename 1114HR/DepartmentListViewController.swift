//
//  DepartmentListViewController.swift
//  1114HR
//
//  Created by 503-17 on 14/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class DepartmentListViewController: UITableViewController {
    //데이터를 저장할 배열 생성
    var departList : [(departCd:Int, departTitle:String, departAddr:String)]!
    //DAO 객체 생성
    let departDAO = DepartDAO()
    
    //UI초기화 함수
    func initUI(){
        self.title = "총 \(departList.count)개"
        //네비게이션 바의 왼쪽에 편집버튼 배치
        self.navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "신규 데이터", message: "신규 데이터 작성", preferredStyle: .alert)
        //입력 필드 추가
        alert.addTextField(){(tf) in tf.placeholder="부서명"}
        alert.addTextField(){(tf) in tf.placeholder="주소"}
        //버튼 추가
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        alert.addAction(UIAlertAction(title:"확인", style: .default) {(_) in
            let title = alert.textFields?[0].text
            let addr = alert.textFields?[1].text
            //데이터 삽입
            if self.departDAO.create(title: title!, addr: addr!){
                self.departList = self.departDAO.find()
                //테이블 뷰를 다시 출력
                self.tableView.reloadData()
                //초기화 메소드 호출
                self.initUI()
            }
        })
        self.present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //데이터 가져오기
        departList = departDAO.find()
        //초기화 함수 호출
        initUI()
        //셀을 스와이프 할 때 편집모드가 되도록 설정
        tableView.allowsSelectionDuringEditing = true
    }


    // MARK: - Table view data source

    //그룹의 개수를 설정하는 메소드
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    //그룹별 행의 개수를 설정하는 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DEPART_CELL", for: indexPath)

        //행번호에 해당하는 데이터 찾아오기
        let rowData = departList[indexPath.row]
        cell.textLabel?.text = rowData.departTitle
        cell.detailTextLabel?.text = rowData.departAddr
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //삭제 버튼을 누른 행의 depart_CD 찾아오기
        let departCD = self.departList[indexPath.row].departCd
        //데이터 삭제
        if self.departDAO.remove(departCd: departCD){
            self.departList.remove(at: indexPath.row)
            //테이블 뷰의 삭제하는 애니메이션을 적용
            tableView.deleteRows(at: [indexPath], with:.top)
        }
    }


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
