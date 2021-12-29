//
//  JhConfigFontColorMacro.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/27.
//

import UIKit
import Foundation


// MARK: - 颜色设置

/// RGB颜色设置：支持(255, 255, 255)
func JhColor(_ r:CGFloat, _ g:CGFloat,_ b:CGFloat) -> UIColor {
    return UIColor(red: CGFloat(r) / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
}
func JhColorA(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}
func JhRandomColor() -> UIColor {
    return JhColor(CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)))
}
func JhGrayColor(_ v:CGFloat) -> UIColor {
    return JhColor(v,v,v)
}

/// 十六进制颜色设置：支持#FF0000
func JhHexColor(_ rgbValue: String) -> UIColor? {
    return UIColor.jh_hexColor(rgbValue, alpha: 1.0)
}
func JhHexColorA(_ rgbValue: String,_ a:CGFloat) -> UIColor? {
    return UIColor.jh_hexColor(rgbValue, alpha: a)
}

// MARK: - 项目颜色

/// 主题色
let BaseThemeColor = JhColor(65, 191, 49)
let BaseThemeGreenColor = JhColor(0, 190, 102)
/// 基础黑
let BaseBlackTextColor = JhColor(51, 51, 51)
/// 浅灰色
let BaseLightGreyTextColor = JhColor(119, 119, 119)
/// 背景色
let BaseBgWhiteColor = JhColor(248, 248, 248)
/// 分割线颜色
let BaselineColor = JhColor(230, 230, 230)
