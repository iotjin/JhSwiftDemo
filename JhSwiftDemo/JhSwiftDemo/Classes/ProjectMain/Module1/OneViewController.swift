//
//  OneViewController.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/27.
//

import UIKit
import Foundation

class OneViewController: JhBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNav()
//        self.view.backgroundColor = JhHexColorA("#21AF64", 0.5)
    }
    
    func initNav() {
        Jh_navTitle = "微信"
        
        //        let textItem = UIBarButtonItem.Jh_textItem(title: "DemoList", titleColor: UIColor.red, target: self, action: #selector(ClickItem))
        //        let imgItem =  UIBarButtonItem.Jh_imageItem(imageName: "wx_nav_add", target: self, action: #selector(ClickItem))
        //        self.navigationItem.rightBarButtonItem = imgItem
        
        var originImage = UIImage(named: "wx_nav_add")
        originImage = originImage?.jh_image(withTintColor: JhGrayColor(20))
        
        let button = UIButton()
        button.setImage(originImage, for: .normal)
        button.setImage(originImage, for: .highlighted)
        button.addTarget(self, action: #selector(ClickItem), for: .touchUpInside)
        button.sizeToFit()
        let imgItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = imgItem
    }
    
    @objc func ClickItem() {
        NSLog("点击事件")
        self.navigationController?.pushViewController(SystemUIViewController(), animated: true)
    }
}
