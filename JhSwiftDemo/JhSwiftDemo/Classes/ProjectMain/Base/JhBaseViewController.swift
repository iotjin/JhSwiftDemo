//
//  JhBaseViewController.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/28.
//

import UIKit
import Foundation

/// 上下拉刷新状态
enum JhRefreshType : Int {
    /// 状态0 -  默认状态
    case JhRefreshTypeNone = 0
    /// 状态1 - 上拉刷新
    case JhRefreshTypeHeader
    /// 状态2 - 下拉刷新
    case JhRefreshTypeFooter
}

class JhBaseViewController: UIViewController {
    
    deinit {
        print(" JhBaseViewController - dealloc ")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = BaseBgColor
        
        configIOS11()
        configIOS15()
    }
    
    /// 标题
    var Jh_navTitle :String? {
        didSet {
            self.navigationItem.title = Jh_navTitle
        }
    }
    /// 导航栏左侧标题
    var Jh_navLeftTitle :String? {
        didSet {
            let item =  UIBarButtonItem.Jh_textItem(title: Jh_navLeftTitle ?? "", titleColor: BaseNavTextColor, target: self, action: #selector(ClickLeftItem))
            self.navigationItem.leftBarButtonItem = item
        }
    }
    /// 导航栏左侧img
    var Jh_navLeftImage :String? {
        didSet {
            let item =  UIBarButtonItem.Jh_imageItem(imageName: Jh_navLeftImage ?? "", target: self, action: #selector(ClickLeftItem))
            self.navigationItem.leftBarButtonItem = item
        }
    }
    /// 导航栏右侧标题
    var Jh_navRightTitle :String? {
        didSet {
            let item =  UIBarButtonItem.Jh_textItem(title: Jh_navRightTitle ?? "", titleColor: BaseNavTextColor, target: self, action: #selector(ClickRightItem))
            self.navigationItem.rightBarButtonItem = item
        }
    }
    /// 导航栏右侧img
    var Jh_navRightImage :String? {
        didSet {
            let item =  UIBarButtonItem.Jh_imageItem(imageName: Jh_navRightImage ?? "", target: self, action: #selector(ClickRightItem))
            self.navigationItem.rightBarButtonItem = item
        }
    }
    
    /// 点击导航栏左侧item Block
    var JhClickNavLeftItemBlock:(() -> (Void))?
    /// 点击导航栏右侧item Block
    var JhClickNavRightItemBlock:(() -> (Void))?
    
    @objc func ClickLeftItem() {
        self.JhClickNavLeftItemBlock?()
    }
    
    @objc func ClickRightItem() {
        self.JhClickNavRightItemBlock?()
    }
    
    // MARK: - iOS 适配
    
    func configIOS11() {
        /// 适配 iOS 11.0 ,iOS11以后，控制器的automaticallyAdjustsScrollViewInsets已经废弃，所以默认就会是YES
        /// iOS 11新增：adjustContentInset 和 contentInsetAdjustmentBehavior 来处理滚动区域
        if #available(iOS 11.0, *) {
            UITableView.appearance().estimatedRowHeight = 0
            UITableView.appearance().estimatedSectionHeaderHeight = 0
            UITableView.appearance().estimatedSectionFooterHeight = 0
            // 防止列表/页面偏移
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
            UITableView.appearance().contentInsetAdjustmentBehavior = .never
            UICollectionView.appearance().contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    func configIOS15() {
        // 适配iOS15，tableView的section设置
        // iOS15中，tableView会给每一个section的顶部（header以上）再加上一个22像素的高度，形成一个section和section之间的间距
        // 新增的sectionHeaderTopPadding会使表头新增一段间隙，默认为UITableViewAutomaticDimension
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0
        }
    }
}
