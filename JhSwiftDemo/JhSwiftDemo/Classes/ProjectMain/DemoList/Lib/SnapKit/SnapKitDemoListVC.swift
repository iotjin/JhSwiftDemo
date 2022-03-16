//
//  SnapKitDemoListVC.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/5.
//

import UIKit

class SnapKitDemoListVC: JhTextListTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    private lazy var modelArr: NSMutableArray = {
        var dataArr = NSMutableArray()
        dataArr = ["SnapKit1 - 基础用法","SnapKit2 - 多控件等分"]
        return dataArr
    }()
    
    private lazy var classArr: NSMutableArray = {
        var dataArr = NSMutableArray()
        dataArr = ["DemoSnapKitVC1","DemoSnapKitVC2"]
        return dataArr
    }()
    
    private func configTableView() {
        self.Jh_navTitle = "SnapKit";
        Jh_modelArr = modelArr
        
        JhClickCellBlock = { [weak self] (indexPath,text) ->() in
            let className = self?.classArr.object(at: indexPath.row) as! String
            let jumpVC = NSString.Jh_classFromString(className)
            jumpVC?.title = self?.modelArr.object(at: indexPath.row) as? String
            self?.navigationController?.pushViewController(jumpVC!, animated: true)
        }
    }
    
    
}
