//
//  AppDelegate.m
//  App_A
//
//  Created by 王雪剑 on 17/7/26.
//  Copyright © 2017年 zkml－wxj. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor clearColor];
    [_window makeKeyAndVisible];
    
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
    _window.rootViewController=nav;
    return YES;
}

//3.在应用App-A中通过AppDelegate监听跳转，进行判断，执行不同页面的跳转
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    // 1.获取导航栏控制器
    UINavigationController *rootNav = (UINavigationController *)self.window.rootViewController;
    // 2.获得主控制器
    ViewController *mainVc = [rootNav.childViewControllers firstObject];
    
  
    
    // 3.每次跳转前必须是在跟控制器(细节)
    [rootNav popToRootViewControllerAnimated:NO];
    
    // 4.根据字符串关键字来跳转到不同页面
    if ([url.absoluteString containsString:@"Page1"]) { // 跳转到应用App-B的Page1页面
        FirstViewController *vc = [[FirstViewController alloc]init];
        vc.urlString = url.absoluteString;// 保存完整的App-B的URL给主控制器
        [mainVc.navigationController pushViewController:vc animated:YES];
        
    } else if ([url.absoluteString containsString:@"Page2"]) { // 跳转到应用App-B的Page2页面
        SecondViewController *vc = [[SecondViewController alloc]init];
        vc.urlString = url.absoluteString;// 保存完整的App-B的URL给主控制器
        [mainVc.navigationController pushViewController:vc animated:YES];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
