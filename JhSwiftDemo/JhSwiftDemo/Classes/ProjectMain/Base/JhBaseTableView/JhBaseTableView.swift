//
//  JhBaseTableView.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/5.
//

import UIKit


enum JhEmptyDataViewState : Int {
    /// 状态0 - 暂无数据
    case JhStateNoData = 0
    /// 状态1 -网络请求错误,(网络不可用,请检查网络设置)
    case JhStateNetWorkError
    /// 状态2 - 重新加载
    case JhStateLoading
}

private let kNoDataStr = "暂无数据"
private let kNetWorkErrorStr = "网络不给力,点击重新加载"
private let kNoDataViewOffsetHeight = -(kScreenHeight*0.5 - kNavHeight - 50.0)

class JhBaseTableView: UITableView,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        
        initData()
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame:frame,style:style)
        
        initData()
    }
    
    /// 点击重新加载按钮 的Block
    var JhClickEmptyViewBlock:(() -> (Void))?
    
    /// 空数据文字
    var Jh_title: String = kNoDataStr
    /// 按钮文字
    var Jh_buttonTitle: String = kNetWorkErrorStr
    
    /// 显示空数据占位图
    /// - Parameter emptyState: 类型
    func JhShowEmptyDataViewWithType(_ emptyState:JhEmptyDataViewState) {
        self.emptyState = emptyState
        configNoDataPicture()
    }
    
    private var emptyState: JhEmptyDataViewState = .JhStateNoData
    
    private func initData() {
        self.backgroundColor = BaseBgColor
        configIOS11()
    }
    
    // MARK: - iOS 适配
    private func configIOS11() {
        /// 适配 iOS 11.0 ,iOS11以后，控制器的automaticallyAdjustsScrollViewInsets已经废弃，所以默认就会是YES
        /// iOS 11新增：adjustContentInset 和 contentInsetAdjustmentBehavior 来处理滚动区域
        if #available(iOS 11.0, *) {
            self.estimatedRowHeight = 0
            self.estimatedSectionHeaderHeight = 0
            self.estimatedSectionFooterHeight = 0
            // 防止列表/页面偏移
            self.contentInsetAdjustmentBehavior = .never
        }
    }
    
    // MARK: - 设置空数据展示图
    private func configNoDataPicture() {
        self.emptyDataSetSource = self
        self.emptyDataSetDelegate = self
        self.tableFooterView = UIView()
        self.reloadEmptyDataSet()
    }
    
    // MARK: - 防止 刷新后DZNEmptyDataSetView 向上偏移一段距离(空数据展示丢失的问题)
    func emptyDataSetWillAppear(_ scrollView: UIScrollView!) {
        scrollView.contentOffset = CGPoint.zero
    }
    
    // MARK: - 空白界面的标题
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        var title = ""
        if (emptyState == .JhStateNoData) {
            title = kNoDataStr;
        } else if (emptyState == .JhStateNetWorkError) {
            title = kNetWorkErrorStr;
        } else if (emptyState == .JhStateLoading) {
            title = ""
        }
        
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: CGFloat(15.0)), NSAttributedString.Key.foregroundColor: BaseEmptyDataTextColor]
        return NSAttributedString(string: title, attributes: attributes)
    }
    
    // MARK: - 调整内容视图的垂直对齐（垂直偏移量）方式
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        // 距离顶部距离
        if (emptyState == .JhStateNoData) {
            return kNoDataViewOffsetHeight - 20
        }
        return kNoDataViewOffsetHeight
    }
    
    //    // MARK: - 组件间的空隙 默认11
    //    func spaceHeight(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
    //        return 20
    //    }
    
    // MARK: - 空白页上view点击事件
    func emptyDataSet(_ scrollView: UIScrollView!, didTap view: UIView!) {
        JhLog(" JhBaseTableView - view点击事件 ")
    }
    
    // MARK: - 是否允许滚动，默认NO
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    // MARK: - 空白页上Btn点击事件
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        if (emptyState == .JhStateNetWorkError) {
            JhLog(" JhBaseTableView - 点击了空白页上按钮 ")
            emptyState = .JhStateLoading
            self.reloadEmptyDataSet()
            self.JhClickEmptyViewBlock?()
        }
    }
    
    // MARK: - 设置按钮图片(这张图片是带边框带重新加载文字的图片)
    func buttonImage(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> UIImage! {
        var image = UIImage(named: "empty")
        if (emptyState == .JhStateNetWorkError) {
            image = UIImage(named:"JhEmptyDataView.bundle/NullData_reloadData")
        } else {
            image = UIImage(named: "empty")
        }
        return image
    }
    
}
