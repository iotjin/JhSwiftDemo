//
//  DemoCustomTableVC3.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/4.
//

import UIKit
import SwiftyJSON

class DemoCustomTableVC3: JhCustumCellTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        requestData()
    }
    
    func configTableView() {
        Jh_navTitle = "TableView封装 - MJExtension"

        Jh_cellName = "DemoCustomTableViewCell"
        
        // 高度设置
//        Jh_cellHeight = 50
        JhCellHeightBlock = { [weak self] (indexPath,cellHeight) ->() in
            let data = self!.Jh_modelArr[indexPath.row] as! DemoCustomModel
            self?.Jh_cellHeight = data.cellHeight
        }
                
        JhCustumCellBlock = { [weak self] (indexPath,custumCell) ->() in
            let cell:DemoCustomTableViewCell = custumCell as! DemoCustomTableViewCell
            cell.configCellData(self!.dataArr[indexPath.row])
        }
        
        JhClickCustumCellBlock = { [weak self] (indexPath) ->() in
            JhLog("选中section:\(indexPath.section) ")
            JhLog("选中row:\(indexPath.row) ")
            
            let data = self!.dataArr[indexPath.row]
            JhLog("选中Text : \(data.text)")
            JhLog("选中Img : \(data.img)")
            JhLog("选中ID : \(data.ID)")
            
            JhProgressHUD.showText(data.text)
        }
        
    }
        
    override func JhHeaderRefresh() {
        JhLog(" 子类 - JhHeaderRefresh ")
        // 在主线程延迟执行
        self.Jh_tableView.mj_header?.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            // 延时的代码
            self.Jh_tableView.mj_header?.endRefreshing()
        })
    }
    
    override func JhFooterRefresh() {
        JhLog(" 子类 - JhFooterRefresh ")
        self.Jh_tableView.mj_footer?.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            // 延时的代码
            self.Jh_tableView.mj_footer?.endRefreshing()
        })
    }
    
    func requestData() {
        let tempArr = NSMutableArray()
        for i in 0 ..< 50 {
            let id = i
            let text = "测试数据-\(i)"
            let dict = NSMutableDictionary()
            dict["ID"] = id
            dict["text"] = text
            dict["img"] = "swift"
            tempArr.add(dict)
        }
        
        dataArr = DemoCustomModel.mj_objectArray(withKeyValuesArray: tempArr) as! Array<DemoCustomModel>
        Jh_modelArr = dataArr
    }

    private lazy var dataArr: Array<DemoCustomModel> = {
        var tempArr = Array<DemoCustomModel>()
        return tempArr
    }()
    
}
