//
//  DemoCustomTableVC4.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/4.
//

import UIKit
import SwiftyJSON

class DemoCustomTableVC4: JhCustumCellTableViewController {
    
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
        Jh_navTitle = "分页请求 + MJExtension"
        
//      //如果不一进入页面立即刷新，使用以下两行
//      Jh_isStartRefresh = false // 是否立即刷新,默认为true,
//      Jh_isOpenHeaderAndFooterRefresh = true // 为true时，进入页面自动请求一次，默认为true
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
        
        // Alamofire + Moya + SwiftyJSON
        JhHttpTool.request(API.getPageList(page)) {[weak self] json in
            let res = JSON(json)
            JhAllLog(res)
            let code = res["code"]
            if (code == 200) {
                let data = res["data"].rawValue
                //                JhLog("data : \(data)")
                let data2 = String(describing: data) != "" ? data : []
                
                let tempArr = DemoCustomModel2.mj_objectArray(withKeyValuesArray: data2)as! Array<DemoCustomModel2>
                if (isLoadMore) {
                    self?.Jh_tableView.mj_footer?.endRefreshing()
                    self?.dataArr += tempArr
                } else {
                    self?.Jh_tableView.mj_header?.endRefreshing()
                    self?.dataArr = tempArr
                }
                self?.Jh_modelArr = self!.dataArr
                self?.isLoadAll = tempArr.count < 15 ? true : false
                self?.Jh_tableView.reloadData()
            } else {
                JhLog("请求出错 : \(res["msg"])")
                self!.page = self!.page - 1
                self!.page = self!.page < 0 ? 0 : self!.page
            }
        } failure: {code, msg in
            JhLog("code : \(code!)")
            JhLog("message : \(msg)")
            self.page = self.page - 1
            self.page = self.page < 0 ? 0 : self.page
            if (isLoadMore) {
                self.Jh_tableView.mj_footer?.endRefreshing()
            } else {
                self.Jh_tableView.mj_header?.endRefreshing()
                // 显示网络超时占位图 和 点击事件(重新请求)
                self.JhShowNetWorkErrorWithReloadBlock {
                    self.requestData()
                }
            }
        }
    }
    
}
