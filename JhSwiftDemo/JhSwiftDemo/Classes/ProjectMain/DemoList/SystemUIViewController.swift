//
//  SystemUIViewController.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/27.
//

import UIKit
import Foundation

class SystemUIViewController: JhBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initUI()
    }
    
    func initUI() {
        self.Jh_navTitle = "SystemUIViewController"
        
        let frame = CGRect(x: 0, y: 100, width: 100, height: 20)
        let label = UILabel(frame: frame)
        label.text = "这是label"
        label.textColor = JhRandomColor()
        self.view.addSubview(label)
        
        let title = "这是按钮"
        let titleColor = JhRandomColor()
        let button = UIButton()
        button.backgroundColor = JhRandomColor()
        button.frame = frame
        button.jh_y = 150
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(titleColor, for: .normal)
        button.setTitleColor(titleColor.withAlphaComponent(0.5), for: .highlighted)
        button.setTitleColor(titleColor.withAlphaComponent(0.5), for: .disabled)
        button.addTarget(self, action: #selector(ClickButton), for: .touchUpInside)
        button.sizeToFit()
        self.view.addSubview(button)
    }

    @objc func ClickButton() {
        NSLog("点击按钮")
    }
    
}



