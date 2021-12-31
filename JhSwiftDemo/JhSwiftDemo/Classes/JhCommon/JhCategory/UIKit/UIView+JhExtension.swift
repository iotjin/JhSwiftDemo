//
//  UIView+JhExtension.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/31.
//

import UIKit


extension UIView {
    
    public var Jh_x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newValue) {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var Jh_y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newValue) {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var Jh_width: CGFloat {
        get {
            return self.frame.size.width
        }
        set(newValue) {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    public var Jh_height: CGFloat {
        get {
            return self.frame.size.height
        }
        set(newValue) {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    public var Jh_centerX: CGFloat {
        get {
            return self.center.x
        }
        set(newValue) {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    
    public var Jh_centerY: CGFloat {
        get {
            return self.center.y
        }
        set(newValue) {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    public var Jh_maxX: CGFloat {
        get {
            return self.frame.maxX
        }
    }
    
    public var Jh_maxY: CGFloat {
        get {
            return self.frame.maxY
        }
    }
    
    public var Jh_midX: CGFloat {
        get {
            return self.frame.midX
        }
    }
    
    public var Jh_midY: CGFloat {
        get {
            return self.frame.midY
        }
    }
    
    public var Jh_size: CGSize {
        get {
            return self.frame.size
        }
        set(newValue) {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    public var Jh_origin: CGPoint {
        get {
            return self.frame.origin
        }
        set(newValue) {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    public var Jh_left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newValue) {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var Jh_top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newValue) {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var Jh_right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set(newValue) {
            var frame = self.frame
            frame.origin.x = newValue - frame.size.width;
            self.frame = frame
        }
    }
    
    public var Jh_bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set(newValue) {
            var frame = self.frame
            frame.origin.y = newValue - frame.size.height
            self.frame = frame
        }
    }
    
    /// 渐变色
    public func Jh_gradientColor(_ startColor: UIColor,_ endColor: UIColor,_ startPoint: CGPoint,_ endPoint: CGPoint) -> Void {
        let gradientLayer = CAGradientLayer.init()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        self.layer.addSublayer(gradientLayer)
    }
    
    /// 删除所有的子视图
    public func Jh_removeAllSubviews() -> Void {
        for view : UIView in self.subviews {
            view.removeFromSuperview()
        }
    }
    
}
