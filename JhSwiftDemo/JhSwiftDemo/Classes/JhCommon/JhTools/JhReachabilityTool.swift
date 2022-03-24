//
//  JhReachabilityTool.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/3/24.
//  实时网络监测

import UIKit
import Alamofire
import Reachability

enum JhNetworkStatus {
    /// 未知网络
    case unknown
    /// 无网络
    case notReachable
    /// 手机网络
    case wwan
    // WIFI网络
    case ethernetOrWiFi
}

class JhReachabilityTool {
    
    static let shared = JhReachabilityTool()
    
    static let reachability = try! Reachability()
    static let networkManager = NetworkReachabilityManager(host: "www.apple.com")
    
    /// 监听网络变化 - ReachabilitySwift
    static func monitorNetworkStatus1(status: @escaping(JhNetworkStatus)->Void) {
        // 网络可用或切换网络类型时执行
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                JhLog("WiFi")
                status(.ethernetOrWiFi)
            } else {
                JhLog("蜂窝移动网络")
                status(.wwan)
            }
        }
        
        // 网络不可用时执行
        reachability.whenUnreachable = { reachability in
            JhLog("无网络连接")
            status(.notReachable)
        }
        
        do {
            // 开始监听，停止监听调用reachability.stopNotifier()即可
            try reachability.startNotifier()
        } catch {
            JhLog("Unable to start notifier")
        }
    }
    
    /// 监听网络变化 - Alamofire
    static func monitorNetworkStatus2(status: @escaping(JhNetworkStatus)->Void) {
        networkManager!.listener = {
            status in
            var message = ""
            switch status {
            case .unknown:
                message = "未知网络"
            case .notReachable:
                message = "无网络连接"
            case .reachable(.wwan):
                message = "蜂窝移动网络"
            case .reachable(.ethernetOrWiFi):
                message = "WiFi"
            }
            JhLog("当前网络状态：\(message)")
        }
        networkManager!.startListening()
    }
    
}


