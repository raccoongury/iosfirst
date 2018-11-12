//
//  ViewController.swift
//  1112Grouping
//
//  Created by 503-17 on 12/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //출력할 문자열을 저장할 변수
    var data:Array<String> = []
    //분류한 데이터들을 저장할 변수
    var sectionData:Array<Dictionary<String,Any>> = []
    //분류할 때 사용할 한글 자음 배열
    var indexes:Array<String> = []
    
    //문자열을 매개변수로 받아서 첫글자의 자음을 리턴하는 메소드
    func subtract(data:String) -> String{
        var result = data.compare("나")
        if result == ComparisonResult.orderedAscending{
            return "ㄱ"
        }
        result = data.compare("다")
        if result == ComparisonResult.orderedAscending{
            return "ㄴ"
        }
        result = data.compare("라")
        if result == ComparisonResult.orderedAscending{
            return "ㄷ"
        }
        result = data.compare("마")
        if result == ComparisonResult.orderedAscending{
            return "ㄹ"
        }
        result = data.compare("바")
        if result == ComparisonResult.orderedAscending{
            return "ㅁ"
        }
        result = data.compare("사")
        if result == ComparisonResult.orderedAscending{
            return "ㅂ"
        }
        result = data.compare("아")
        if result == ComparisonResult.orderedAscending{
            return "ㅅ"
        }
        result = data.compare("자")
        if result == ComparisonResult.orderedAscending{
            return "ㅇ"
        }
        result = data.compare("차")
        if result == ComparisonResult.orderedAscending{
            return "ㅈ"
        }
        result = data.compare("카")
        if result == ComparisonResult.orderedAscending{
            return "ㅊ"
        }
        result = data.compare("타")
        if result == ComparisonResult.orderedAscending{
            return "ㅋ"
        }
        result = data.compare("파")
        if result == ComparisonResult.orderedAscending{
            return "ㅌ"
        }
        result = data.compare("하")
        if result == ComparisonResult.orderedAscending{
            return "ㅍ"
        }
        return "ㅎ"
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        data = ["피카츄", "라이츄", "파이리", "꼬부기", "버터플", "야도란", "피존투", "또가스", "거북왕", "또또가스", "뮤", "잉어킹", "이상해씨", "리자몽", "어니부기", "캐터피", "뿔충이", "럭키", "별가사리", "시드라", "시라소몬", "탕구리", "아쿠스타", "슬리퍼", "잠맘보", "포니타", "야돈", "두두", "파오리"]
        
        indexes = ["ㄱ","ㄴ","ㄷ","ㄹ","ㅁ","ㅂ","ㅅ","o","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
        
        //분류하기
        //데이터를 분류하기 위한 배열 생성
        var temp : [[String]] = Array(repeating: Array(), count: indexes.count)
        
        var i = 0
        while i < indexes.count{
            //한글자음 가져오기
            let firstName = indexes[i]
            var j = 0
            while j < data.count{
                //이름 가져오기
                let str = data[j]
                //이름의 첫 자음과 동일한 자음을 만나면 그 때의
                //인덱스에 해당하는 배열에 저장
                if firstName == subtract(data: str){
                    temp[i].append(str)
                }
                j=j+1
            }
            i=i+1
        }
        //각 배열의 데이터를 오름차순 정렬
        i = 0
        while i < temp.count{
            if temp[i].count >= 2{
                temp[i].sort()
            }
            i = i + 1
        }
        //분류된 데이터를자음과 함께 디셔너리에 저장해서 디셔너리 배열에 추가
        i=0
        while i < indexes.count{
            if temp[i].count > 0{
                var dic : Dictionary<String, Any> = [:]
                //한글 자음 저장
                dic["section_name"] = indexes[i]
                //데이터 저장
                dic["data"] = temp[i]
                sectionData.append(dic)
            }
            i=i+1
        }
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    //그룹의 개수를 설정하는 메소드
    func numberOfSections(in tableView: UITableView) -> Int{
        return sectionData.count
    }
    
    //그룹의 타이틀을 설정하는 메소드
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        //그룹 번호에 해당하는 데이터를 찾아오기
        let dic = sectionData[section]
        let title = (dic["section_name"] as! NSString) as String
        return title
        
    }
    
    //섹션별 행의 개수를 설정하는 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //그룹번호에 해당하는 데이터 찾아오기
        var dic = sectionData[section]
        //각 자음에 해당하는 배열을 꺼내서 행의 개수를 설정
        let ar = (dic["data"] as! NSArray) as Array
        return ar.count
    }
    
    //셀을 만들어주는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //재사용 가능한 셀을 가져오기
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil{
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "Cell")
        }
        //출력할 데이터 찾아오기
        var dic = sectionData[indexPath.section]
        var ar = (dic["data"] as! NSArray) as Array
        cell?.textLabel?.text = (ar[indexPath.row] as! NSString) as String
        return cell!
        
    }
    //테이블 뷰 오른쪽에 인덱스를 만들어주는 메소드
    func sectionIndexTitles(for tableView: UITableView) -> [String]?{
        return indexes
    }
    
    //인덱스를 눌렀을 때 화면에 보여질 섹션 번호를 설정하는 메소드
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int{
        //누른 문자열과 동일한 그룹이름을 검색해서 동일한 그룹으로 화면 이동
        var i = 0
        while i < sectionData.count{
            var dic = sectionData[i]
            let sectionName = (dic["section_name"] as! NSString) as String
            if sectionName == title{
                return i
            }
            i = i + 1
        }
        return -1
    }
    
    
}

