//
//  LXSStatusBarHUD.m
//  状态栏指示器
//
//  Created by delegate on 2017/7/5.
//  Copyright © 2017年 松. All rights reserved.
//


#import "LXSStatusBarHUD.h"

#define LXSMessageFont [UIFont systemFontOfSize:14]

//常量:消息的停留时间
static CGFloat const LXSMessageDuration = 2.0;

//消息显示 / 消息隐藏的动画时间
static CGFloat const LXSAnimationDuration = 0.25;

@implementation LXSStatusBarHUD

/*全局窗口:保证window不被杀死*/
static UIWindow *window_;

/*定时器*/
static NSTimer *timer_;

/**
 *初始化窗口
 */
+ (void)showWindow
{
    //frame数据
    CGFloat windowH = 20;
    
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    //显示window
    window_.hidden = YES;
    
    window_ = [[UIWindow alloc]init];
    
    window_.backgroundColor = [UIColor blackColor];
    
    window_.frame = frame;
    
    window_.windowLevel = UIWindowLevelAlert;
    
    window_.hidden = NO;
    
    //动画
    frame.origin.y = 0;
    [UIView animateWithDuration:LXSAnimationDuration animations:^{
        window_.frame = frame;
    }];
    
}

/**
 *信息
 *param   msg       :    文字
 *param   image     :    图片
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image
{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    //显示窗口
    [self showWindow];
    
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = window_.bounds;
    
    [button setTitle:msg forState:UIControlStateNormal];
    
    button.titleLabel.font = LXSMessageFont;
    
    if (image)
    {
        [button setImage:image forState:UIControlStateNormal];
        
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
    }
    
    [window_ addSubview:button];
    
    
    //定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:LXSMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}

/**
 *显示普通信息
 */
+(void)showMessage:(NSString *)msg 
{
    [self showMessage:msg image:nil];
}

/**
 *显示成功信息
 */
+(void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"LXSStatusBarHUD.bundle/check"]];
}

/**
 *显示失败信息
 */
+(void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"LXSStatusBarHUD.bundle/error"]];
}

/**
 *显示正在处理的信息
 */
+(void)showLoading:(NSString *)msg
{
    //停止定时器
    [timer_ invalidate];
    //销毁定时器
    timer_ = nil;
    
    //显示窗口
    [self showWindow];
    
    //添加文字
    UILabel *label = [[UILabel alloc]init];
    
    label.frame = window_.bounds;
    
    label.text = msg;
    
    label.textColor = [UIColor whiteColor];
    
    label.font = LXSMessageFont;
    
    label.textAlignment = NSTextAlignmentCenter;
    
    [window_ addSubview:label];
    
    //添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    //文字的宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName:LXSMessageFont}].width;
    
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    
    CGFloat centerY = window_.frame.size.height * 0.5;
    
    loadingView.center = CGPointMake(centerX, centerY);
    
    [loadingView startAnimating];
    
    [window_ addSubview:loadingView];
    
}

/**
 *隐藏信息
 */
+(void)hide
{
    [UIView animateWithDuration:LXSAnimationDuration animations:^{
        
        CGRect frame = window_.frame;
        
        frame.origin.y = - frame.size.height;
        
        window_.frame = frame;
        
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

@end
