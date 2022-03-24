//
//  JhHttpTool.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/28.
//  网络请求工具类：Alamofire + Moya + SwiftyJSON

import Foundation
import Alamofire
import Moya
import SwiftyJSON

public class JhHttpTool {
    /// 使用Moya的请求封装
    ///
    /// - Parameters:
    ///   - target: 请求API，TargetType里的枚举值
    ///   - success: 成功的回调
    ///   - error: 连接服务器成功但是数据获取失败
    ///   - failure: 连接服务器失败
    public class func request<T: TargetType>(_ target: T, success: @escaping((Any) -> Void), failure: ((Int?, String) ->Void)?) {
        let provider = MoyaProvider<T>(plugins: [
            RequestHandlingPlugin(),
            //            networkLoggerPlugin
        ])
        
        if (!isNetwork()) {
            failureHandle(failure: failure, stateCode: -1009, message: "网络不可用")
            return
        }
        
        provider.request(target) { result in
            switch result {
            case let .success(response):
                //                let json = try? response.mapString()
                //                let responseObject = try? response.mapJSON()
                //                JhLog( responseObject ?? "" );
                do {
                    // *********** 这里可以统一处理错误码，弹出提示信息 ***********
                    let resObject = try? response.mapJSON()
                    let responseObject = JSON(resObject ?? "")
                    let code = responseObject["code"].intValue
                    let msg = String(describing: responseObject["msg"])
                    switch (code) {
                    case 200 :
                        // 数据返回正确
                        success(responseObject)
                    case 401:
                        // 请重新登录
                        failure!(code,msg)
                        alertLogin(msg)
                    default:
                        // 其他错误
                        failureHandle(failure: failure, stateCode: code, message: msg)
                    }
                }
            case let .failure(error):
                let statusCode = error.response?.statusCode ?? 1000
                let message = "请求出错，错误码：" + String(statusCode)
                JhAllLog(message)
                failureHandle(failure: failure, stateCode: statusCode, message: error.errorDescription ?? message)
            }
        }
        
        // 错误处理 - 弹出错误信息
        func failureHandle(failure: ((Int?, String) ->Void)? , stateCode: Int?, message: String) {
            showLoading(message)
            failure?(stateCode ,message)
        }
        
        // 登录弹窗 - 弹出是否需要登录的窗口
        func alertLogin(_ title: String?) {
            // TODO: 跳转到登录页的操作：
        }
        
        // 信息弹框
        func showLoading(_ message: String) {
            //            Alert.show(type: .error, text: message)
            JhProgressHUD.showText(message)
        }
        
        // 基于Alamofire，判断网络是否连接，返回一个布尔值
        func isNetwork() -> Bool {
            let networkManager = NetworkReachabilityManager()
            return networkManager?.isReachable ?? true // 无返回就默认网络已连接
        }
        
    }
    
    // MARK: - 打印日志
    //    static let networkLoggerPlugin = NetworkLoggerPlugin(verbose: true, cURL: true, requestDataFormatter: { data -> String in
    //        return String(data: data, encoding: .utf8) ?? ""
    //    }) { data -> (Data) in
    //        do {
    //            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
    //            let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
    //            return prettyData
    //        } catch {
    //            return data
    //        }
    //    }
}
