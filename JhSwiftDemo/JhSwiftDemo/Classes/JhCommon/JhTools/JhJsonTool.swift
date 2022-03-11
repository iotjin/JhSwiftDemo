//
//  JhJsonTool.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/29.
//

import Foundation


class JhJsonTool {
    
    /// 数据（字典/数组）转model
    /// jsonObject->data->model
    /// 转换成功返回对应的model，转换失败返回nil
    static func jsonToModel<T:Codable>(_ jsonObject:Any?, _ modelType:T.Type)->T? {
        guard let obj = jsonObject else {
            return nil
        }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: obj as Any, options:[])
            let model = try JSONDecoder().decode(modelType, from: jsonData)
            return model
        } catch {
            JhLog(error)
            return nil
        }
    }
    
}


/*
 
 http://www.yanzuoguang.com/article/1291
 

 class Student:NSObject,Codable{
     var name: String?
     var age: Int?
 }
 
 字典：

 let jsonObject:[String:Any] = ["name":"xiaohua","age":23]

 let student = JhJsonTool.jsonToModel(jsonObject, Student.self)
 print(student?.name ?? "")

 print(student.name ?? "")
 打印结果： "xiaohua"
 
    
 数组：
 
 let jsonObject = [["name":"xiaohua","age":23],["name":"xiaoming","age":22]]
 let studentArray = DFJsonKit.jsonToModel(jsonObject, Array<Student>.self)

 studentArray?.forEach({ (student) in
     print(student.name ?? "")
     print(student.age ?? 0)
 })
 打印结果： "xiaohua" "23" "xiaoming" "22"
 
 
 */
