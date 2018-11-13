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
        self.title = "우리나라 산"
        attractionNames = ["금강산", "남산", "지리산", "백두산", "한라산"]
        attractionURLs = [
            "http://en.wikipedia.org/wiki/Mount_Kumgang",
            "http://en.wikipedia.org/wiki/Namsan_(Seoul)",
            "http://en.wikipedia.org/wiki/Jirisan",
            "http://en.wikipedia.org/wiki/Paektu_Mountain",
            "http://en.wikipedia.org/wiki/Hallasan"]
        attractionImages = [
        "금강산.jpeg",
        "남산.jpeg",
        "지리산.jpeg",
        "백두산.jpeg",
        "한라산.jpeg"]
        //테이블 뷰의 셀 높이 설정
        //tableView.estimatedRowHeight = 200
        print(attractionNames)
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
    //테이블 뷰 에서 셀을 선택했을 때 호출되는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        //뷰 컨트롤러 객체 생성하기
        let detailViewController =
            self.storyboard?.instantiateViewController(
                withIdentifier: "DetailViewController")
                as! DetailViewController
        //타이틀 설정
        detailViewController.title = "하위 뷰 컨트롤러"
        //화면 전환
        self.navigationController?.pushViewController(
            detailViewController, animated: true)
    }
    */
    
    //세그웨이를 이용해서 화면 전환을 할 때 호출되는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //화면전환이 이루어질 뷰 컨트롤러 가져오기
        let detailViewController = segue.destination as! DetailViewController
        //선택한 행번호에 해당하는 인덱스 찾아오기
        let indexPath = tableView.indexPathForSelectedRow
        detailViewController.title = self.attractionNames[indexPath!.row]
        //행번호에 해당하는 데이터 넘겨주기
        detailViewController.address =
            self.attractionURLs[indexPath!.row]
        print(indexPath!)
        
    }
}

