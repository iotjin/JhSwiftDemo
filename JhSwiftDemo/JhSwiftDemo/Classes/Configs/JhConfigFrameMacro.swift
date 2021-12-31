//
//  JhConfigFrameMacro.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/27.
//

import UIKit


// MARK: - 尺寸信息

/// 屏幕宽度
let kScreenWidth = UIScreen.main.bounds.width
/// 屏幕高度
let kScreenHeight = UIScreen.main.bounds.height

/// 黄金比例的宽
let Jh_Width_0_618 = kScreenWidth * 0.618

let JhWidthRatio = (kScreenWidth / 375.0)
let JhHeightRatio = (kScreenHeight / 667.0)
func JhRatio(_ value:CGFloat) -> CGFloat {
    return kScreenWidth * (value / 375.0)
}

/// 状态栏高度。非刘海屏20，X是44，11是48，12之后是47
let kStatusBarHeight = STATUSBAR_HEIGHT()
let kTopSafeHeight = STATUSBAR_HEIGHT()
let kBottomSafeHeight = INDICATOR_HEIGHT()

/// 导航条高度
let kContentNavBarHeight = 44.0
let kNavHeight = (kStatusBarHeight + kContentNavBarHeight)
let kTabBarHeight = (49.0 + kBottomSafeHeight)

/// tableView Y
let kTableViewY = kNavHeight
/// tableView高度
let kTableViewHeight = kScreenHeight-kTableViewY-kBottomSafeHeight
/// tableViewFrame
let kTableViewFrame = CGRect(x: 0, y: kTableViewY, width: kScreenWidth, height: kTableViewHeight)


/// 状态栏高度。X是44，其他是20
func STATUSBAR_HEIGHT() ->CGFloat {
    if #available(iOS 13.0, *) {
        return getWindow()?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    } else {
        return UIApplication.shared.statusBarFrame.height
    }
}

/// 底部指示条高度
func INDICATOR_HEIGHT() ->CGFloat {
    if #available(iOS 11.0, *) {
        return getWindow()?.safeAreaInsets.bottom ?? 0
    } else {
        return 0
    }
}

/// 获取当前设备window用于判断尺寸
func getWindow() -> UIWindow? {
    if #available(iOS 13.0, *) {
        let winScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return winScene?.windows.first
    } else {
        return UIApplication.shared.keyWindow
    }
}


// MARK: - 系统版本

/// Jh 当前系统版本
let Jh_iOS_SYSTEM_VERSION = (UIDevice.current.systemVersion as NSString).doubleValue

/// Jh 系统版本大于等于
func Jh_iOS_Later(_ version:Double) -> Bool {
    return Jh_iOS_SYSTEM_VERSION >= version
}

/// iOS9 及更高版本
let Jh_iOS9_Later = (Jh_iOS_SYSTEM_VERSION >= 9.0)
/// iOS10 及更高版本
let Jh_iOS10_Later = (Jh_iOS_SYSTEM_VERSION >= 10.0)
/// iOS11 及更高版本
let Jh_iOS11_Later = (Jh_iOS_SYSTEM_VERSION >= 11.0)
/// iOS13 及更高版本
let Jh_iOS13_Later = (Jh_iOS_SYSTEM_VERSION >= 13.0)
/// iOS14 及更高版本
let Jh_iOS14_Later = (Jh_iOS_SYSTEM_VERSION >= 14.0)
/// iOS15 及更高版本
let Jh_iOS15_Later = (Jh_iOS_SYSTEM_VERSION >= 15.0)


// MARK: - 机型

/// 判断当前设备是否是iPhone
let Jh_Is_iPhone = (UI_USER_INTERFACE_IDIOM() == .phone)
/// 判断当前设备是否是iPad
let Jh_Is_iPad = UIDevice.current.userInterfaceIdiom == .pad


/// 判断  iPhone4系列   4/4s
let Jh_Is_iPhone4 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 640, height: 960), (UIScreen.main.currentMode?.size)!) && !Jh_Is_iPad : false)
/// 判断  iPhone5系列    5/5c/5s/SE
let Jh_Is_iPhone5 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 640, height: 1136), (UIScreen.main.currentMode?.size)!) && !Jh_Is_iPad : false)
/// 判断  iPhone6系列   6/6s/7/8/SE2，@2x
let Jh_Is_iPhone6 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 750, height: 1334), (UIScreen.main.currentMode?.size)!) && !Jh_Is_iPad : false)
/// 判断  iphone6Plus系列   6+/6s+/7+/8+，@3x
let Jh_Is_iPhone6p = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1242, height: 2208), (UIScreen.main.currentMode?.size)!) && !Jh_Is_iPad : false)
/// 判断  iPhoneX 、XS 、11 Pro，@3x
let Jh_Is_iPhoneX = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1125, height: 2436), (UIScreen.main.currentMode?.size)!) && !Jh_Is_iPad : false)
/// 判断  iPhoneXS
let Jh_Is_iPhoneXS = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1125, height: 2436), (UIScreen.main.currentMode?.size)!) && !Jh_Is_iPad : false)
/// 判断  iPhoneXs Max、11 Pro Max，@3x
let Jh_Is_iPhoneXsMax = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1242, height: 2688), (UIScreen.main.currentMode?.size)!) && !Jh_Is_iPad : false)
/// 判断  iPHoneXR、11，@2x
let Jh_Is_iPhoneXR = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 828, height: 1792), (UIScreen.main.currentMode?.size)!) && !Jh_Is_iPad : false)
/// 判断iPhone12Mini、13Mini       @3x
let Jh_Is_iPhone12Mini = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1080, height: 2340), (UIScreen.main.currentMode?.size)!) && !Jh_Is_iPad : false)
/// 判断iPhone12 、12Pro、13、13Pro      @3x
let Jh_Is_iPhone12 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1170, height: 2532), (UIScreen.main.currentMode?.size)!) && !Jh_Is_iPad : false)
/// 判断iPhone12Pro Max、13 Pro Max     @3x
let Jh_Is_iPhone12ProMax = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1284, height: 2778), (UIScreen.main.currentMode?.size)!) && !Jh_Is_iPad : false)


/// 刘海屏系列
let Jh_Is_IPhoneX_All = (Jh_Is_iPhoneX || Jh_Is_iPhoneXR || Jh_Is_iPhoneXS || Jh_Is_iPhoneXsMax || Jh_Is_iPhone12Mini || Jh_Is_iPhone12 || Jh_Is_iPhone12ProMax)

