
import UIKit

import MapKit

class DetailTableViewController: UITableViewController {
    
    //상위 뷰 컨트롤러로부터 넘겨받을 데이터의 변수 선언
    var mapItems = [MKMapItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    //섹션의 개수를 만드는 메소드
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //섹션별 행의 개수를 설정하는 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mapItems.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        
        //행번호에 해당하는 데이터를 찾아오기
        let row = self.mapItems[indexPath.row]

        //출력하기
        cell.lblName.text = row.name
        cell.lblName.text = row.phoneNumber

        return cell
    }
    
    //셀을 선택했을 때 호출되는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //출력할 하위 뷰 컨트롤러 객체 생성
        let routeViewController = self.storyboard?.instantiateViewController(withIdentifier: "RouteViewController") as! RouteViewController
        //행 번호에 해당하는 데이터 넘겨주기
        routeViewController.detination = mapItems[indexPath.row]
        //이동
        self.navigationController?.pushViewController(
            routeViewController, animated: true)
        
    }
    
}

