//
//  SystemTableViewController.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/4.
//

import UIKit

class SystemTableViewController: JhBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    func configTableView() {
        self.Jh_navTitle = "SystemTableView"
        self.view.addSubview(self.mTableView)
    }
    
    // MARK: - TableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 定义一个cell的标识
        let cellID = "CellID"
        // 从缓存池中取出cell
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        // 如果缓存池中没有cell, 判断为空进行初始化  --（当拉动页面显示超过主页面内容的时候就会重用之前的cell，而不会再次初始化）
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: cellID)
        }
        cell?.selectionStyle = .none //不显示选中颜色
        cell?.accessoryType = .disclosureIndicator //显示最右边的箭头
        cell?.textLabel?.text = self.dataArr[indexPath.row] as? String
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
        JhLog("选中section:\(indexPath.section) ")
        JhLog("选中row:\(indexPath.row) ")
        
        let cell = tableView.cellForRow(at: indexPath)
        let text = cell?.textLabel?.text ?? ""
        JhLog(" 选中cell : \(text)")
        
        JhProgressHUD.showText(text)
    }
    
    lazy var dataArr: NSMutableArray = {
        let dataArr = NSMutableArray()
        for i in 0 ..< 50 {
            let text = "测试数据-\(i)"
            dataArr.add(text)
        }
        return dataArr
    }()
    
    lazy var mTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.frame = kTableViewFrame
        //        tableView.separatorStyle = .none //不显示分割线
        //        tableView.showsVerticalScrollIndicator = false;
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = BaseBgColor
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
}
