//
//  UIBarButtonItem+JhExtension.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/28.
//

import UIKit

extension UIBarButtonItem {
    
    /// 根据图片生成UIBarButtonItem
    static func Jh_imageItem(imageName:String,target:AnyObject,action:Selector) -> UIBarButtonItem {
        return Jh_customItem(title: "", titleColor: UIColor.white, imageName: imageName, target: target, action: action,contentHorizontalAlignment: .center)
    }
    
    /// 根据文字生成UIBarButtonItem
    static func Jh_textItem(title:String,titleColor:UIColor,target:AnyObject,action:Selector) -> UIBarButtonItem {
        return Jh_customItem(title: title, titleColor: titleColor, imageName: "", target: target, action: action,contentHorizontalAlignment: .center)
    }
    
    /// 返回按钮 带箭头的
    static func Jh_backItem(imageName:String,target:AnyObject,action:Selector) -> UIBarButtonItem {
        return Jh_customItem(title: "", titleColor: UIColor.white, imageName: imageName, target: target, action: action,contentHorizontalAlignment: .left,isBack: true)
    }
    
    /// 快速初始化一个UIBarButtonItem，内部是按钮
    static func Jh_customItem(title:String,titleColor:UIColor,imageName:String,target:AnyObject,action:Selector,
                              contentHorizontalAlignment:UIControl.ContentHorizontalAlignment,isBack:Bool=false) -> UIBarButtonItem {
        let button = UIButton()
        if (title.count>0) {
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        }
        if (imageName.count>0) {
            button.setImage(UIImage(named: imageName), for: .normal)
            button.setImage(UIImage(named: imageName), for: .highlighted)
        }
        button.setTitleColor(titleColor, for: .normal)
        button.setTitleColor(titleColor.withAlphaComponent(0.5), for: .highlighted)
        button.setTitleColor(titleColor.withAlphaComponent(0.5), for: .disabled)
        button.addTarget(target, action: action, for: .touchUpInside)
        if (isBack) {
            button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        } else {
            button.sizeToFit()
        }
        button.contentHorizontalAlignment = contentHorizontalAlignment;
        return UIBarButtonItem(customView: button)
    }
}
