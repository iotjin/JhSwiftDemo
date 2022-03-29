//
//  UIImage+JhDarkImage.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/28.
//

import UIKit
import SwiftUI


extension UIImage {
    
    static func dynamicImage(_ lightImage: UIImage, _ darkImage: UIImage) -> UIImage {
        if #available(iOS 13.0, *) {
            let scaleTrait = UITraitCollection.current
            let darkUnscaledTrait = UITraitCollection.init(userInterfaceStyle: .dark)
            let darkScaledTrait = UITraitCollection(traitsFrom: [scaleTrait, darkUnscaledTrait])
            let img = lightImage.withConfiguration((lightImage.configuration?.withTraitCollection(UITraitCollection.init(userInterfaceStyle: .light)))!)
            let darkImg = darkImage.withConfiguration((darkImage.configuration?.withTraitCollection(UITraitCollection.init(userInterfaceStyle: .dark)))!)
            img.imageAsset?.register(darkImg, with: darkScaledTrait)
            return img
        } else {
            return lightImage
        }
    }
    
    /// 设置动态图片
    static func Jh_dynamicImage(_ lightImage: String, _ darkImage: String) -> UIImage {
        if #available(iOS 13.0, *) {
            return UIImage.dynamicImage(UIImage(named: lightImage)!, UIImage(named: darkImage)!)
        }
        return UIImage(named: lightImage)!
    } 
    
}
