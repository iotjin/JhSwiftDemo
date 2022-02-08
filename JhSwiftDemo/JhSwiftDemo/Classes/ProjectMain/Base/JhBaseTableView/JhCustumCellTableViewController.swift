//
//  JhCustumCellTableViewController.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/5.
//

import UIKit

private let CellID = "CellID"

class JhCustumCellTableViewController: JhBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    private func configTableView() {
        self.view.addSubview(self.Jh_tableView)
    }
    
    /// 自定义Cell Block
    var JhCustumCellBlock: ((_ indexPath : IndexPath, _ custumCell : Any ) ->())?
    /// 点击Cell Block
    var JhClickCustumCellBlock: ((_ indexPath : IndexPath) ->())?
    /// Cell高度 Block
    var JhCellHeightBlock: ((_ indexPath : IndexPath, _ cellHeight : CGFloat ) ->())?
    
    /// 自定义的CellName
    var Jh_cellName: String? {
        didSet {
            // Nib注册Cell
            Jh_tableView.register(UINib(nibName: Jh_cellName ?? "JhBaseTableViewCell", bundle: nil), forCellReuseIdentifier: CellID)
        }
    }
    
    /// 数据源
    var Jh_modelArr: Array<Any> {
        get {
            return dataArr
        }
        set(newValue) {
            dataArr = newValue
            // 显示空数据占位图
            if (dataArr.count == 0) {
                Jh_tableView.JhShowEmptyDataViewWithType(.JhStateNoData)
            }
            Jh_tableView.reloadData()
        }
    }
    
    /// Cell高度
    var Jh_cellHeight: CGFloat = 44.0 {
        didSet {
            self.cellHeight = Jh_cellHeight
        }
    }
    
    /// 隐藏分割线
    var Jh_hiddenLine: Bool = false {
        didSet {
            // Nib注册Cell
            Jh_tableView.separatorStyle = Jh_hiddenLine ? .none :.singleLine
        }
    }
    
    //*****************是否开启头部刷新和脚部刷新 子类可在ViewDidLoad方法设置开启与否 默认都不开启******************************//
    
    /// 立即开始头部刷新,默认值==true  (如果不需要立即刷新,需要在设置头部尾部刷新前设置此属性)
    var Jh_isStartRefresh: Bool = true {
        didSet {
            // Nib注册Cell
            Jh_tableView.separatorStyle = Jh_hiddenLine ? .none :.singleLine
        }
    }
    /// 开启头部和尾部刷新
    var Jh_isOpenHeaderAndFooterRefresh: Bool = false {
        didSet {
            if (Jh_isOpenHeaderAndFooterRefresh == true) {
                Jh_tableView.mj_header = JhRefreshHeader(refreshingTarget: self, refreshingAction: #selector(JhHeaderRefresh))
                if (Jh_isStartRefresh == true) {
                    Jh_tableView.mj_header?.beginRefreshing()
                }
                Jh_tableView.mj_footer = JhRefreshFooter(refreshingTarget: self, refreshingAction: #selector(JhFooterRefresh))
            } else {
                JhLog(" 父类 - 不开启头部尾部刷新");
            }
        }
    }
    
    //*****************是否开启头部刷新和脚部刷新 子类可在ViewDidLoad方法设置开启与否 默认都不开启******************************//
    
    // MARK: - TableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 第一次进来或者每次reloadData否会调一次该方法，在此控制footer是否隐藏
        if (Jh_isOpenHeaderAndFooterRefresh == true) {
            Jh_tableView.mj_footer?.isHidden = dataArr.count == 0 ? true : false
        }
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath)
        JhCustumCellBlock?(indexPath,cell)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    // MARK: - 设置cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        JhCellHeightBlock?(indexPath,cellHeight)
        return cellHeight
    }
    
    // MARK: - 选中某行的点击操作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // 取消选中
        
        JhClickCustumCellBlock?(indexPath)
    }
    
    // MARK: - ***** 头部刷新and尾部刷新
    @objc func JhHeaderRefresh() {
        JhLog(" 父类 - JhHeaderRefresh ")
    }
    
    @objc func JhFooterRefresh() {
        JhLog(" 父类 - JhFooterRefresh ")
    }
    
    lazy var Jh_tableView: JhBaseTableView = {
        let tableView = JhBaseTableView(frame: .zero)
        tableView.frame = kTableViewFrame
        //        tableView.separatorStyle = .none // 不显示分割线
        //        tableView.showsVerticalScrollIndicator = false
        //        tableView.scrollEnabled = false // 设置tableview 不能滚动
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = BaseBgWhiteColor
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private lazy var dataArr: Array<Any> = {
        var tempArr = Array<Any>()
        return tempArr
    }()
    
    private var cellHeight: CGFloat = 44.0
    
}