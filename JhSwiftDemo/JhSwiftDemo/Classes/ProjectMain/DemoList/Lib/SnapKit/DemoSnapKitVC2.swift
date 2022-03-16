//
//  DemoSnapKitVC2.swift
//  JhSwiftDemo
//
//  Created by Jh on 2022/1/5.
//

import UIKit
import SnapKit

class DemoSnapKitVC2: JhBaseViewController {
    
    lazy var topView1 = UIView()
    lazy var topView2 = UIView()
    lazy var topView3 = UIView()
    
    lazy var centerView1 = UIView()
    lazy var centerView2 = UIView()
    lazy var centerView3 = UIView()
    
    lazy var bottomView1 = UIView()
    lazy var bottomView2 = UIView()
    lazy var bottomView3 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    private func configUI() {
        configSnapKit1()
        configSnapKit2()
        configSnapKit3()
    }
    
    // 水平多个等分
    // 顶部三个视图，距离屏幕左右间距都是0，视图间距也是0，顶部距离导航条15，高度50
    private func configSnapKit1() {
        self.view.addSubview(topView1)
        self.view.addSubview(topView2)
        self.view.addSubview(topView3)
        topView1.backgroundColor = JhRandomColor()
        topView2.backgroundColor = JhRandomColor()
        topView3.backgroundColor = JhRandomColor()
        
        topView1.snp.makeConstraints { (make) in
            make.top.equalTo(15+kNavHeight)
            make.left.equalTo(0)
            make.right.equalTo(topView2.snp.left).offset(0)
            make.height.equalTo(50)
            make.width.equalToSuperview().dividedBy(3)//宽是父控件宽度的1/3
        }
        topView2.snp.makeConstraints { (make) in
            make.top.equalTo(15+kNavHeight)
            make.left.equalTo(topView1.snp.right).offset(0)
            make.right.equalTo(topView3.snp.left).offset(0)
            make.height.equalTo(50)
            make.width.equalToSuperview().dividedBy(3)//宽是父控件宽度的1/3
        }
        topView3.snp.makeConstraints { (make) in
            make.top.equalTo(15+kNavHeight)
            make.left.equalTo(topView2.snp.right).offset(0)
            make.right.equalTo(0)
            make.height.equalTo(50)
            make.width.equalToSuperview().dividedBy(3)//宽是父控件宽度的1/3
        }
    }
    
    // 分类实现，水平等分，固定间隔
    // 底部三个视图，距离屏幕左右间距都是10，视图间距也是10，底部距离屏幕底部15，高度50
    private func configSnapKit2() {
        self.view.addSubview(bottomView1)
        self.view.addSubview(bottomView2)
        self.view.addSubview(bottomView3)
        bottomView1.backgroundColor = JhRandomColor()
        bottomView2.backgroundColor = JhRandomColor()
        bottomView3.backgroundColor = JhRandomColor()
        
        let padding = 10.0
        let views = [bottomView1, bottomView2, bottomView3]
        views.snp.distributeViewsAlong(axis: .horizontal, fixedSpacing: padding, leadSpacing: padding, tailSpacing: padding)
        views.snp.makeConstraints { (make, element) in
            make.bottom.equalToSuperview().offset(-kBottomSafeHeight)
            make.height.equalTo(50)
        }
    }
    
    // 分类实现，垂直等分，固定间隔
    // 中间三个视图，水平居中，视图垂直间距10，顶部距离顶部视图10，底部距离底部视图10
    private func configSnapKit3() {
        self.view.addSubview(centerView1)
        self.view.addSubview(centerView2)
        self.view.addSubview(centerView3)
        centerView1.backgroundColor = JhRandomColor()
        centerView2.backgroundColor = JhRandomColor()
        centerView3.backgroundColor = JhRandomColor()
        
        let padding = 10.0
        let topSpacing = kNavHeight+15+50+10
        let bottomSpacing = kBottomSafeHeight+50+10
        let views = [centerView1, centerView2, centerView3]
        views.snp.distributeViewsAlong(axis: .vertical, fixedSpacing: padding, leadSpacing: topSpacing, tailSpacing: bottomSpacing)
        views.snp.makeConstraints { (make, element) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)//宽是父控件宽度的1/2
        }
    }
 
}
