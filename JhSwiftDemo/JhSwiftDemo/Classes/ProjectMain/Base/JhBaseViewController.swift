//
//  JhBaseViewController.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/28.
//

import UIKit
import Foundation

class JhBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = BaseBgWhiteColor
    }
    
    /// 标题
    var Jh_navTitle :String? {
        didSet {
            self.navigationItem.title = Jh_navTitle
        }
    }
}
