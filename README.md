# JhSwiftDemo

A new Swift project - 实现一些常用效果、封装通用组件和工具类 <br> 
<br>


代码不定期更新
<br>

<br>

## 实现的一些效果

* 通用框架搭建、通用基类实现
* 字体、颜色、Frame、字符串宏定义
* 添加OC和Swift混合开发`Bridging-Header`
* 组件、分类、工具类实现
* 网络请求封装(`Alamofire`+`Moya`+`SwiftyJSON`)和`链式`请求
* 接口管理`APIManager`
* 实时网络监测
* 暗黑模式适配
* 基础语法使用
* 基础控件使用
* UI相关
* `UITableView`相关
  * 基类封装(支持上下拉刷新、空数据、网络异常处理)
  * 二次封装上下拉刷新
  * 分页网络请求Demo（SwiftyJSON、MJExtension、HandyJSON、Codable解析方式）
* `UICollectionView`相关
  * 基类封装
  * 网络请求Demo（SwiftyJSON解析方式）
* 三方库使用示例
  * `SnapKit`



## 文件结构

- Configs：各种配置文件和全局方法（其实就是宏定义文件，不过swift没有宏定义这个说法）
- Manages：数据管理、网络请求和接口管理
- ProjectMain：业务文件和基类
- JhCommon：工具文件，封装的组件、分类、工具类
- Resources：资源文件
- Vendors：导入的第三方
- Other：AppDelegate


```swift
JhSwiftDemo
├── JhSwiftDemo
│   ├── Classes
│   │   ├── Configs
│   │   │   ├── JhConst.swift
│   │   │   ├── JhConfigMacro.swift
│   │   │   ├── JhConfigFrameMacro.swift
│   │   │   ├── JhConfigFontColorMacro.swift
│   │   │   └── JhSwiftDemo-Bridging-Header.h
│   │   ├── Managers
│   │   │   ├── DataManagers
│   │   │   │   └── UserDataManager.swift
│   │   │   └── HttpManagers
│   │   │       ├── Moya
│   │   │       ├── 链式
│   │   │       └── other
│   │   ├── ProjectMain
│   │   │   ├── Base
│   │   │   │   ├── JhBaseCollectionView
│   │   │   │   │   ├── JhBaseCollectionView.swift
│   │   │   │   │   ├── JhBaseCollectionViewCell.swift
│   │   │   │   │   └── JhBaseCollectionViewController.swift
│   │   │   │   ├── JhBaseNavigationController.swift
│   │   │   │   ├── JhBaseTabBarController.swift
│   │   │   │   ├── JhBaseTableView
│   │   │   │   │   ├── JhBaseHeaderView.swift
│   │   │   │   │   ├── JhBaseHeaderView.xib
│   │   │   │   │   ├── JhBaseTableView.swift
│   │   │   │   │   ├── JhBaseTableViewCell.swift
│   │   │   │   │   ├── JhBaseTableViewController.swift
│   │   │   │   │   ├── JhCustumCellTableViewController.swift
│   │   │   │   │   ├── JhEmptyDataView.bundle
│   │   │   │   │   └── JhTextListTableViewController.swift
│   │   │   │   ├── JhBaseViewController.swift
│   │   │   │   └── Web
│   │   │   │       └── JhBaseWebViewController.swift
│   │   │   ├── DemoList
│   │   │   ├── Login
│   │   │   ├── Module1
│   │   │   ├── Module2
│   │   │   ├── Module3
│   │   │   ├── Module4
│   │   │   └── Newfeature
│   │   ├── JhCommon
│   │   │   ├── JhComponents
│   │   │   ├── JhCategory
│   │   │   │   ├── OC
│   │   │   │   ├── Foundation
│   │   │   │   ├── UIKit
│   │   │   │   └── Vendors
│   │   │   └── JhTools
│   │   └── Vendors
│   │   ├── Other
│   │   │   └── AppDelegate.swift
│   │   ├── Resources
│   │   │   ├── APPIcon
│   │   │   └── Images
│   ├── Info.plist
│   ├── Assets.xcassets
│   └── LaunchScreen.storyboard
├── JhSwiftDemo.xcodeproj
├── JhSwiftDemo.xcworkspace
├── JhSwiftDemoTests
├── JhSwiftDemoUITests
├── Podfile
├── Podfile.lock
└── Pods
```
