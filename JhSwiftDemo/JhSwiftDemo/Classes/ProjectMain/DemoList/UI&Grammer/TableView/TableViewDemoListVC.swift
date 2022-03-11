//
//  TableViewDemoListVC.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/5.
//

import UIKit

class TableViewDemoListVC: JhTextListTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    private lazy var modelArr: NSMutableArray = {
        var dataArr = NSMutableArray()
        dataArr = ["SystemTableView","XibTableView - SwiftyJSON",
                   "XibTableView - MJExtension","TableView封装 - MJExtension",
                   "分页请求 + MJExtension","二次封装请求 + MJExtension",
                   "二次封装请求 + HandyJSON","二次封装请求 + Codable"
        
        ]
        return dataArr
    }()
    
    private lazy var classArr: NSMutableArray = {
        var dataArr = NSMutableArray()
        dataArr = ["SystemTableViewController","DemoCustomTableVC1",
                   "DemoCustomTableVC2","DemoCustomTableVC3",
                   "DemoCustomTableVC4","DemoCustomTableVC5",
                   "DemoCustomTableVC6","DemoCustomTableVC7",
        ]
        return dataArr
    }()
    
    private func configTableView() {
        self.Jh_navTitle = "UITableView";
        Jh_modelArr = modelArr
        
        JhClickCellBlock = { [weak self] (indexPath,text) ->() in
            let className = self?.classArr.object(at: indexPath.row) as! String
            let jumpVC = NSString.Jh_classFromString(className)
            jumpVC?.title = self?.modelArr.object(at: indexPath.row) as? String
            self?.navigationController?.pushViewController(jumpVC!, animated: true)
        }
    }
    
}
