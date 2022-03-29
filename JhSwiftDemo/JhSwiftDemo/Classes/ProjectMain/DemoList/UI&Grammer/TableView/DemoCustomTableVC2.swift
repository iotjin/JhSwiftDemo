//
//  DemoCustomTableVC2.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/4.
//

import UIKit

class DemoCustomTableVC2: JhBaseViewController, UITableViewDelegate, UITableViewDataSource {
    let CellID = "CellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    func configTableView() {
        self.Jh_navTitle = "XibTableView - MJExtension"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID) as! DemoCustomTableViewCell
        // -------------------- MJExtension --------------------
        cell.configCellData(dataArr[indexPath.row])
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    // MARK: - 设置cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // MARK: - 选中某行的点击操作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // 取消选中
        
        JhLog("选中section:\(indexPath.section) ")
        JhLog("选中row:\(indexPath.row) ")
        
        let data = dataArr[indexPath.row]
        JhLog("选中Text : \(data.text)")
        JhLog("选中Img : \(data.img)")
        JhLog("选中ID : \(data.ID)")
        
        JhProgressHUD.showText(data.text)
    }
    
    lazy var dataArr: Array<DemoCustomModel> = {
        var tempArr = NSMutableArray()
        for i in 0 ..< 50 {
            let id = i
            let text = "测试数据-\(i)"
            var dict = NSMutableDictionary()
            dict["ID"] = id
            dict["text"] = text
            dict["img"] = "swift"
            tempArr.add(dict)
        }
        
        dataArr = DemoCustomModel.mj_objectArray(withKeyValuesArray: tempArr) as! Array<DemoCustomModel>
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
        tableView.register(UINib(nibName: "DemoCustomTableViewCell", bundle: nil), forCellReuseIdentifier: CellID)
        return tableView
    }()
    
}
