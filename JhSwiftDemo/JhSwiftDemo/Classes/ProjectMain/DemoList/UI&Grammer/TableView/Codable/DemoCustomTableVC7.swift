//
//  DemoCustomTableVC7.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/4.
//

import UIKit
import SwiftyJSON

class DemoCustomTableVC7: JhCustumCellTableViewController {
    
    //    private lazy var dataArr: Array<DemoCustomModel7> = {
    //        //        var tempArr = Array<DemoCustomModel7>()
    //        var tempArr:[DemoCustomModel7] = []
    //        return tempArr
    //    }()
    private lazy var dataArr:[DemoCustomModel7] = {
        var tempArr:[DemoCustomModel7] = []
        return tempArr
    }()
    private var page:Int = 0
    private var isLoadAll:Bool = false //已经加载全部数据
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDict()
        configTableView()
    }
    
    func configTableView() {
        Jh_navTitle = "二次封装请求 + Codable"
        
        Jh_cellName = "DemoCustomTableViewCell7"
        
        // 高度设置
        //        Jh_cellHeight = 50
        JhCellHeightBlock = { [weak self] (indexPath,cellHeight) ->() in
            let data = self!.Jh_modelArr[indexPath.row] as! DemoCustomModel7
            self?.Jh_cellHeight = data.cellHeight
        }
        
        JhCustumCellBlock = { [weak self] (indexPath,custumCell) ->() in
            let cell:DemoCustomTableViewCell7 = custumCell as! DemoCustomTableViewCell7
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
    
    
}


extension DemoCustomTableVC7 {
    
    func requestData(_ isLoadMore:Bool = false) {
        if (isLoadMore) {
            page = page + 1
        } else {
            page = 0;
        }
        JhLog("page : \(page)")
        
        Jh_Request_ListCell(API.getPageList(page),isLoadMore) { [weak self] json in
            
            //            let jsonStr = JSON(json).rawString()
            //            let jsonStr = JSON(json).arrayObject
            let jsonStr = json as? Array<Any>
            
            let result =  JhJsonTool.jsonToModel(jsonStr, Array<DemoCustomModel7>.self)
            
            let tempArr = result!
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
    
    // 字典类型数据转模型
    func getDict() {
        JhHttpTool.request(API.getSimpleDict) { [] json in
            let res = JSON(json)
            JhAllLog(res)
            let code = res["code"]
            if (code == 200) {
                //                let data = res["data"].rawValue
                //                let jsonStr = data as? Dictionary<String,Any>
                
                let jsonStr = res["data"].dictionaryObject
                let dict = JhJsonTool.jsonToModel(jsonStr, DemoCustomModel7.self)
                JhLog("dict= : \(String(describing: dict))")
                JhLog("name= : \(String(describing: dict?.name))")
            } else {
                JhLog("请求出错 : \(res["msg"])")
            }
        } failure: {code, msg in
            JhLog("code : \(code!)")
            JhLog("message : \(msg)")
        }
    }
    
}
