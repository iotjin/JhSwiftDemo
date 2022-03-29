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
        
        // 暗黑图片处理，只有一张图片，通过分类把纯色图颜色重绘，然后调用traitCollectionDidChange方法
        var originImage = UIImage(named:"wx_nav_add")
        originImage = originImage?.Jh_imageWithTintColor(JhDynamicColor(JhGrayColor(20), JhGrayColor(200)))
        // 暗黑图片处理，准备二张图片，直接使用下面方法（不用调用traitCollectionDidChange方法），推荐
        //        let originImage = JhDynamicImage("ic_nav_back_black", "ic_nav_back")
        
        let button = UIButton()
        button.setImage(originImage, for: .normal)
        button.setImage(originImage, for: .highlighted)
        button.addTarget(self, action: #selector(ClickItem), for: .touchUpInside)
        button.sizeToFit()
        let imgItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = imgItem
    }
    
    @objc func ClickItem() {
        self.navigationController?.pushViewController(DemoListViewController(), animated: true)
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
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                // 适配代码
                configureTheme()
            }
        }
    }
    
    private func configureTheme() {
        initNav()
    }
    
}
