//
//  JhProgressHUD.h
//  JhiOSBase
//
//  Created by Jh on 2018/3/28.
//  Copyright © 2018年 Jh. All rights reserved.
//

#import "SVProgressHUD.h"

// [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, 400)];// 位置 偏移

@interface JhProgressHUD : SVProgressHUD

/**
 *  显示纯文字
 */
+ (void)showText:(NSString *)text;

/**
 *  显示成功文字加图片
 */
+ (void)showSuccessText:(NSString *)successText;

/**
 *  显示失败文字加图片
 */
+ (void)showErrorText:(NSString *)errorText;

/**
 *    菊花加文字
 */
+ (void)showMessageText:(NSString *)MessageText;

/**
 菊花加文字(可交互)
 
 */
+ (void)showMessageText_NoMask:(NSString *)MessageText;

/**
 *    只显示菊花
 */
+ (void)showStatus;

/**
 *  显示百分比
 *
 *  @param progress 百分比（整型 100 = 100%）
 */
+ (void)showRoundProgress:(NSInteger)progress;

/**
 *  显示图文提示
 *
 *  @param image 自定义的图片
 *  @param text 要显示的文本
 */
+ (void)showImage:(UIImage*)image text:(NSString*)text;

/**
 *  隐藏
 */
+ (void)hideHUD;


@end
