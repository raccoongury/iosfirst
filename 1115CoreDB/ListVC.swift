//
//  ListVC.swift
//  1115CoreDB
//
//  Created by 503-17 on 15/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

import CoreData
class ListVC: UITableViewController {
    //Board Entity의 모든 데이터를 저장할 프로퍼티 생성
    lazy var list : [NSManagedObject] = {
        return self.fetch()
    }()
    
    //데이터를 읽어서
    func fetch() -> [NSManagedObject]{
        //저장소를 사용하기 위해서 AppDelegate 에대한 포인터를 생성
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //저장소 가져오기
        let context = appDelegate.persistentContainer.viewContext
        //Board Entity에서 데이터를 가져오는 객체를 생성
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Board")
        //데이터를 가져와서 리턴
        let result = try! context.fetch(fetchRequest)
        return result
    }
    
    //Board Entity에 데이터를 추가해주는 메소드
    func save(title:String, content:String) -> Bool{
        //저장소를 사용하기 위해서 AppDelegate 에 대한 포인터를 생성
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        //저장소 가져오기
        let context = appDelegate.persistentContainer.viewContext
        //데이터를 삽입하는 관리 객체를 가져오기
        let newData =
            NSEntityDescription.insertNewObject(forEntityName: "Board", into: context)
        //삽입할 데이터 만들기
        newData.setValue(title, forKey: "title")
        newData.setValue(content, forKey: "content")
        newData.setValue(Date(), forKey: "regdate")
        
        //데이터 저장하기
        do{
            //Core Data 에 데이터 저장
            try context.save()
            //list에 데이터 저장
            self.list.insert(newData, at: 0)
            return true
        }catch{
            context.rollback()
            return false
        }
    }
    
    
    //데이터를 삭제하는 메소드
    func delete(object:NSManagedObject) -> Bool{
        //저장소를 사용하기 위해서 AppDelegate 에 대한 포인터를 생성
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //저장소 가져오기
        let context = appDelegate.persistentContainer.viewContext
        //데이터 삭제
        context.delete(object)
        //커밋
        do{
            try context.save()
            return true
        }catch{
            context.rollback()
            return false
        }
    }
    
    //데이터를 수정하는 메소드
    func edit(object : NSManagedObject, title:String, content:String) -> Bool{
        //저장소를 사용하기 위해서 AppDelegate 에 대한 포인터를 생성
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //저장소 가져오기
        let context = appDelegate.persistentContainer.viewContext
        //수정할 객체 만들기
        object.setValue(title, forKey: "title")
        object.setValue(content, forKey: "content")
        object.setValue(Date(), forKey: "regdate")
        do{
            try context.save()
            return true
        }catch{
            context.rollback()
            return false
        }
    }
    
    //바버튼 아이템을 누르면 호출되는 메소드
    @objc func add(_ sender:Any){
        //대화상자 인스턴스 생성
        let alert = UIAlertController(title: "게시글 작성", message: "제목과 내용을 입력하세요", preferredStyle: .alert)
        //텍스트 필드 추가
        alert.addTextField(){(tf) in tf.placeholder = "게시글 제목"
        }
        alert.addTextField(){(tf) in tf.placeholder = "게시글 내용"
        }
        
        //버튼 추가
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "확인", style: .default){(_) in
            
            //텍스트 필드의 내용이 nil이면 메소드 수행 종료
            guard let title = alert.textFields?.first?.text,
            let content = alert.textFields?.last?.text
                else{
                    return
            }
            //nil 이 아니면 데이터 삽입
            self.save(title: title, content: content)
            //테이블 뷰 다시 출력
            //self.tableView.reloadData()
            
            let indexPath = IndexPath.init(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .top)
        })
        
        //대화상자 출력
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "게시판"
        
        //바버튼 생성
        let addBtn = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(add(_:)))
        self.navigationItem.rightBarButtonItem = addBtn
        
        //편집 버튼을 네비게이션 바의 왼쪽에 배치
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //섹션별 행의 개수를 설정하는 메소드 - 필수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //행번호에 해당하는 데이터 가져오기
        let data = list[indexPath.row]
        let title = data.value(forKey:"title") as? String
        let content = data.value(forKey:"content") as? String
        //데이터 출력
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = content
        
        return cell
    }


    // 주석지우고 UITableViewCell.EditingStyle 사이에 .찍어줘야하는
    //테이블 뷰에서 edit button을 누르고 나오는 버튼을 눌렀을 때 호출되는 메소드입니다.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //행 번호에 해당하는 데이터 찾기
        let object = self.list[indexPath.row]
        //데이터 삭제
        if self.delete(object: object){
            //메모리에서 행번호에 해당하는 데이터 삭제
            //한곳에서만 사용하는 데이터베이스 인 경우 가능
            //여러 곳에서 공유하는 경우에는 다시 불러 오는 것이 좋습니다.
            self.list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //선택한 행에 대한 데이터 가져오기
        let object = self.list[indexPath.row]
        let title = object.value(forKey: "title") as! String
        let content = object.value(forKey: "content") as! String
        
        //대화상자 생성
        let alert = UIAlertController(title: "게시글 수정", message: "수정할 내용을 입력하세요", preferredStyle: .alert)
        
        //내용을 가지고 텍스트 필드 생성
        alert.addTextField(){(tf) in tf.text = title}
        alert.addTextField(){(tf) in tf.text = content}
        
        //버튼 추가
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "확인", style: .default){(_) in
            guard let title = alert.textFields?.first?.text,
                let content = alert.textFields?.last?.text else{
                    return
            }
            if self.edit(object: object, title: title, content: content){
                //선택된 행의 데이터 수정
                let cell = self.tableView.cellForRow(at: indexPath)
                cell?.textLabel?.text = title
                cell?.detailTextLabel?.text = content
                //행을 맨 앞으로 이동
                let firstIndexPath = IndexPath(row: 0, section: 0)
                self.tableView.moveRow(at: indexPath, to: firstIndexPath)
            }
        })
        self.present(alert, animated: true)
    }
}
