//
//  AppDelegate.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/27.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //初始化 window
        initWindow()
        
        AppDelegate_configIQKeyboardManager()
        
        monitorNetwork()
        
        return true
    }
    
    func initWindow() {
        // 创建窗口
        self.window = UIWindow.init()
        self.window?.backgroundColor = UIColor.white
        self.window?.frame = UIScreen.main.bounds
        // 显示窗口
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = JhBaseTabBarController()
    }
    
    // MARK: - 键盘处理
    func AppDelegate_configIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true //工具条
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true //点击背景收回键盘
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "完成"
        //        IQKeyboardManager.shared.preventShowingBottomBlankSpace = true
        //        IQKeyboardManager.shared.preventShowingBottomBlankSpace = false
        IQKeyboardManager.shared.toolbarTintColor = .lightGray
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 5.0
    }
    
    // MARK: - 实时网络监测
    func monitorNetwork() {
        JhReachabilityTool.monitorNetworkStatus1 { status in
            var message = ""
            switch status {
            case .unknown:
                message = "未知网络"
            case .notReachable:
                message = "无网络连接"
            case .wwan:
                message = "蜂窝移动网络"
            case .ethernetOrWiFi:
                message = "WiFi"
            }
            JhLog("当前网络状态===：\(message)")
            JhProgressHUD.showText(message)
        }
    }
    
}

