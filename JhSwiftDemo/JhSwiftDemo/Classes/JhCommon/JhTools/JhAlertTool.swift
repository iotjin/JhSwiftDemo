//
//  UIAlertController+JhAlert.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/3/22.
//  弹框工具类

import UIKit


class JhAlertTool: NSObject {
    
    /// 快速创建系统AlertController：包括Alert 和 ActionSheet，带颜色
    /// - Parameters:
    ///   - title: 标题文字
    ///   - message: 消息体文字
    ///   - actionTitles: 可选择点击的按钮文字（不包括取消）
    ///   - cancelTitle: 取消按钮文字
    ///   - style: 类型：Alert 或者 ActionSheet
    ///   - actionStyles: 按钮颜色类型（与actionTitles长度一致生效）
    ///   - completion: 完成点击按钮之后的回调（取消按钮的index 为 0 ，其他按钮的index从上往下依次为 1、2、3...）
    static func Jh_showSystemAlert(title:String="", message:String="", actionTitles:Array<String>, cancelTitle:String="", style:UIAlertController.Style, actionStyles:Array<UIAlertAction.Style>=[], completion: @escaping ((_ index: Int) -> ())) {
        
        let vc = UIApplication.shared.keyWindow?.rootViewController
        vc?.dismiss(animated: false)
        
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
            for i in 0 ..< actionTitles.count {
                let action = UIAlertAction(title: actionTitles[i], style: actionTitles.count == actionStyles.count ? actionStyles[i]: .default) { action in
                    completion(i+1)
                }
                alertController.addAction(action)
            }
            if (!cancelTitle.isEmpty) {
                let cancel = UIAlertAction(title: cancelTitle, style: .cancel) { action in
                    completion(0)
                }
                alertController.addAction(cancel)
            }
            vc?.present(alertController, animated: true, completion: nil)
        }
    }
    
    /// 快速创建系统AlertController：包括Alert 和 ActionSheet
    static func Jh_showSystemAlert(title:String="", message:String="", actionTitles:Array<String>, cancelTitle:String="", style:UIAlertController.Style, completion: @escaping ((_ index: Int) -> ())) {
        JhAlertTool.Jh_showSystemAlert(title: title, message: message, actionTitles: actionTitles, cancelTitle: cancelTitle, style: style, actionStyles: []) { index in
            completion(index)
        }
    }
    
    /// 快速创建系统Alert弹框（取消按钮的index 为 0 ，确认为1）
    static func systemAlert(title:String="", message:String="", cancelTitle:String="取消", confirmTitle:String="确认", handler: @escaping ((_ index: Int) -> ())) {
        JhAlertTool.Jh_showSystemAlert(title: title, message: message, actionTitles: [confirmTitle], cancelTitle: cancelTitle, style: .alert) { index in
            handler(index)
        }
    }
    
    /// 快速创建系统ActionSheet弹框（取消按钮的index 为 0 ，其他按钮的index从上往下依次为 1、2、3...）
    static func systemActionSheet(title:String="", message:String="", actionTitles:Array<String>, cancelTitle:String="取消", handler: @escaping ((_ index: Int) -> ())) {
        JhAlertTool.Jh_showSystemAlert(title: title, message: message, actionTitles: actionTitles, cancelTitle: cancelTitle, style: .actionSheet) { index in
            handler(index)
        }
    }
    
}


