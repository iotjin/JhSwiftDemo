//
//  JhConfigFontColorMacro.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/27.
//

import UIKit


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


// MARK: - 字体设置

/// 设置字体大小
func JhFont(_ size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size)
}
/// 设置粗体字字号
func JhBoldFont(_ size:CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: size)
}

/// 根据屏幕自适应字体参数 16 * FontFit
let JhFontFit = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) / 375

/// 系统默认字体
func SystemFont(_ size: CGFloat) -> UIFont {
    return .systemFont(ofSize: size)
}
/// 系统默认字体
func SystemFontBold(_ size: CGFloat) -> UIFont {
    return .boldSystemFont(ofSize: size)
}

// MARK: - 常用系统字体大小

let JhFont_10 = JhFont(10)
let JhFont_11 = JhFont(11)
let JhFont_12 = JhFont(12)
let JhFont_13 = JhFont(13)
let JhFont_14 = JhFont(14)
let JhFont_15 = JhFont(15)
let JhFont_16 = JhFont(16)
let JhFont_17 = JhFont(17)
let JhFont_18 = JhFont(18)
let JhFont_19 = JhFont(19)
let JhFont_20 = JhFont(20)
let JhFont_25 = JhFont(25)
let JhFont_30 = JhFont(30)

// MARK: - 常用粗体系统字体大小

let JhBoldFont_10 = JhBoldFont(10)
let JhBoldFont_11 = JhBoldFont(11)
let JhBoldFont_12 = JhBoldFont(12)
let JhBoldFont_13 = JhBoldFont(13)
let JhBoldFont_14 = JhBoldFont(14)
let JhBoldFont_15 = JhBoldFont(15)
let JhBoldFont_16 = JhBoldFont(16)
let JhBoldFont_17 = JhBoldFont(17)
let JhBoldFont_18 = JhBoldFont(18)
let JhBoldFont_19 = JhBoldFont(19)
let JhBoldFont_20 = JhBoldFont(20)
let JhBoldFont_25 = JhBoldFont(25)
let JhBoldFont_30 = JhBoldFont(30)
