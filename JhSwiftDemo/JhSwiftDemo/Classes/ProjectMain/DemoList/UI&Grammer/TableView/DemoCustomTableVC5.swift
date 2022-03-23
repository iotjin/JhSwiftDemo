//
//  DemoCustomTableVC5.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/4.
//

import UIKit
import SwiftyJSON

class DemoCustomTableVC5: JhCustumCellTableViewController {
    
    private lazy var dataArr: Array<DemoCustomModel2> = {
        var tempArr = Array<DemoCustomModel2>()
        return tempArr
    }()
    private var page:Int = 0
    private var isLoadAll:Bool = false //已经加载全部数据
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    func configTableView() {
        Jh_navTitle = "二次封装请求 + MJExtension"
        
        Jh_cellName = "DemoCustomTableViewCell2"
        
        // 高度设置
        //        Jh_cellHeight = 50
        JhCellHeightBlock = { [weak self] (indexPath,cellHeight) ->() in
            let data = self!.Jh_modelArr[indexPath.row] as! DemoCustomModel2
            self?.Jh_cellHeight = data.cellHeight
        }
        
        JhCustumCellBlock = { [weak self] (indexPath,custumCell) ->() in
            let cell:DemoCustomTableViewCell2 = custumCell as! DemoCustomTableViewCell2
            cell.configCellData(self!.dataArr[indexPath.row])
        }
        
        JhClickCustumCellBlock = { [weak self] (indexPath) ->() in
            JhLog("选中section:\(indexPath.section) ")
            JhLog("选中row:\(indexPath.row) ")
            
            let data = self!.dataArr[indexPath.row]
            JhLog("选中Text : \(data.name2)")
            JhLog("选中ID : \(data.id)")
            
            JhProgressHUD.showText(data.name2)
        }
        
    }
    
    override func JhHeaderRefresh() {
        JhLog(" 子类 - JhHeaderRefresh ")
        requestData()
    }
    
    override func JhFooterRefresh() {
        JhLog(" 子类 - JhFooterRefresh ")
        requestData(true)
    }
    
    func requestData(_ isLoadMore:Bool = false) {
        if (isLoadMore) {
            page = page + 1
        } else {
            page = 0;
        }
        JhLog("page : \(page)")

        Jh_Request_ListCell(API.getPageList(page),isLoadMore) { [weak self] json in
            let data = String(describing: json) != "" ? json : []
            let tempArr = DemoCustomModel2.mj_objectArray(withKeyValuesArray: data)as! Array<DemoCustomModel2>
            if (isLoadMore) {
                self?.dataArr += tempArr
            } else {
                self?.dataArr = tempArr
            }
            self?.Jh_modelArr = self!.dataArr
            self?.isLoadAll = tempArr.count < 15 ? true : false
            self?.Jh_tableView.reloadData()
        } failure: { code, msg in
            self.page = self.page - 1
            self.page = self.page < 0 ? 0 : self.page
        }
        
    }
    
}
