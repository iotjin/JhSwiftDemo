//
//  DemoAlertVC2.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/3/22.
//

import UIKit


class DemoAlertVC2: JhTextListTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    private lazy var modelArr: NSMutableArray = {
        var dataArr = NSMutableArray()
        dataArr = ["JhActionSheet","JhActionSheet-没有标题","JhActionSheet-没有取消","JhActionSheet-红色按钮"]
        return dataArr
    }()
    
    private func configTableView() {
        self.Jh_navTitle = "JhActionSheet(微信样式)";
        Jh_modelArr = modelArr
        
        JhClickCellBlock = { [weak self] (indexPath,text) ->() in
            self?.showAlert(text)
        }
    }
    
    private func showAlert(_ text:String) {
        if (text == "JhActionSheet" ) {
            let tempArr = ["action1","action2","action3"]
            JhActionSheet.show(title:"标题", largeTitle:"大标题", actionTitles:tempArr, destructive:"action4", cancelTitle:"取消") { index in
                JhLog(index)
            }
        }
        if (text == "JhActionSheet-没有标题" ) {
            let tempArr = ["action1","action2","action3"]
            JhActionSheet.show(actionTitles: tempArr) { index in
                JhLog(index)
            }
        }
        if (text == "JhActionSheet-没有取消" ) {
            let tempArr = ["action1","action2","action3"]
            JhActionSheet.show(title:"请选择请选择请选择请选择请选择请选择请选择请选择请选择请选择", actionTitles:tempArr, destructive:"action4", cancelTitle:"") { index in
                JhLog(index)
            }
        }
        if (text == "JhActionSheet-红色按钮" ) {
            JhActionSheet.show(title:"请选择操作",destructive:"退出登录") { index in
                JhLog(index)
            }
        }
    }
    
}
