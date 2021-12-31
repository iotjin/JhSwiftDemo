//
//  UIImage+JhExtension.h
//  JhSwiftDemo
//
//  Created by Jh on 2019/4/26.
//  Copyright © 2019 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JhExtension)


/**
 *  纯色图重绘颜色
 *
 *  @param tintColor 目标颜色
 *  @return 重绘颜色后的Image
 */
- (UIImage *)Jh_imageWithTintColor:(UIColor *)tintColor;


@end

NS_ASSUME_NONNULL_END
