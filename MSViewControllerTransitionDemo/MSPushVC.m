
//
//  MSPushVC.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/14.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "MSPushVC.h"
#import "MSAnimationViewController.h"

@implementation MSPushVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    btn.frame = CGRectMake(20, 80, 140, 20);
    [self.view addSubview:btn];
    [btn setTitle:@"push" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(clicked) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)clicked{
    
    MSAnimationViewController *nextVC = [[MSAnimationViewController alloc]init];
    nextVC.view.backgroundColor = [UIColor greenColor];
    if (self.navigationController) {
        [self.navigationController pushViewController:nextVC animated:YES];
    }
    
}
@end
