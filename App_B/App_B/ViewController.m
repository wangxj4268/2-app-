//
//  ViewController.m
//  App_B
//
//  Created by 王雪剑 on 17/7/26.
//  Copyright © 2017年 zkml－wxj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"AppB";
    [self createUI];
}

//如果是iOS9之后的模拟器或是真机，那么则需要再在应用程序App-A中将App-B的URL Schemes添加到白名单中，原因和做法如下。
//iOS9引入了白名单的概念。
//在iOS9中，如果使用 canOpenURL:方法，该方法所涉及到的 URL Schemes 必须在"Info.plist"中将它们列为白名单，否则不能使用。key叫做LSApplicationQueriesSchemes ，键值内容是对应应用程序的URL Schemes。
//链接地址:http://www.cocoachina.com/ios/20161026/17855.html

-(void)createUI{
    
    
    //直接跳转到AppA软件中
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"跳转到AppA" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //跳转到AppA软件中的第一个界面
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, 250, 100, 100);
    btn2.backgroundColor = [UIColor redColor];
    [btn2 setTitle:@"跳转到AppA——界面1" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnClick2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    //跳转到AppA软件中的第二个界面
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(100, 400, 100, 100);
    btn3.backgroundColor = [UIColor redColor];
    [btn3 setTitle:@"跳转到AppA——界面2" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btnClick3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
}

-(void)btnClick:(UIButton *)sender{
    NSURL *appUrl = [NSURL URLWithString:@"AppA://"];
    if ([[UIApplication sharedApplication] canOpenURL:appUrl]) {
        [[UIApplication sharedApplication] openURL:appUrl];
    }else{
        NSLog(@"没有安装App_A");
    }
}

-(void)btnClick2:(UIButton *)sender{
    // 1.获取应用程序AppA的Page1页面的URL
    NSURL *appBUrl = [NSURL URLWithString:@"AppA://Page1?AppB"];
    
    // 2.判断手机中是否安装了对应程序
    if ([[UIApplication sharedApplication] canOpenURL:appBUrl]) {
        // 3. 打开应用程序App-A的Page1页面
        [[UIApplication sharedApplication] openURL:appBUrl];
    } else {
        NSLog(@"没有安装");
    }
}

-(void)btnClick3:(UIButton *)sender{
    // 1.获取应用程序AppA的Page2页面的URL
    NSURL *appBUrl = [NSURL URLWithString:@"AppA://Page2?AppB"];
    
    // 2.判断手机中是否安装了对应程序
    if ([[UIApplication sharedApplication] canOpenURL:appBUrl]) {
        // 3. 打开应用程序App-A的Page2页面
        [[UIApplication sharedApplication] openURL:appBUrl];
    } else {
        NSLog(@"没有安装");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
