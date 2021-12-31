//
//  UIColor+JhExtension.h
//  JhSwiftDemo
//
//  Created by Jh on 2019/4/24.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JhExtension)


/// color：支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor*)Jh_hexColor:(NSString*)hex alpha:(CGFloat)alpha;

/** 判断颜色是否相同 */
- (BOOL)Jh_isEqualColor:(UIColor *)color;


@end
