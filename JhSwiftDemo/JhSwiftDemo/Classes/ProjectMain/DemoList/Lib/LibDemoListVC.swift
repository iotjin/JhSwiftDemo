//
//  LibDemoListVC.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/5.
//

import UIKit

class LibDemoListVC: JhTextListTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    private lazy var modelArr: NSMutableArray = {
        var dataArr = NSMutableArray()
        dataArr = ["SnapKit"]
        return dataArr
    }()
    
    private lazy var classArr: NSMutableArray = {
        var dataArr = NSMutableArray()
        dataArr = ["SnapKitDemoListVC"]
        return dataArr
    }()
    
    private func configTableView() {
        self.Jh_navTitle = "三方库使用";
        Jh_modelArr = modelArr
        
        JhClickCellBlock = { [weak self] (indexPath,text) ->() in
            let className = self?.classArr.object(at: indexPath.row) as! String
            let jumpVC = NSString.Jh_classFromString(className)
            jumpVC?.title = self?.modelArr.object(at: indexPath.row) as? String
            self?.navigationController?.pushViewController(jumpVC!, animated: true)
        }
    }
    
}
