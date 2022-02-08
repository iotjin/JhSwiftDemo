//
//  UIColor+JhExtension.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/28.
//

import UIKit


extension UIColor {

    /// color：支持“#123456”
    class func Jh_hexColor(_ hexStr: String) -> UIColor {
        return UIColor.Jh_hexColorA(hexStr, 1.0)
    }
    
    /// color：支持“#123456”
    class func Jh_hexColorA(_ hexStr: String, _ alpha: CGFloat) -> UIColor {
        let hexString = hexStr.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
