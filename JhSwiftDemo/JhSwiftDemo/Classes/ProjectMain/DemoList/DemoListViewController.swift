//
//  DemoListViewController.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/5.
//

import UIKit

class DemoListViewController: JhTextListTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    private lazy var modelArr: NSMutableArray = {
        var dataArr = NSMutableArray()
        dataArr = ["UI&语法","UITableView","UICollcetionView","网络请求","弹框加载框选择器","三方库使用"]
        return dataArr
    }()
    
    private lazy var classArr: NSMutableArray = {
        var dataArr = NSMutableArray()
        dataArr = ["UIAndGrammerDemoListVC","TableViewDemoListVC","CollectionViewDemoListVC","NetworkDemoListVC","AlertDemoListVC","LibDemoListVC"]
        return dataArr
    }()
    
    private func configTableView() {
        self.Jh_navTitle = "DemoList";
        Jh_modelArr = modelArr
        
        JhClickCellBlock = { [weak self] (indexPath,text) ->() in
            JhLog(" -------------------- 子类 -------------------- ");
            JhLog("section : \(indexPath.section)")
            JhLog("row : \(indexPath.row)")
            JhLog("text : \(text)")
            // 两种跳转方式
            if text == "UI&语法" {
                self?.navigationController?.pushViewController(UIAndGrammerDemoListVC(), animated: true)
            } else {
                let className = self?.classArr.object(at: indexPath.row) as! String
                let jumpVC = NSString.Jh_classFromString(className)
                jumpVC?.title = self?.modelArr.object(at: indexPath.row) as? String
                self?.navigationController?.pushViewController(jumpVC!, animated: true)
            }
        }
        
        Jh_navRightTitle = "文字"
        JhClickNavRightItemBlock = {
            JhLog("点击导航条右侧item")
        }
    }
    
}
