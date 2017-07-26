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
    
    [self createUI];
}

//如果是iOS9之后的模拟器或是真机，那么则需要再在应用程序App-A中将App-B的URL Schemes添加到白名单中，原因和做法如下。
//iOS9引入了白名单的概念。
//在iOS9中，如果使用 canOpenURL:方法，该方法所涉及到的 URL Schemes 必须在"Info.plist"中将它们列为白名单，否则不能使用。key叫做LSApplicationQueriesSchemes ，键值内容是对应应用程序的URL Schemes。
//链接地址:http://www.cocoachina.com/ios/20161026/17855.html

-(void)createUI{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    label.text = @"这是AppB";
    [self.view addSubview:label];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnClick:(UIButton *)sender{
    NSURL *appUrl = [NSURL URLWithString:@"AppA://"];
    if ([[UIApplication sharedApplication] canOpenURL:appUrl]) {
        [[UIApplication sharedApplication] openURL:appUrl];
    }else{
        NSLog(@"没有安装App_A");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
