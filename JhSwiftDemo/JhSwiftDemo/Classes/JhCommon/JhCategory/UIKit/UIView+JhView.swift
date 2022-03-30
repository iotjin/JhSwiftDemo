//
//  UIView+JhView.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/31.
//

import UIKit


extension UIView {
    
    /// 视图添加圆角（可添加部分圆角）
    public func Jh_addCorner(conrners: UIRectCorner , radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: conrners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
}
