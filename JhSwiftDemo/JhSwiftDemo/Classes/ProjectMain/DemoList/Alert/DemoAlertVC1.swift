//
//  DemoAlertVC1.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/3/22.
//

import UIKit


class DemoAlertVC1: JhTextListTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    private lazy var modelArr: NSMutableArray = {
        var dataArr = NSMutableArray()
        dataArr = ["系统Alert","系统Alert-修改按钮文字","系统Alert-带标题","系统Alert-带内容","系统Alert-只有确认","系统Alert-3个按钮","系统Alert-红色按钮",
                   "系统Sheet","系统Sheet-带标题","系统Sheet-带内容","系统Sheet-没有取消","系统Sheet-红色按钮"]
        return dataArr
    }()
    
    private func configTableView() {
        self.Jh_navTitle = "系统弹框";
        Jh_modelArr = modelArr
        
        JhClickCellBlock = { [weak self] (indexPath,text) ->() in
            self?.showAlert(text)
        }
    }
    
    private func showAlert(_ text:String) {
        if (text == "系统Alert" ) {
            JhAlertTool.systemAlert(title: "标题", message: "这是内容") { index in
                JhLog(index)
            }
        }
        if (text == "系统Alert-修改按钮文字" ) {
            JhAlertTool.systemAlert(title: "标题", message: "这是内容", cancelTitle: "取消#", confirmTitle: "确认*") { index in
                JhLog(index)
            }
        }
        if (text == "系统Alert-带标题" ) {
            JhAlertTool.systemAlert(title: "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题") { index in
                JhLog(index)
            }
        }
        if (text == "系统Alert-带内容" ) {
            JhAlertTool.systemAlert(message: "这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容") { index in
                JhLog(index)
            }
        }
        if (text == "系统Alert-只有确认" ) {
            JhAlertTool.systemAlert(title: "标题", message: "这是内容这是内容这是内容这是内容这是内容", cancelTitle: "", confirmTitle: "好的") { index in
                JhLog(index)
            }
        }
        
        
        if (text == "系统Alert-3个按钮" ) {
            let tempArr = ["action1","action2","action3"]
            JhAlertTool.Jh_showSystemAlert(title: "提示", message: "这是内容", actionTitles: tempArr, cancelTitle: "取消", style: .alert) { index in
                JhLog(index)
            }
        }
        
        if (text == "系统Alert-红色按钮" ) {
            let tempArr = ["action1","action2","action3"]
            let actionStyles = [UIAlertAction.Style.default, UIAlertAction.Style.default, UIAlertAction.Style.destructive]
            JhAlertTool.Jh_showSystemAlert(title: "提示", message: "这是内容", actionTitles: tempArr, cancelTitle: "取消", style: .alert, actionStyles: actionStyles) { index in
                JhLog(index)
            }
        }
        
        if (text == "系统Sheet" ) {
            let tempArr = ["action1","action2","action3"]
            JhAlertTool.systemActionSheet(title: "标题", message: "这是内容", actionTitles: tempArr) { index in
                JhLog(index)
            }
        }
        if (text == "系统Sheet-带标题" ) {
            let tempArr = ["action1","action2","action3"]
            JhAlertTool.systemActionSheet(title: "标题", actionTitles: tempArr) { index in
                JhLog(index)
            }
        }
        if (text == "系统Sheet-带内容" ) {
            let tempArr = ["action1","action2","action3"]
            JhAlertTool.systemActionSheet(message: "这是内容", actionTitles: tempArr) { index in
                JhLog(index)
            }
        }
        if (text == "系统Sheet-没有取消" ) {
            let tempArr = ["action1","action2","action3"]
            JhAlertTool.systemActionSheet(title: "提示", message: "这是内容", actionTitles: tempArr, cancelTitle: "") { index in
                JhLog(index)
            }
        }
        if (text == "系统Sheet-红色按钮" ) {
            let tempArr = ["action1","action2","action3"]
            let actionStyles = [UIAlertAction.Style.default, UIAlertAction.Style.default, UIAlertAction.Style.destructive]
            JhAlertTool.Jh_showSystemAlert(title: "提示", message: "这是内容", actionTitles: tempArr, cancelTitle: "取消", style: .actionSheet, actionStyles: actionStyles) { index in
                JhLog(index)
            }
        }
    }
    
}
