//
//  ViewController.swift
//  1107ViewController
//
//  Created by 503-17 on 07/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func simpleMessage(_ sender: Any) {
        //대화상자 생성
        let uac = UIAlertController.init(title: "메시지", message: "안녕하세요 반갑습니다.", preferredStyle: .alert)
        //버튼 만들기
        let confirm = UIAlertAction.init(title: "확인", style: .default)
        //버튼 연결
        uac.addAction(confirm)
        //화면 출력
        //self.present(uac, animated:true)
        //핸들러 () -> Void
        //메소드 호출 구문 뒤에 클로져를 작성 - trailing closure
        //GUI Programming에서 하나의 메소드에 화면에 무엇인가를
        //출력하는 코드와 작업을 하는 코드를 같이 작성하면
        //출력하는 코드는 모아서 처리하게 됩니다.
        //javascript로 animation을 구현하는 경우도 동일하게 적용
        self.present(uac, animated: true){() in
            print(" 이 코드는 대화상자 출력후에 수행됩니다.")
        }
        
        print("이 코드는 언제 동작할까?")
    }
    
    @IBOutlet var imageView: UIView!
    
    //확대 축소 배율을 저장하기 위한 변수
    var oldScale : CGFloat = 1.0
    
    //imageView에 pinch 이벤트가 발생하면 호출될 메소드
    @objc func pinchMethod(sender : UIPinchGestureRecognizer){
        //확대 축소 배율을 받아오기
        let newScale = sender.scale
        if newScale > 1.0{
            //크기 변경: 원본 이미지 뷰의 크기는 그대로 있고 이미지만 확대 축소가 됩니다.
            imageView.transform = CGAffineTransform(scaleX: oldScale + newScale - 1, y: oldScale + newScale - 1)
        }else{
            imageView.transform = CGAffineTransform(scaleX: oldScale * newScale, y: oldScale * newScale)
            
        }
        
        //핀치가 종료되면 확대 축소 배율을 oldScale에 저장
        if sender.state == .ended{
            if newScale > 1{
                oldScale = oldScale + newScale - 1
            }else{
                oldScale = oldScale * newScale
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //핀치 제스쳐 객체 생성
        let pinch = UIPinchGestureRecognizer.init(
            target: self, action: #selector(pinchMethod(sender:)))
        //이미지 뷰에 연결
        imageView.addGestureRecognizer(pinch)
    }


}

