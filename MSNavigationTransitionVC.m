//
//  MSNavigationTransitionVC.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/14.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "MSNavigationTransitionVC.h"

@interface MSNavigationTransitionVC ()

@end

@implementation MSNavigationTransitionVC

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        _naviDelegate = [[MSNavigationTransitionVCDelegate alloc]init];
        self.delegate = _naviDelegate;
    }
    return self;
}

@end
