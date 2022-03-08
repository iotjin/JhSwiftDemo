//
//  JhRequest.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/28.
//  链式网络请求工具类：Alamofire + SwiftyJSON

import Foundation
import Alamofire
import SwiftyJSON

enum HttpRequestType {
    case get
    case post
}

public let JhRequest = NetworkKit.shared

// Networkkit属性设置
public class NetworkKit {
    
    public static let shared = NetworkKit()
    
    typealias SuccessHandlerType = ((JSON) -> Void)
    typealias FailureHandlerType = ((Int?, String) ->Void)
    
    private var requestType: HttpRequestType = .post//请求类型
    private var url: String?    // URL
    private var params: [String: Any]?  // 参数
    private var success: SuccessHandlerType?    // 成功的回调
    private var failure: FailureHandlerType?    // 失败的回调
    private var httpRequest: Request?
    
}

// NetworkKit属性的设置
extension NetworkKit{
    /// 设置url
    func url(_ url: String?) -> Self {
        self.url = url
        return self
    }
    
    /// 设置post/get 默认post
    func requestType(_ type:HttpRequestType) -> Self {
        self.requestType = type
        return self
    }
    
    /// 设置参数
    func params(_ params: [String: Any]?) -> Self {
        self.params = params
        return self
    }
    
    /// 成功的回调
    func success(_ handler: @escaping SuccessHandlerType) -> Self {
        self.success = handler
        return self
    }
    
    ///失败的回调
    func failure(handler: @escaping FailureHandlerType) -> Self {
        self.failure = handler
        return self
    }
    
}

// NetworkKit请求相关
extension NetworkKit{
    
    /// 发起请求 设置好相关参数后再调用
    func request() -> Void {
        var dataRequest: DataRequest?   // alamofire请求后的返回值
        
        // 发起请求
        if let URLString = url {
//            ProgressHUD.show()
            let method = requestType == .get ? HTTPMethod.get : HTTPMethod.post
            dataRequest =  Alamofire.request(URLString, method: method, parameters: params)
            httpRequest = dataRequest
        }
        
        dataRequest?.responseJSON {
            (response) in
//            ProgressHUD.hide()
            
            switch response.result {
            case let .success(response):
                do {
                    // *********** 这里可以统一处理错误码，弹出提示信息 ***********
                    let responseObject = JSON(response)
                    let code = responseObject["code"].intValue
                    let msg = String(describing: responseObject["msg"])
                    switch (code) {
                    case 200 :
                        // 数据返回正确
                        self.success?(responseObject)
                    case 401:
                        // 请重新登录
                        self.failure?(code,msg)
                        alertLogin(msg)
                    default:
                        // 其他错误
                        failureHandle(failure: self.failure, stateCode: code, message: msg)
                    }
                }
            case let .failure(error):
                failureHandle(failure: self.failure, stateCode: nil, message: error.localizedDescription)
            }
        }
        
        // 错误处理 - 弹出错误信息
        func failureHandle(failure: FailureHandlerType? , stateCode: Int?, message: String) {
            Alert.show(type: .error, text: message)
            failure?(stateCode ,message)
        }
        
        // 登录弹窗 - 弹出是否需要登录的窗口
        func alertLogin(_ title: String?) {
            // TODO: 跳转到登录页的操作：
        }
    }
    
    // 取消请求
    func cancel() {
        httpRequest?.cancel()
    }
    
}
