//
//  UIImage+JhExtension.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/28.
//

import UIKit


extension UIImage {
        
    /// 纯色图颜色重绘（更改图片颜色）
    /// - Parameter color: 目标颜色
    /// - Returns: 重绘颜色后的Image
    public func Jh_imageWithTintColor(_ tintColor : UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        tintColor.setFill()
        let bounds = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height)
        UIRectFill(bounds)
        self.draw(in: bounds, blendMode: CGBlendMode.destinationIn, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
    
}
