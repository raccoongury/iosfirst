//
//  ViewController.swift
//  1113FileSave
//
//  Created by 503-17 on 13/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf: UITextField!
    @IBAction func writeText(_ sender: Any) {
        
        //도큐먼트 디렉토리의 경로 생성
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        //파일 경로 생성
        let filePath = docsDir + "/data.dat"
        //파일에 기록할 내용
        let str = tf.text
        //문자열을 바이트 배열로 만들기
        let dataBuffer = str!.data(using: .utf8)
        //파일에 기록
        let fileMgr = FileManager.default
        fileMgr.createFile(atPath: filePath, contents: dataBuffer, attributes: nil)
    }
    @IBAction func readText(_ sender: Any) {
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        //파일 경로 생성
        let filePath = docsDir + "/data.dat"
        let fileMgr = FileManager.default
        //파일의 존재 여부를 확인
        if fileMgr.fileExists(atPath: filePath) == false{
            tf.text = "파일이 존재하지 않습니다"
        }else{
            //파일의 내용을 읽어서 바이트 배열로 만들기
            let dataBuffer = fileMgr.contents(atPath:filePath)
            //바이트 배열을 문자열로 만들기
            let log = NSString(data: dataBuffer!, encoding:String.Encoding.utf8.rawValue)
            tf.text = log! as String
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

