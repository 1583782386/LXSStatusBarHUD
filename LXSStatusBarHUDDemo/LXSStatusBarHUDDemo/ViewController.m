//
//  ViewController.m
//  LXSStatusBarHUDDemo
//
//  Created by delegate on 2017/7/6.
//  Copyright © 2017年 松. All rights reserved.
//

#import "ViewController.h"
#import "LXSStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 * 显示成功信息
 */
- (IBAction)success
{
    [LXSStatusBarHUD showSuccess:@"加载成功 ！"];
}
/**
 * 显示失败信息
 */
- (IBAction)error
{
    [LXSStatusBarHUD showError:@"加载失败 ！"];
}
/**
 * 显示正在处理信息
 */
- (IBAction)loading
{
    [LXSStatusBarHUD showLoading:@"加载中。。。"];
}
/**
 * 隐藏
 */
- (IBAction)hiden
{
    [LXSStatusBarHUD hide];
}
/**
 * 显示基本普通信息
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //可以自定义图片
    [LXSStatusBarHUD showMessage:@"我就是我" image:[UIImage imageNamed:@"error"]];
    //    [LXSStatusBarHUD showMessage:@"我要加载"];
    //    [LXSStatusBarHUD showSuccess:@"加载成功！"];
    //    [LXSStatusBarHUD showError:@"加载失败！"];
    //    [LXSStatusBarHUD showloading:@"正在加载中..."];
    
}


- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}

@end
