//
//  JhProgressHUD.m
//  JhiOSBase
//
//  Created by Jh on 2018/3/28.
//  Copyright © 2018年 Jh. All rights reserved.
//

#import "JhProgressHUD.h"

//默认黑色背景
#define kBgStyle SVProgressHUDStyleDark
//边角
#define kCornerRadius 2.0
//消失时间
#define kTime 1.0
#define kFont [UIFont systemFontOfSize: 15.0]
#define kSize CGSizeMake(153, 115)
//#define kToastBgColor [UIColor colorWithWhite:0.f alpha:0.8]
#define kToastTitleColor [UIColor whiteColor]

//#if __IPHONE_13_0
#define kToastDynamicBgColor UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? [UIColor colorWithRed:47/255.0 green:47/255.0 blue:47/255.0 alpha:1.0] :[UIColor colorWithWhite:0.f alpha:0.8]
//#else
//#define kToastBgColor [UIColor colorWithWhite:0.f alpha:0.8]
//#endif

#define kToastBgColor [UIColor colorWithWhite:0.f alpha:0.8]


@implementation JhProgressHUD

/**
 *  设置HUD背景图层的样式
 *
 *  SVProgressHUDMaskTypeNone：默认图层样式，当HUD显示的时候，允许用户交互。
 *
 *  SVProgressHUDMaskTypeClear：当HUD显示的时候，不允许用户交互。
 *
 *  SVProgressHUDMaskTypeBlack：当HUD显示的时候，不允许用户交互，且显示黑色背景图层。
 *
 *  SVProgressHUDMaskTypeGradient：当HUD显示的时候，不允许用户交互，且显示渐变的背景图层。
 *
 *  SVProgressHUDMaskTypeCustom：当HUD显示的时候，不允许用户交互，且显示背景图层自定义的颜色。
 */


// 根据 提示文字字数，判断 HUD 显示时间
- (NSTimeInterval)displayDurationForString:(NSString*)string {
    return MIN((float)string.length*0.06 + 0.5, 1.0);
}

//    [SVProgressHUD setRingThickness:10];// 转圈的宽度


+ (void)showText:(NSString *)text {
    // [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, 100)];// 位置 偏移
    [SVProgressHUD setMinimumDismissTimeInterval:kTime];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setInfoImage:[UIImage imageNamed:@"null"]];
    [SVProgressHUD setDefaultStyle:kBgStyle];
    [SVProgressHUD showInfoWithStatus:text];
    [SVProgressHUD setCornerRadius:4.0];
    /********************************* 设置透明度 ********************************/
    if (@available(iOS 13.0, *)) {
        [SVProgressHUD setBackgroundColor:kToastDynamicBgColor];
    } else {
        [SVProgressHUD setBackgroundColor:kToastBgColor];
    }
    [SVProgressHUD setForegroundColor:kToastTitleColor];
    /********************************* 设置透明度 ********************************/
    [SVProgressHUD setMinimumSize:CGSizeZero];
    [SVProgressHUD setFont: kFont];
}
+ (void)showSuccessText:(NSString *)successText {
    [SVProgressHUD setMinimumDismissTimeInterval:kTime];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setSuccessImage:[UIImage imageNamed:[NSString stringWithFormat:@"JhProgressHUD.bundle/HUD_success"]]];
    [SVProgressHUD setDefaultStyle:kBgStyle];
    [SVProgressHUD showSuccessWithStatus:successText];
    [SVProgressHUD setCornerRadius:kCornerRadius];
    /********************************* 设置透明度 ********************************/
    if (@available(iOS 13.0, *)) {
        [SVProgressHUD setBackgroundColor:kToastDynamicBgColor];
    } else {
        [SVProgressHUD setBackgroundColor:kToastBgColor];
    }
    [SVProgressHUD setForegroundColor:kToastTitleColor];
    /********************************* 设置透明度 ********************************/
    [SVProgressHUD setMinimumSize:kSize];
    [SVProgressHUD setFont: kFont];
}

+ (void)showErrorText:(NSString *)errorText {
    [SVProgressHUD setMinimumDismissTimeInterval:kTime];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    //  [SVProgressHUD setErrorImage:[UIImage imageNamed:@"HUD_error"]];
    [SVProgressHUD setErrorImage:[UIImage imageNamed:[NSString stringWithFormat:@"JhProgressHUD.bundle/HUD_error"]]];
    [SVProgressHUD setDefaultStyle:kBgStyle];
    [SVProgressHUD showErrorWithStatus:errorText];
    [SVProgressHUD setCornerRadius:kCornerRadius];
    /********************************* 设置透明度 ********************************/
    if (@available(iOS 13.0, *)) {
        [SVProgressHUD setBackgroundColor:kToastDynamicBgColor];
    } else {
        [SVProgressHUD setBackgroundColor:kToastBgColor];
    }
    [SVProgressHUD setForegroundColor:kToastTitleColor];
    /********************************* 设置透明度 ********************************/
    [SVProgressHUD setMinimumSize:kSize];
    [SVProgressHUD setFont: kFont];
}

/**
 菊花加文字(不可交互)
 */
+ (void)showMessageText:(NSString *)MessageText {
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultStyle:kBgStyle];
    [SVProgressHUD showWithStatus:MessageText];
    [SVProgressHUD setCornerRadius:kCornerRadius];
    /********************************* 设置透明度 ********************************/
    if (@available(iOS 13.0, *)) {
        [SVProgressHUD setBackgroundColor:kToastDynamicBgColor];
    } else {
        [SVProgressHUD setBackgroundColor:kToastBgColor];
    }
    [SVProgressHUD setForegroundColor:kToastTitleColor];
    /********************************* 设置透明度 ********************************/
    [SVProgressHUD setMinimumSize:kSize];
    [SVProgressHUD setFont: kFont];
}

/**
 菊花加文字(可交互)
 
 */
+ (void)showMessageText_NoMask:(NSString *)MessageText {
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setDefaultStyle:kBgStyle];
    [SVProgressHUD showWithStatus:MessageText];
    [SVProgressHUD setCornerRadius:kCornerRadius];
    /********************************* 设置透明度 ********************************/
    if (@available(iOS 13.0, *)) {
        [SVProgressHUD setBackgroundColor:kToastDynamicBgColor];
    } else {
        [SVProgressHUD setBackgroundColor:kToastBgColor];
    }
    [SVProgressHUD setForegroundColor:kToastTitleColor];
    /********************************* 设置透明度 ********************************/
    [SVProgressHUD setMinimumSize:kSize];
    [SVProgressHUD setFont: kFont];
}

/**
 *    只显示菊花
 */
+ (void)showStatus {
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setDefaultStyle:kBgStyle];
    [SVProgressHUD showWithStatus:nil];
    [SVProgressHUD setCornerRadius:kCornerRadius];
    /********************************* 设置透明度 ********************************/
    if (@available(iOS 13.0, *)) {
        [SVProgressHUD setBackgroundColor:kToastDynamicBgColor];
    } else {
        [SVProgressHUD setBackgroundColor:kToastBgColor];
    }
    [SVProgressHUD setForegroundColor:kToastTitleColor];
    /********************************* 设置透明度 ********************************/
    [SVProgressHUD setMinimumSize:kSize];
    [SVProgressHUD setFont: kFont];
}

+ (void)showRoundProgress:(NSInteger)progress {
    /********************************* 设置透明度 ********************************/
    if (@available(iOS 13.0, *)) {
        [SVProgressHUD setBackgroundColor:kToastDynamicBgColor];
    } else {
        [SVProgressHUD setBackgroundColor:kToastBgColor];
    }
    [SVProgressHUD setForegroundColor:kToastTitleColor];
    /********************************* 设置透明度 ********************************/
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultStyle:kBgStyle];
    [SVProgressHUD setCornerRadius:kCornerRadius];
    [SVProgressHUD showProgress:progress/100.0 status:[NSString stringWithFormat:@"%li%%",(long)progress]];
    [SVProgressHUD setMinimumSize:kSize];
    [SVProgressHUD setFont: kFont];
}

+ (void)showImage:(UIImage*)image text:(NSString*)text {
    [SVProgressHUD setMinimumDismissTimeInterval:kTime];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone]; //可交互
    [SVProgressHUD setDefaultStyle:kBgStyle];
    [SVProgressHUD setCornerRadius:kCornerRadius];
    /********************************* 设置透明度 ********************************/
    if (@available(iOS 13.0, *)) {
        [SVProgressHUD setBackgroundColor:kToastDynamicBgColor];
    } else {
        [SVProgressHUD setBackgroundColor:kToastBgColor];
    }
    [SVProgressHUD setForegroundColor:kToastTitleColor];
    /********************************* 设置透明度 ********************************/
    [SVProgressHUD setMinimumSize:kSize];
    [SVProgressHUD setFont: kFont];
    //    [SVProgressHUD setImageViewSize:CGSizeMake(120, 120)];
    //    [SVProgressHUD showWithStatus:text];
    [SVProgressHUD showImage:image status:text];
}

+ (void)hideHUD {
    [SVProgressHUD dismiss];
    //    [SVProgressHUD dismissWithDelay:1.0];
    
    //    // 延迟执行：
    //    double delayInSeconds = 3.0;
    //    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    //    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    //    });
}



@end
