//
//  JhRefreshHeader.m
//
//  Created by Jh on 2018/3/15.
//  Copyright © 2018年 Jh. All rights reserved.
//

#import "JhRefreshHeader.h"

@interface JhRefreshHeader()
///** logo */
//@property (nonatomic, weak) UIImageView *logo;
@end


@implementation JhRefreshHeader

/**
 *  初始化
 */
- (void)prepare {
    [super prepare];
    
    //self.automaticallyChangeAlpha = YES;
    
    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"释放更新" forState:MJRefreshStatePulling];
    [self setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    
    // 隐藏时间
    self.lastUpdatedTimeLabel.hidden = YES;
    //    // 设置字体
    //    header.stateLabel.font = [UIFont systemFontOfSize:15];
    //    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    //    // 设置颜色
    //    header.stateLabel.textColor = [UIColor redColor];
    //    header.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
    // 隐藏状态
    //  self.stateLabel.hidden = YES;
    
    //    UIImageView *logo = [[UIImageView alloc] init];
    //    logo.image = [UIImage imageNamed:@"bd_logo1"];
    //    [self addSubview:logo];
    //    self.logo = logo;
    
}

///**
// *  带图片的摆放子控件
// */
//- (void)placeSubviews {
//    [super placeSubviews];
//
//    self.logo.xmg_width = self.xmg_width;
//    self.logo.xmg_height = 50;
//    self.logo.xmg_x = 0;
//    self.logo.xmg_y = - 50;
//}


@end
