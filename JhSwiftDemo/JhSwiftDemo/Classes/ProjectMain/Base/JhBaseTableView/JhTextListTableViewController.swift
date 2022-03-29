//
//  JhTextListTableViewController.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/5.
//

import UIKit
import Foundation

class JhTextListTableViewController: JhBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    private func configTableView() {
        self.view.addSubview(self.Jh_tableView)
    }
    
    // typealias ClickCellBlock = (_ indexPath : IndexPath, _ text : String ) ->()
    // var JhClickCellBlock: ClickCellBlock!
    
    /// 点击Cell Block
    var JhClickCellBlock: ((_ indexPath : IndexPath, _ text : String ) ->())?
    
    /// 数据源
    var Jh_modelArr: NSMutableArray {
        get {
            return dataArr
        }
        set(newValue) {
            dataArr = newValue
        }
    }
    
    // MARK: - TableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 定义一个cell的标识
        let cellID = "CellID"
        // 从缓存池中取出cell
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        // 如果缓存池中没有cell, 判断为空进行初始化  --（当拉动页面显示超过主页面内容的时候就会重用之前的cell，而不会再次初始化）
        if cell == nil {
            cell = JhBaseTableViewCell(style: .value1, reuseIdentifier: cellID)
        }
        //        cell?.selectionStyle = .none //不显示选中颜色
        cell?.accessoryType = .disclosureIndicator //显示最右边的箭头
        cell?.textLabel?.text = dataArr[indexPath.row] as? String
        cell?.textLabel?.font = JhFont(17)
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    
    // MARK: - 设置cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // MARK: - 选中某行的点击操作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // 取消选中
        
        let cell = tableView.cellForRow(at: indexPath)
        let text = cell?.textLabel?.text ?? ""
        JhLog(" 父类 - 选中cell : \(text)")
        
        //        if (JhClickCellBlock != nil) {
        //            JhClickCellBlock(indexPath as NSIndexPath, text)
        //        }
        JhClickCellBlock?(indexPath, text)
    }
    
    lazy var Jh_tableView: JhBaseTableView = {
        let tableView = JhBaseTableView(frame: .zero)
        tableView.frame = kTableViewFrame
        //        tableView.separatorStyle = .none //不显示分割线
        //        tableView.showsVerticalScrollIndicator = false;
        //        tableView.scrollEnabled = false // 设置tableview 不能滚动
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = BaseBgColor
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private lazy var dataArr: NSMutableArray = {
        let tempArr = NSMutableArray()
        return tempArr
    }()
}

