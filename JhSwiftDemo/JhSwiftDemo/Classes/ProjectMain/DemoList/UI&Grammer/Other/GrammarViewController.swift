//
//  GrammarViewController.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/31.
//

import Foundation


class GrammarViewController: JhBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Jh_navTitle = "数据类型"
        initData()
    }
    
    func initData(){
        /*
         Swift的数据类型：
         Int、Float、Double、Bool、Character、String
         Array、Dictionary、（元组类型）Tuple、（可选类型）Optional、（集合）Set、
         */
        
        createBaseType()
        createString()
        createArr()
        createDict()
        createDictArr()
        createTuple()
        createOptionals()
        createSet()
        createOther()
    }
    
    func createBaseType() {
        JhLog(" -------------------- 基本数据类型 -------------------- ");
        
        // 常量。使用let
        let varA = 3.14159
        print(varA)
        
        // 变量。使用var
        // 变量名需要以字母或下划线开始。
        var varB = 42
        varB = 43
        print(varB)
        
        var varC:Float
        varC = 3.14159
        print(varC)
        
        var varD:String = "Hello"
        varD = "Hello World"
        print(varD)
        
        // 字面量
        // 所谓字面量，就是指像特定的数字，字符串或者是布尔值这样，能够直接了当地指出自己的类型并为变量进行赋值的值。比如在下面：
        let aNumber = 3         // 整型字面量
        let aString = "Hello"   // 字符串字面量
        let aBool = true        // 布尔值字面量
        print(aNumber,aString,aBool)
        
        // 循环
        // swift循环使用 遍历，for循环在Swift 3 中弃用
        let someInts:[Int] = [10, 20, 30]
        for index in someInts {
            print( "index 的值为 \(index)")
        }
        
        // 字符串
        let constA = "Hello"
        let constB = "World"
        // 字符串连接使用 +
        var stringA = constA + constB
        stringA += "!!!"
        print( stringA )
        // 打印结果: HelloWorld!!!
        
        // 字符串插入
        let name = "小明"
        let message = "\(name)，Hello!"
        print( message )
        // 打印结果: 小明，Hello!
        
        // 字符串长度使用 String.count
        print( "\(stringA), 长度为 \(stringA.count)" )
        // 打印结果: HelloWorld!!!, 长度为 13
        
        // 字符串比较是否相等使用 == 或者 !=
        if constA == constB {
            print( "\(constA) 与 \(constB) 是相等的" )
        } else {
            print( "\(constA) 与 \(constB) 是不相等的" )
        }
        
        // isEmpty
        // 判断字符串是否为空，返回布尔值
        let stringTmpty = ""
        if stringTmpty.isEmpty {
            print( "stringTmpty 是空的" )
        } else {
            print( "stringTmpty 不是空的" )
        }
        
        // hasPrefix(prefix: String)
        // 检查字符串是否拥有特定前缀
        let hasPrefixStr = "https://www.baidu.com"
        if hasPrefixStr.hasPrefix("http") {
            print( "包含" )
        } else {
            print( "不包含" )
        }
        
        // hasSuffix(suffix: String)
        // 检查字符串是否拥有特定后缀。
        if hasPrefixStr.hasSuffix("com") {
            print( "包含" )
        } else {
            print( "不包含" )
        }
        
        // 转换字符串数字为整型。 Int(String)
        let myString: String = "256"
        let myInt: Int? = Int(myString)
        print(myInt!)
    }
    
    func createString() {
        JhLog(" -------------------- 字符串数组互转 -------------------- ");
        
        // 字符串转数组
        let string = "abcd哈哈"
        // 数组自带方法, 用字符串生成单字符组成的数组
        let strArray1 = Array(string)
        print(strArray1)
        // 打印结果: ["a", "b", "c", "d", "哈", "哈"]
        
        let splitString1 = "abccdabccdabcd"
        // 方法1:  如果字符串中存在两个相邻的分隔符, 则不保留空字符串
        let splitArray1 = splitString1.split(separator: "c")
        print(splitArray1)
        // 打印结果: ["ab", "dab", "dab", "d"]
        
        //方法2: 如果字符串中存在两个相邻的分隔符, 则保留空字符串
        let splitString2 = "abccdabccdabcd"
        let splitArray2 = splitString2.components(separatedBy: "c")
        print(splitArray2)
        // 打印结果: ["ab", "", "dab", "", "dab", "d"]
        
        // 数组转字符串，以指定符号分割
        let testArr = ["1","2","3","4","5","6","7","哈哈A","哈"]
        let resultStr = testArr.joined(separator: ",")
        print(resultStr)
        // 打印resultStr结果：1,2,3,4,5,6,7,哈哈A,哈
    }
    
    // 对象数组
    func createDictArr() {
        JhLog(" -------------------- 对象数组 -------------------- ");
        
        var dataArr:Array<[String:String]> = []
        
        let length = 10;
        for i in 0 ..< length {
            let tempDict = ["id":"\(i)","name":"小胖纸"]
            dataArr.append(tempDict)
        }
        JhLog("对象数组 : \(dataArr)")
        // 打印结果: 对象数组 : [["id": "0", "name": "小胖纸"], ["id": "1", "name": "小胖纸"], ["id": "2", "name": "小胖纸"], ["name": "小胖纸", "id": "3"], ["id": "4", "name": "小胖纸"], ["name": "小胖纸", "id": "5"], ["id": "6", "name": "小胖纸"], ["name": "小胖纸", "id": "7"], ["id": "8", "name": "小胖纸"], ["name": "小胖纸", "id": "9"]]
        JhAllLog(dataArr)
        
        var dataDict = [String:Any]()
        dataDict["code"] = 0
        dataDict["msg"] = ""
        dataDict["hasNext"] = true
        dataDict["data"] = dataArr
        
        JhAllLog(dataDict)
        JhLog("对象数组2 : \(dataDict)")
        // 打印结果: 对象数组2 : ["hasNext": true, "msg": "", "data": [["id": "0", "name": "小胖纸"], ["id": "1", "name": "小胖纸"], ["id": "2", "name": "小胖纸"], ["name": "小胖纸", "id": "3"], ["id": "4", "name": "小胖纸"], ["name": "小胖纸", "id": "5"], ["id": "6", "name": "小胖纸"], ["name": "小胖纸", "id": "7"], ["id": "8", "name": "小胖纸"], ["name": "小胖纸", "id": "9"]], "code": 0]
        
        JhLog(dataDict["code"]!)
        JhLog(dataDict["hasNext"]!)
        JhLog(dataDict["data"]!)
    }
    
    // 数组
    func createArr() {
        JhLog(" -------------------- 数组 -------------------- ");
        // 有值数组
        let arr0 = [1, 2, 3]
        let arr1: Array = [1, 2, 3]
        let arr2: Array<Int> = [1, 2, 3]
        let arr3: [Int] = [1, 2, 3]
        let arr4: [Any] = [1, 2.2, "3"]
        print(arr0,arr1,arr2,arr3,arr4)
        
        // 空数组
        let arr5 = [String]()
        let arr6 = [Int]()
        let arr7 = Array<Int>()
        let emptyIntArr:Array<Int> = Array()
        
        // 不可变数组:
        let arr8  = [Any]()
        print(arr5,arr6,arr7,emptyIntArr,arr8)
        
        // 可变数组:
        var tempArr:Array<Any> = []
        
        // 使用Any关键字, 表示数组中可以存放不同类型的数据
        // 写法一：
        let arr10 = [1, 2.2, "3"] as [Any]
        print(arr10)
        // 打印结果: [1, 2.2, "3"]
        // 写法二：
        let arr11:Array<Any> = [1, 2.2, "3"]
        print(arr11)
        // 打印结果: [1, 2.2, "3"]
        
        let arr12:Array<[String:Any]> = [["id":"1","name":"小胖纸1"],["id":"2","name":"小胖纸2"]]
        print(arr12)
        // 打印结果: [["id": "1", "name": "小胖纸1"], ["id": "2", "name": "小胖纸2"]]
        
        // 数组拼接 append 或者 +=
        let tempDict = ["id":"1","name":"小胖纸"]
        tempArr.append(tempDict)
        tempArr += [300]
        print(tempArr)
        // 打印结果: [["id": "1", "name": "小胖纸"], 300]
        print(tempArr[0])
        // 打印结果: ["id": "1", "name": "小胖纸"]
        print(tempArr[1])
        // 打印结果: 300
        
        let dict = tempArr[0] as! [String: String]
        let strId = dict["id"] ?? ""
        let strName = dict["name"] ?? ""
        print(dict)
        // 打印结果: ["id": "1", "name": "小胖纸"]
        print(strId)
        // 打印结果: 1
        print(strName)
        // 打印结果: 小胖纸
        
        // 数组插入元素到指定位置
        tempArr.insert("Frank", at: 0)
        print(tempArr)
        // 打印结果: ["Frank", ["id": "1", "name": "小胖纸"], 300]
        tempArr[0] = "Frank22222"
        print(tempArr)
        // 打印结果: ["Frank22222", ["id": "1", "name": "小胖纸"], 300]
        
        // 移除指定索引元素
        tempArr.remove(at: 0)
        print(tempArr)
        // 打印结果: [["id": "1", "name": "小胖纸"], 300]
        
        // 遍历
        for item in tempArr {
            print(item)
        }
    }
    
    // 字典
    func createDict() {
        JhLog(" -------------------- 字典 -------------------- ");
        
        // 空字典
        let dict1 = [String: Int]()
        let dict2 = [String:AnyObject]()
        let dict3:Dictionary<String,Any> = [:]
        let dict4:[Int:String] = [:]
        print(dict1,dict2,dict3,dict4)
        
        // 有值字典
        let dict5 = ["One":1, "Two":2,"Three":3]
        let dict6:[String:Any] = ["One":1, "Two":2,"Three":3]
        let dict7:Dictionary<String,Any> = ["One":1, "Two":2,"Three":3]
        let dict8:[String:Any] = ["One":1, "Two":2,"Three":3]
        let dict9:Dictionary = ["One":1, "Two":2,"Three":3] as [String : Any]
        print(dict5,dict6,dict7,dict8,dict9)
        
        // 字典判空
        print("dict1 = \(dict1.isEmpty)")
        print("dict5 = \(dict5.isEmpty)")
        // 打印结果: dict1 = true
        // 打印结果: dict5 = false
        
        // 字典字面值
        let dict = ["A": 1, "B": 2, "C": 3, "D": 4]
        print(dict)
        print(dict["A"] ?? "")
        // 打印结果: 1
        
        var someDict:[String:Int] = ["One":1, "Two":2,"Three":3]
        
        // 更新值
        // 使用 updateValue(forKey:) 增加或更新字典的内容。如果 key 不存在，则添加值，如果存在则修改 key 对应的值。
        // updateValue(_:forKey:)方法返回Optional值
        let oldVal = someDict.updateValue(11, forKey: "One")
        print( "key = One 旧的值",oldVal!)
        print( "key = One 的值为 \(someDict["One"]!)" )
        print( "key = Two 的值为 \(someDict["Two"]!)" )
        // 打印结果: key = One 旧的值 1
        // 打印结果: key = One 的值为 11
        // 打印结果: key = Two 的值为 2
        
        someDict["One"] = 111
        print(someDict)
        // 打印结果: ["Three": 3, "Two": 2, "One": 111]
        
        // 移除对
        // 使用 removeValueForKey() 方法来移除字典 key-value 对。如果 key 存在该方法返回移除的值，如果不存在返回 nil
        someDict.removeValue(forKey: "Three")
        someDict["Three"] = nil
        print("移除key = Three后的字典为：")
        print(someDict)
        // 打印结果: ["Two": 2, "One": 111]
        
        // 遍历字典
        for (key, value) in someDict {
            print("字典 key \(key) -  字典 value \(value)")
        }
        // 打印结果: 字典 key One -  字典 value 111
        // 打印结果: 字典 key Two -  字典 value 2
        
        // 遍历字典的key
        for key in someDict.keys {
            print("\(key), ") // no newline
        }
        // 打印结果: One,
        // 打印结果: Two,
        
        // 字典keys、values转换为数组
        let dictKeys = [String](someDict.keys)
        let dictValues = [Int](someDict.values)
        print("字典 dictKeys \(dictKeys) ")
        print("字典 dictValues \(dictValues) ")
        // 打印结果: 字典 dictKeys ["One", "Two"]
        // 打印结果: 字典 dictValues [111, 2]
        
        // count 属性
        // 使用只读的 count 属性来计算字典有多少个键值对：
        print("someDict 含有 \(someDict.count) 个键值对")
        // 打印结果: someDict 含有 2 个键值对
    }
    
    // 元祖
    func createTuple() {
        JhLog(" -------------------- 元祖 -------------------- ");
        
        // 元祖是复合类型，与数组类似, 不需要提前定义类型。使用的是圆括号，小括号中可以写任意类型
        let data = ("A", 10, 10.8)
        print(data.0)
        print(data.1)
        print(data.2)
        
        let data2 = (A:1, B: 2, C: 3)
        print(data2.A)
        
        // 元祖的其它定义方式:指明应用元祖元素的名称
        let student = (name:"张三",age:30,score:99.8)
        print(student.name)
        print(student.age)
        print(student.score)
        
        /*
         元祖的其它定义方式:
         通过指定的名称提取元祖对应的值, 会将对应位置的值 赋值给对应位置的名称
         */
        let (name , age , score) =  ("张三", 30, 99.8)
        print(name)
        print(age)
        print(score)
        
        // 如果不关心元祖中的某个值可以利用_通配符来忽略提取
        let (name1 , age1 , _) =  ("张三", 30, 99.8)
        print(name1)
        print(age1)
    }
    
    // 可选类型
    func createOptionals() {
        JhLog(" -------------------- 可选类型 -------------------- ");
        
        // Swift 的可选（Optional）类型，用于处理值缺失的情况。可选表示"那儿有一个值，并且它等于 x "或者"那儿没有值"。
        // Swfit语言定义后缀？作为命名类型Optional的简写
        
        // 空的可选类型
        let optionalInteger1: Int? = nil
        let optionalInteger2: Optional<Int> = nil
        print(optionalInteger1 as Any) // 等同于 print(optionalInteger1)
        // 打印结果: nil
        print(optionalInteger1 ?? 0)
        // 打印结果: 0
        print(optionalInteger2 ?? 0)
        // 打印结果: 0
        
        // 有默认值的可选类型
        let optionalInt: Int? = 10
        let optionalString: String? = "optionalString"
        print(optionalInt as Any) // 等同于 print(optionalInt)
        // 打印结果: Optional(10)
        print(optionalString as Any) // 等同于 print(optionalString)
        // 打印结果: Optional("optionalString")
        
        // 使用时默认不处理有警告，可使用下面方式处理
        // 例如：print(optionalInt) ：Expression implicitly coerced from 'String?' to 'Any'
        print(optionalInt as Any)
        // 打印结果: Optional(10)
        print(String(describing: optionalString))
        // 打印结果: Optional("optionalString")
        print(optionalInt ?? 0)
        // 打印结果: 10
        print(optionalString!)
        // 打印结果: optionalString
    
        let emptyString:String? = nil
        if emptyString != nil {
            print(emptyString!)
        } else {
            print("字符串为 nil")
        }
        // 打印结果: 字符串为 nil
        
        
        // 强制解析(也叫强制解包、显示解包)，使用感叹号（!），必须保证有值，否则报错
        // 当确定可选类型确实包含值之后，可以在可选的名字后面加一个感叹号（!）来获取值。这个感叹号表示"我知道这个可选有值，请使用它。"这被称为可选值的强制解析（forced unwrapping）
        let age: Int? = 10
        print("age： \(age!) ") // 强制解析
        print(age ?? 0)
        
        // 自动解析(也叫自动解包、隐式解包)，声明时使用感叹号（!），隐式解析可选类型还是可选类型
        // 在声明可选变量时使用感叹号（!）替换问号（?）。这样可选变量在使用时就不需要再加一个感叹号（!）来获取值，它会自动解析。
        let name: Int! = 10
        print("name： \(name as Any) ") // 等同于 print("name： \(name) ")
        // 打印结果: name： Optional(10)
        let newName:Int = name ?? 0
        print("newName： \(newName) ")
        // 打印结果: newName： 10
        
        // 可选绑定
        // 使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在if和while语句中来对可选类型的值进行判断并把值赋给一个常量或者变量
        if let newAge: Int = age {
            print("age： \(newAge) ")
        } else {
            print("age为 0 ")
        }
        // 打印结果: age： 10
    }
    
    func createSet() {
        JhLog(" -------------------- 集合 -------------------- ");
        
        // 集合（set）是没有顺序的相同类型唯一值的集合。集合只是一个容器，可以在无序列表中保存多个数据类型的值，并确保容器中的元素唯一（即每个数据仅出现一次)
        
        // 空集合
        let set1: Set<Int> = []
        let set2 = Set<Int>()
        print(set1,set2)
        
        // 非空集合
        let someIntSet:Set<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        print(someIntSet)
        // 因为无序，所以打印值每次不一样
        // 打印结果: [10, 1, 5, 2, 4, 7, 8, 9, 3, 6]
        let someIntSet2:Set = [1, 3, 5, 7, 9] // 因为swift有类型推断，可以忽略类型
        print(someIntSet2)
        // 打印结果: [9, 5, 3, 1, 7]
        
        // 有重复值的集合
        var someIntSet3:Set = [1, 1, 1, 2, 3]
        print(someIntSet3)
        // 打印结果: [3, 2, 1]
        
        // 判空
        print("判空： \(someIntSet.isEmpty) ")
        // 打印结果: 判空： false
        
        // 个数
        print("个数： \(someIntSet.count) ")
        // 打印结果: 个数： 10
        
        // 是否包含
        // 使用 contains(_:) 来检查特定元素是否存在：
        print("是否包含： \(someIntSet3.contains(1)) ")
        // 打印结果: 是否包含： true
        print("是否包含： \(someIntSet3.contains(4)) ")
        // 打印结果: 是否包含： false
        
        // 访问集合的第一个元素,因为无序，每次不一样
        print(someIntSet.first!)
        // 打印结果: 10
        
        // 最小值
        print(someIntSet.min()!)
        // 打印结果: 1
        
        // 最大值
        print(someIntSet.max()!)
        // 打印结果: 10
        
        // 插入
        someIntSet3.insert(4)
        print(someIntSet3)
        // 打印结果: [3, 2, 1, 4]
        
        // 删除
        someIntSet3.remove(4)
        print(someIntSet3)
        // 打印结果: [3, 2, 1]
        
        // 交集（Union），两个集合a和b元素的集合
        print("交集： \(someIntSet.union(someIntSet3)) ")
        // 打印结果: [5, 9, 2, 6, 8, 10, 4, 1, 3, 7]
        
        // 并集（Intersect），元素同时属于a和b
        print("并集： \(someIntSet.intersection(someIntSet3)) ")
        // 打印结果: [2, 1, 3]
        
        // 差集（Subtract），元素包含 a 的所有元素，但去掉同样属于 b 的元素
        print("差集： \(someIntSet.subtracting(someIntSet3)) ")
        // 打印结果: [5, 9, 6, 8, 10, 4, 7]
        
        // 对称差集，元素位于两个集合中的任何一个中，但不同时存在两个集合中
        print("对称差集： \(someIntSet.symmetricDifference(someIntSet3)) ")
        // 打印结果:  [5, 9, 6, 8, 10, 4, 7]
    }
    
    func createOther() {
        JhLog(" -------------------- 函数 -------------------- ");
        
        let a = funAdd(a: 1, b: 2)
        print("a :",a)
        // 打印结果: a : 3
        
        let b = funSub(1,2)
        print("b :",b)
        // 打印结果: b : -1.0
        
        let c = funSub(2)
        print("c :",c)
        // 打印结果: c : 2.0
        
        let d = funMinMax(11, 22, 33)
        print("d :",d)
        print("d-min :",d.min)
        print("d-max :",d.max)
        
        // 打印结果: d : (min: 11.0, max: 33.0)
        // 打印结果: d - min : 11.0
        // 打印结果: d - max : 33.0
    }
    // 显示形参的函数
    func funAdd(a: Int, b: Int) -> Int {
        return a + b
    }
    // 不显示形参，带默认值的函数
    // "方法名(_ 参数名：参数类型 = 默认值) -> 返回类型{ return body }"
    // "_ "可以不显示外置参数名，添加"="可以设置默认值
    func funSub(_ a: Float,_ b: Float = 0) -> Float {
        return a - b
    }
    // 通过元祖返回多个值
    func funMinMax(_ a: Float = 0,_ b: Float = 0,_ c: Float = 0) -> (min: Float, max: Float) {
        let minNum = min(min(a, b), c)
        let maxNum = max(max(a, b), c)
        return (minNum,maxNum)
    }
}
