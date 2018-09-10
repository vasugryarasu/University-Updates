//
//  Button.swift
//  University Updates
//
//  Created by Vasu Yarasu on 05/09/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    var isOn: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton(){
        layer.borderWidth = 2.0
        layer.cornerRadius = frame.size.height/2
        layer.borderColor = Color.orange.cgColor
        setTitleColor(Color.orange, for: .normal)
        addTarget(self, action: #selector(Button.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed(){
        activeButton(bool: !isOn)
    }
    func activeButton(bool: Bool){
        isOn = bool
        let bgColor = bool ? Color.orange : .clear
        let titleColor = bool ? .white : Color.orange
        setTitleColor(titleColor, for: .normal)
        backgroundColor = bgColor
    }
}









