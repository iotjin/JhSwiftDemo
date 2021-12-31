//
//  NSString+JhExtension.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/29.
//

import Foundation


extension NSString {
    
    /// 判空
    public var Jh_isBlank: Bool {
        let trimmedStr = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedStr.isEmpty
    }
}
