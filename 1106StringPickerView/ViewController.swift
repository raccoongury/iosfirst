//
//  ViewController.swift
//  1106StringPickerView
//
//  Created by 503-17 on 06/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //var select
    var selectedRow = 0

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func click(_ sender: Any) {
        //피커뷰에서 선택된 행 번호 찾아오기
        //열번호에 해당하는 선택된 행번호를 저장
        let row = pickerView.selectedRow(inComponent: 0)
        //print(ar[row])

        let subRow = pickerView.selectedRow(inComponent: 1)
        print(mainData[row] + ":" + subData[row][subRow])
    }
    
    //pickerView에 출력할 데이터 배열
    var ar : [String] = [String]()
    
    //메인 데이터와 서브 데이터를 저장할 변수
    var mainData : [String] = [String]()
    var subData : [[String]] = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //배열의 데이터 추가
        ar.append("피카츄")
        ar.append("라이츄")
        ar.append("파이리")
        ar.append("꼬부기")
        
        mainData.append("캡틴플레닛")
        mainData.append("파워레인져")

        
        subData.append(["땅", "불", "바람", "물", "마음"])
        subData.append(["레드", "블루", "그린", "핑크", "블랙"])
        
        //pickerView의 delegate 와 dataSource 설정
        pickerView.delegate = self
        pickerView.dataSource = self
    }
}

//PickerView 출력을 위한 extension
extension ViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    //열의 개수를 설정하는 메소드
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 2
    }
    
    //열별로 행의 개수를 설정하는 메소드
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if component == 0{
            return mainData.count
        }else{
            return subData[selectedRow].count
        }
    }
    
    //PickerView에 출력할 문자열을 설정하는 메소드
    //return 하는 문자열이 피커뷰에 출력
    //row가 행번호이고 component가 열번호
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        if component == 0{
            return mainData[row]
        }else {
            return subData[selectedRow][row]
        }
    }
    
    //피커 뷰의 선택이 변경되었을 때 호출되는 메소드
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        //첫번째 열의 선택이 변경되었을 때
        if component == 0{
            //선택된 행 번호를 selectedRow 에 대입
            selectedRow = pickerView.selectedRow(inComponent: 0)
            //피커 뷰의 두번째 열의 데이터를 다시 출력
            pickerView.reloadComponent(1)
        }
    }
}
