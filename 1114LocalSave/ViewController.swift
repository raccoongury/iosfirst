//
//  ViewController.swift
//  1114LocalSave
//
//  Created by 503-17 on 14/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf: UITextField!
    @IBAction func writeText(_ sender: Any) {
        //저장할 파일의 경로를 생성
        //앱에 읽고 쓸 수 있는 도큐먼트 디렉토리 경로 생성
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docDir = dirPaths[0]
        //파일의 경로를 생성
        let filepath = docDir + "/data.dat"
        //파일의 존재 여부를 확인해서 파일이 없으면 생성
        var file:FileHandle? = FileHandle(forUpdatingAtPath: filepath)
        if file == nil{
            let fileMgr = FileManager.default
            fileMgr.createFile(atPath: filepath, contents: nil, attributes: nil)
        }
        file = FileHandle(forUpdatingAtPath: filepath)
        
        //기록할 데이터 가져오기
        let stringData = tf.text
        //문자열을 바이트 배열로 변환
        let data = (stringData! as NSString).data(using: String.Encoding.utf8.rawValue)
        //문자열을 추가하기 위해 맨 뒤로 이동
        file!.seekToEndOfFile()
        //파일에 기록
        file!.write(data!)
        //파일 닫기
        file!.closeFile()
        
    }
    @IBAction func readText(_ sender: Any) {
        //저장할 파일의 경로를 생성
        //앱에 읽고 쓸 수 있는 도큐먼트 디렉토리 경로 생성
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docDir = dirPaths[0]
        //파일의 경로를 생성
        let filepath = docDir + "/data.dat"
        //파일을 읽기 위한 핸들을 생성
        let file : FileHandle? =
            FileHandle(forReadingAtPath: filepath)
        if file == nil{
            tf.text = "파일이 존재하지 않습니다."
        }else{
            //파일의 내용 전체를 가져오기
            let databuffer = file?.readDataToEndOfFile()
            //읽은 내용을 문자열로 변환하기
            let out = NSString(data:databuffer!, encoding:String.Encoding.utf8.rawValue)
            tf.text = out! as String
            //파일 닫기
            file!.closeFile()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}
