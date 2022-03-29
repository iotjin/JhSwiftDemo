//
//  UIColor+JhDarkColor.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/28.
//

import UIKit


extension UIColor {
    
    /// 设置动态颜色
    static func Jh_dynamicColor(_ lightColor: UIColor, _ darkColor: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init{ (traitCollection: UITraitCollection) -> UIColor in
                if (traitCollection.userInterfaceStyle == .light) {
                    return lightColor
                } else {
                    return darkColor
                }
            };
        } else {
            return lightColor
        }
    }
    
    /// 设置动态颜色（十六进制，color：支持“#123456” ）
    static func Jh_dynamicHexColor(_ lightColor: String, _ darkColor: String) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init{ (traitCollection: UITraitCollection) -> UIColor in
                if (traitCollection.userInterfaceStyle == .light) {
                    return UIColor.Jh_hexColor(lightColor)
                } else {
                    return UIColor.Jh_hexColor(darkColor)
                }
            }
        } else {
            return UIColor.Jh_hexColor(lightColor)
        }
    }
    
    /// 设置动态颜色（十六进制，color：支持“#123456” ）
    static func Jh_isdynamicHexColor(_ lightColor: String, _ darkColor: String) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init{ (traitCollection: UITraitCollection) -> UIColor in
                if (traitCollection.userInterfaceStyle == .light) {
                    return UIColor.Jh_hexColor(lightColor)
                } else {
                    return UIColor.Jh_hexColor(darkColor)
                }
            }
        } else {
            return UIColor.Jh_hexColor(lightColor)
        }
    }
  
}
