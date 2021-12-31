//
//  UIView+Extension.m
//  JhSwiftDemo
//
//  Created by Jh on 15/9/23.
//  Copyright (c) 2015年 Jh. All rights reserved.
//

#import "UIView+JhExtension.h"

@implementation UIView (JhExtension)

//- (void)setJh_x:(CGFloat)Jh_x {
//    CGRect frame = self.frame;
//    frame.origin.x = Jh_x;
//    self.frame = frame;
//}
//
//- (CGFloat)Jh_x {
//    return self.frame.origin.x;
//}
//
//- (void)setJh_y:(CGFloat)Jh_y {
//    CGRect frame = self.frame;
//    frame.origin.y = Jh_y;
//    self.frame = frame;
//}
//
//- (CGFloat)Jh_y {
//    return self.frame.origin.y;
//}
//
//- (void)setJh_width:(CGFloat)Jh_width {
//    CGRect frame = self.frame;
//    frame.size.width = Jh_width;
//    self.frame = frame;
//}
//
//- (CGFloat)Jh_width {
//    return self.frame.size.width;
//}
//
//- (void)setJh_height:(CGFloat)Jh_height {
//    CGRect frame = self.frame;
//    frame.size.height = Jh_height;
//    self.frame = frame;
//}
//
//- (CGFloat)Jh_height {
//    return self.frame.size.height;
//}
//
//- (CGFloat)Jh_centerX {
//    return self.center.x;
//}
//
//- (void)setJh_centerX:(CGFloat)Jh_centerX {
//    CGPoint center = self.center;
//    center.x = Jh_centerX;
//    self.center = center;
//}
//
//- (CGFloat)Jh_centerY {
//    return self.center.y;
//}
//
//- (void)setJh_centerY:(CGFloat)Jh_centerY {
//    CGPoint center = self.center;
//    center.y = Jh_centerY;
//    self.center = center;
//}
//
//- (void)setJh_size:(CGSize)Jh_size {
//    CGRect frame = self.frame;
//    frame.size = Jh_size;
//    self.frame = frame;
//}
//
//- (CGSize)Jh_size {
//    return self.frame.size;
//}
//
//- (void)setJh_origin:(CGPoint)Jh_origin {
//    CGRect frame = self.frame;
//    frame.origin = Jh_origin;
//    self.frame = frame;
//}
//
//- (CGPoint)Jh_origin {
//    return self.frame.origin;
//}
//
//- (CGFloat)Jh_left {
//    return self.frame.origin.x;
//}
//
//-(void)setJh_left:(CGFloat)Jh_left {
//    CGRect frame = self.frame;
//    frame.origin.x = Jh_left;
//    self.frame = frame;
//}
//
//- (CGFloat)Jh_top {
//    return self.frame.origin.y;
//}
//
//-(void)setJh_top:(CGFloat)Jh_top {
//    CGRect frame = self.frame;
//    frame.origin.y = Jh_top;
//    self.frame = frame;
//}
//
//- (CGFloat)Jh_right {
//    return self.frame.origin.x + self.frame.size.width;
//}
//
//-(void)setJh_right:(CGFloat)Jh_right {
//    CGRect frame = self.frame;
//    frame.origin.x = Jh_right - frame.size.width;
//    self.frame = frame;
//}
//
//- (CGFloat)Jh_bottom {
//    return self.frame.origin.y + self.frame.size.height;
//}
//
//-(void)setJh_bottom:(CGFloat)Jh_bottom {
//    CGRect frame = self.frame;
//    frame.origin.y = Jh_bottom - frame.size.height;
//    self.frame = frame;
//}

+ (instancetype)Jh_viewFromXib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}


- (BOOL)Jh_intersectWithView:(UIView *)view {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect selfRect = [self convertRect:self.bounds toView:window];
    CGRect viewRect = [view convertRect:view.bounds toView:window];
    return CGRectIntersectsRect(selfRect, viewRect);
}


/**
 *  获取当前View所在的viewcontroler
 *
 *  @return 获取当前View的VC
 */
- (UIViewController *)Jh_getCurrentViewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


/**
 *  添加子 View
 *
 *  @param array 添加子的ViewArray
 */
- (void)Jh_addSubViewsWithArray:(NSArray *)array {
    if (array) {
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self addSubview:obj];
        }];
    } else {
        NSLog(@"数组 %@ 为空！", array);
    }
}

/// 移除所有 subviews
- (void)Jh_removeAllSubviews {
    //    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
    
}

/// 找到指定类名的subView
- (UIView *)Jh_findSubViewWithClass:(Class)clazz {
    for (UIView * subView in self.subviews) {
        if ([subView isKindOfClass:clazz]) {
            return subView;
        }
    }
    return nil;
}

/// 找到指定类名的所有subView
- (NSArray *)Jh_findAllSubViewsWithClass:(Class)clazz {
    NSMutableArray *array = [NSMutableArray array];
    for (UIView * subView in self.subviews) {
        if ([subView isKindOfClass:clazz]) {
            [array addObject:subView];
        }
    }
    return array;
}

/// 找到指定类名的superView对象
- (UIView *)Jh_findSuperViewWithClass:(Class)clazz {
    if (self == nil) {
        return nil;
    } else if (self.superview == nil) {
        return nil;
    } else if ([self.superview isKindOfClass:clazz]) {
        return self.superview;
    } else {
        return [self.superview Jh_findSuperViewWithClass:clazz];
    }
}

/// 找到view上的第一响应者
- (UIView *)Jh_findFirstResponder {
    if (([self isKindOfClass:[UITextField class]] || [self isKindOfClass:[UITextView class]])
        && (self.isFirstResponder)) {
        return self;
    }
    for (UIView *v in self.subviews) {
        UIView *fv = [v Jh_findFirstResponder];
        if (fv) {
            return fv;
        }
    }
    return nil;
}

/// 给UIView添加点击事件
- (void)Jh_addTarget:(id)target
              action:(SEL)action {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target
                                                                         action:action];
    //    tap.numberOfTapsRequired = 1; //点击次数（默认1）
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}


@end
