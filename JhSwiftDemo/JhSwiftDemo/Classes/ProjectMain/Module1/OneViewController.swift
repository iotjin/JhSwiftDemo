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
        getAppInfo()
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
        self.navigationController?.pushViewController(SystemUIViewController(), animated: true)
    }
    
    // 获取应用信息
    func getAppInfo() {
        print("App 显示名称 :",kAppDisplayName)
        print("App BundleName :",kAppName)
        print("App BundleID :",kAppBundleID)
        print("App 版本号 :",kAppVersion)
        print("App BuildNumber :",kAppBuildNumber)
        print("App Language :",kAPPLanguage)
    }
}
