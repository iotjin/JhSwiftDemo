//
//  DemoCustomTableVC1.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/4.
//

import UIKit
import SwiftyJSON

class DemoCustomTableVC1: JhBaseViewController, UITableViewDelegate, UITableViewDataSource {
    let CellID = "CellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    func configTableView() {
        self.Jh_navTitle = "XibTableView - SwiftyJSON"
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
        // -------------------- SwiftyJSON --------------------
        let dict = JSON(dataArr)[indexPath.row]
        JhLog("dict : \(dict)")
        JhLog("text : \(dict["text"])")
        cell.titleLabel.text = String(describing:dict["text"])
        cell.leftImgView.image = UIImage(named: String(describing:dict["img"]))
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
        
        let data = JSON(dataArr)[indexPath.row]
        JhLog("选中cell : \(data)")
        
        JhProgressHUD.showText(String(describing:data["text"]))
    }
    
    lazy var dataArr: NSMutableArray = {
        var tempArr = NSMutableArray()
        for i in 0 ..< 50 {
            let text = "测试数据-\(i)"
            var dict = NSMutableDictionary()
            dict["text"] = text
            dict["img"] = "swift"
            tempArr.add(dict)
        }
        dataArr = tempArr
        return dataArr
    }()
    
    lazy var mTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.frame = kTableViewFrame
        //        tableView.separatorStyle = .none //不显示分割线
        //        tableView.showsVerticalScrollIndicator = false;
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = BaseBgColor
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "DemoCustomTableViewCell", bundle: nil), forCellReuseIdentifier: CellID)
        return tableView
    }()
    
}
