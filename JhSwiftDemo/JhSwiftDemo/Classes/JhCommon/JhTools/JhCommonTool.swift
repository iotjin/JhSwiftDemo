//
//  JhCommonTool.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/29.
//

import Foundation


class JhCommonTool {
    
    /// 检测当前是否是深色模式
    static func Jh_isDarkMode() -> Bool {
        if (!Jh_IsOpenDarkMode) {
            return false
        }
        if #available(iOS 13.0, *) {
            let currentMode = UITraitCollection.current.userInterfaceStyle
            if(currentMode == .dark){
                return  true
            }
        }
        return false
    }
        
}
