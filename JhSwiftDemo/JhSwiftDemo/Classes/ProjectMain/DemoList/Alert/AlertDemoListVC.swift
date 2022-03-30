//
//  AlertDemoListVC.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/3/22.
//

import UIKit

class AlertDemoListVC: JhTextListTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    private lazy var modelArr: NSMutableArray = {
        var dataArr = NSMutableArray()
        dataArr = ["系统弹框","JhActionSheet(微信样式)"]
        return dataArr
    }()
    
    private lazy var classArr: NSMutableArray = {
        var dataArr = NSMutableArray()
        dataArr = ["DemoAlertVC1","DemoAlertVC2"]
        return dataArr
    }()
    
    private func configTableView() {
        self.Jh_navTitle = "弹框加载框选择器";
        Jh_modelArr = modelArr
        
        JhClickCellBlock = { [weak self] (indexPath,text) ->() in
            let className = self?.classArr.object(at: indexPath.row) as! String
            let jumpVC = NSString.Jh_classFromString(className)
            jumpVC?.title = self?.modelArr.object(at: indexPath.row) as? String
            self?.navigationController?.pushViewController(jumpVC!, animated: true)
        }
    }
    
}
