//
//  UIView+JhExtension.h
//  JhSwiftDemo
//
//  Created by Jh on 15/9/23.
//  Copyright (c) 2015年 Jh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JhExtension)

//@property (nonatomic, assign) CGFloat Jh_x;
//@property (nonatomic, assign) CGFloat Jh_y;
//@property (nonatomic, assign) CGFloat Jh_width;
//@property (nonatomic, assign) CGFloat Jh_height;
//@property (nonatomic, assign) CGFloat Jh_centerX;
//@property (nonatomic, assign) CGFloat Jh_centerY;
//@property (nonatomic, assign) CGSize  Jh_size;
//@property (nonatomic, assign) CGPoint Jh_origin;
//
//@property (nonatomic, assign) CGFloat Jh_left;
//@property (nonatomic, assign) CGFloat Jh_top;
//@property (nonatomic, assign) CGFloat Jh_right;
//@property (nonatomic, assign) CGFloat Jh_bottom;

+ (instancetype)Jh_viewFromXib;

- (BOOL)Jh_intersectWithView:(UIView *)view;

/// 获取当前View所在的viewcontroler
- (UIViewController *)Jh_getCurrentViewController;

/// 添加子View（array：添加子的ViewArray）
- (void)Jh_addSubViewsWithArray:(NSArray *)array;

/// 移除所有 subviews
- (void)Jh_removeAllSubviews;

/// 找到指定类名的subView
- (UIView *)Jh_findSubViewWithClass:(Class)clazz;

/// 找到指定类名的所有subView
- (NSArray *)Jh_findAllSubViewsWithClass:(Class)clazz;

/// 找到指定类名的superView对象
- (UIView *)Jh_findSuperViewWithClass:(Class)clazz;

/// 找到view上的第一响应者
- (UIView *)Jh_findFirstResponder;

/// 给UIView添加点击事件
- (void)Jh_addTarget:(id)target
              action:(SEL)action;



@end

NS_ASSUME_NONNULL_END
