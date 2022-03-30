//
//  JhNavigationView.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/29.
//

import Foundation

class JhNavigationView: UIView {
    
    // code
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    // xib
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI()
    }
    
    // xib加载完毕调用
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    private func initUI() {
        
    }
    
}
