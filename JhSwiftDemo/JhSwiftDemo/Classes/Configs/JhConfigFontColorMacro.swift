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

// MARK: - dark mode 配置

/// 是否开启暗黑模式，iOS13之后生效，在info设置UIUserInterfaceStyle禁用则不起作用
let Jh_IsOpenDarkMode = true

/// 设置动态颜色
func JhDynamicColor(_ lightColor: UIColor, _ darkColor: UIColor) -> UIColor {
    return Jh_IsOpenDarkMode==false ? UIColor.Jh_dynamicColor(lightColor, lightColor) : UIColor.Jh_dynamicColor(lightColor, darkColor)
}

/// 设置动态颜色（十六进制，color：支持“#123456” ）
func JhDynamicHexColor(_ lightColor: String, _ darkColor: String) -> UIColor {
    return Jh_IsOpenDarkMode==false ? UIColor.Jh_dynamicHexColor(lightColor, lightColor) : UIColor.Jh_dynamicHexColor(lightColor, darkColor)
}

/// 设置动态图片
func JhDynamicImage(_ lightImage: String, _ darkImage: String) -> UIImage {
    return Jh_IsOpenDarkMode==false ? UIImage.Jh_dynamicImage(lightImage, lightImage) : UIImage.Jh_dynamicImage(lightImage, darkImage)
}


// MARK: - 项目颜色

/// 主题色
let BaseThemeColor = JhColor(65, 191, 49)
let BaseThemeGreenColor = JhColor(0, 190, 102)
/// 背景色
let BaseBgColor = JhDynamicColor(BaseBgColor_Light, BaseBgColor_Dark)
let BaseBgColor_Light = JhColor(248, 248, 248)
let BaseBgColor_Dark  = JhGrayColor(17)
/// 基础黑
let BaseBlackTextColor = JhColor(51, 51, 51)
let BaseBlackTextColor_Dark = JhGrayColor(198)
/// 浅灰色
let BaseLightGreyTextColor = JhColor(119, 119, 119)
let BaseLightGreyTextColor_Dark = JhGrayColor(120)

/// Label颜色
let BaseLabelColor = JhDynamicColor(BaseBlackTextColor, BaseBlackTextColor_Dark)
/// title Label颜色
let BaseTitleLabelColor = JhDynamicColor(BaseBlackTextColor, BaseBlackTextColor_Dark)
/// info Label颜色
let BaseInfoLabelColor = JhDynamicColor(JhGrayColor(150), JhGrayColor(150))
/// Placeholder颜色
let BasePlaceholderColor = JhDynamicColor(JhGrayColor(187), JhGrayColor(87))
/// 分割线颜色
let BaselineColor = JhDynamicColor(JhColor(230, 230, 230), JhGrayColor(35))
/// 空数据文字颜色
let BaseEmptyDataTextColor = JhDynamicColor(BaseLightGreyTextColor, BaseLightGreyTextColor_Dark)
/// 导航条背景色，白底黑字
let BaseNavBgColor = JhDynamicColor(UIColor.white, BaseBgColor)
/// 导航条标题颜色
let BaseNavTitleColor = JhDynamicColor(UIColor.black, UIColor.white)
/// 导航条item文字颜色
let BaseNavTextColor = JhDynamicColor(UIColor.black, UIColor.white)
/// 导航条背景色，主题色白字
let BaseNavBgColor2 = JhDynamicColor(BaseThemeColor, BaseBgColor)
/// 导航条标题颜色
let BaseNavTitleColor2 = JhDynamicColor(UIColor.white, UIColor.white)
/// TabBar背景色
let BaseTabBarBgColor = JhDynamicColor(UIColor.white, JhGrayColor(29))
/// TabBar默认文字颜色
let BaseTabBarNormalTextColor = JhDynamicColor(BaseBlackTextColor, BaseBlackTextColor_Dark)
/// TabBar选中文字颜色
let BaseTabBarSelectTextColor = JhDynamicColor(BaseThemeColor, BaseThemeColor)
/// Cell背景颜色
let BaseCellBgColor = JhDynamicColor(UIColor.white, JhGrayColor(25))
/// TextView背景颜色
let BaseTextViewBgColor = JhDynamicColor(JhGrayColor(250), JhGrayColor(50))
/// Btn、segment等UI组件背景颜色
let BaseBtnBgColor = JhDynamicColor(BaseThemeColor, JhGrayColor(43))
/// Toast 背景颜色
let BaseToastBgColor = JhDynamicColor(UIColor.white, JhGrayColor(47))
/// Alert 背景颜色
let BaseAlertBgColor = JhDynamicColor(UIColor.white, JhGrayColor(44))
/// Picker 背景颜色
let BasePickerBgColor = JhDynamicColor(UIColor.white, JhGrayColor(30))
/// Pop 背景颜色
let BasePopBgColor = JhDynamicColor(UIColor.white, JhGrayColor(64))



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
