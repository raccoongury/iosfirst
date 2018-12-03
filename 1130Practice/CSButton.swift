//
//  CSButton.swift
//  1130Practice
//
//  Created by 503-17 on 30/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

public enum CSButtonType{
    case rect
    case circle
}

class CSButton: UIButton {
    var style:CSButtonType = .rect{
        didSet{
            switch style{
            case .rect:
                self.backgroundColor = UIColor.black
                self.layer.borderColor = UIColor.black.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 0
                self.setTitle("사각버튼", for: .normal)
                self.setTitleColor(UIColor.white, for: .normal)
            case .circle:
                self.backgroundColor = UIColor.red
                self.layer.borderColor = UIColor.blue.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 30
                self.setTitle("동그란버튼", for: .normal)
                self.setTitleColor(UIColor.white, for: .normal)
            }
        }
    }
    //초기화 메소드 재정의
    init(){
        super.init(frame:CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = UIColor.gray
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("코드로 생성된 버튼", for:.normal)
        
    }
    //인터페이스 빌더에서 생성할 때 호출되는 초기화 메소드
    //필수 재정의 메소드입니다.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        
        self.backgroundColor = UIColor.green
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        self.setTitle("IB 이용 버튼", for:.normal)
    }
    
    //타입을 매개변수로 받아서 버튼을 만들어주는 초기화 메서드
    //기존에 없는 초기화 메소드라서 convenience를 추가
    convenience init(type : CSButtonType){
        self.init()
        
        switch type{
        case .rect:
            self.backgroundColor = UIColor.black
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 0
            self.setTitle("사각버튼", for: .normal)
            self.setTitleColor(UIColor.white, for: .normal)
        case .circle:
            self.backgroundColor = UIColor.red
            self.layer.borderColor = UIColor.blue.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 30
            self.setTitle("동그란버튼", for: .normal)
            self.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
}
