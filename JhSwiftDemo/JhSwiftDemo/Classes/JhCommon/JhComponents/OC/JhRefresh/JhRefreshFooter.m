//
//  JhRefreshFooter.m
//
//  Created by Jh on 2018/3/15.
//  Copyright © 2018年 Jh. All rights reserved.
//

#import "JhRefreshFooter.h"

@implementation JhRefreshFooter

- (void)prepare {
    [super prepare];
    
    // self.stateLabel.textColor = [UIColor redColor];
    [self setTitle:@"" forState:MJRefreshStateIdle];
    [self setTitle:@"加载中" forState:MJRefreshStateRefreshing];
    [self setTitle:@"没有更多" forState:MJRefreshStateNoMoreData];
    // 刷新控件出现一半就会进入刷新状态
    self.triggerAutomaticallyRefreshPercent = 0.5;
    // 不要自动刷新
    //    self.automaticallyRefresh = NO;
}

@end
