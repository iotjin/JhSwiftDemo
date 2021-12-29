//
//  AppDelegate.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/27.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //初始化 window
        initWindow()
        
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
    
}

