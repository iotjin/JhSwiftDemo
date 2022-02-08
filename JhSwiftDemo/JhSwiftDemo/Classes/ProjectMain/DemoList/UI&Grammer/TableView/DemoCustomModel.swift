//
//  DemoCustomModel.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/5.
//

import UIKit
import MJExtension

@objc(DemoCustomModel)
@objcMembers

class DemoCustomModel: NSObject {
    dynamic var id :String = ""
    var title:String?
    var text:String = ""
    var img:String = ""
    
    // make sure to use `dynamic` attribute for basic type & must use as Non-Optional & must set initial value
    dynamic var isSpecialAgent: Bool = false
    dynamic var age: Int = 0
    dynamic var ID: Int = 0
    
    var cellHeight:CGFloat {
        get {
            let height =  text.Jh_getStringHeight(kScreenWidth-125.0, 17.0)
//            JhLog("height : \(height)")
            return height>50 ? height:50.0
        }
    }
    
}


////实体model类
//struct LoginLocalModel {
//    var user : UserModel
//    var header : HeaderModel
//
//    var app_token : String
//    var uploadurl : String
//
//    init(jsonData: JSON) {
//        user = UserModel(jsonData:["user"])
//        header = HeaderModel(jsonData:["header"])
//
//        app_token = jsonData["app_token"].stringValue
//        uploadurl = jsonData["uploadurl"].stringValue
//    }
//}
