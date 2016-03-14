//
//  AppDelegate.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/9.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "AppDelegate.h"
#import "MSAnimationViewController.h"
#import "MSSlideTabBarViewController.h"
#import "MSNavigationTransitionVC.h"
#import "MSPushVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    
    // TabBarVC
//    [self initTabBarVCDemo];

    //NaviVC
    [self initNaviVCDemo];
    
    return YES;
}

- (void)initTabBarVCDemo {
    MSAnimationViewController *vc1 = [[MSAnimationViewController alloc]init];
    vc1.view.backgroundColor = [UIColor redColor];
    vc1.title = @"vc1";
    
    MSAnimationViewController *vc2 = [[MSAnimationViewController alloc]init];
    vc2.view.backgroundColor = [UIColor greenColor];
    vc2.title = @"vc2";
    
    
    MSSlideTabBarViewController *tabVC = [[MSSlideTabBarViewController alloc]init];
    [tabVC setViewControllers:@[vc1,vc2]];
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor clearColor];
    _window.rootViewController = tabVC;
    [_window makeKeyAndVisible];
}

- (void)initNaviVCDemo {
    
    MSPushVC *vc = [[MSPushVC alloc]init];
    MSNavigationTransitionVC *navi = [[MSNavigationTransitionVC alloc]initWithRootViewController:vc];
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor clearColor];
    _window.rootViewController = navi;
    [_window makeKeyAndVisible];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
