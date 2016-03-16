//
//  MSModalViewController.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/15.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "MSModalViewController.h"
#import "MSModalVCTransitionDelegate.h"
#import "MSModalPresentedVC.h"

@interface MSModalViewController ()

@end

@implementation MSModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn setTitle:@"present" forState:(UIControlStateNormal)];
    btn.frame = CGRectMake(60, 100, 60, 40);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];

}

- (void)btnClick {
    MSModalPresentedVC *modal = [[MSModalPresentedVC alloc]init];
    modal.view.backgroundColor = [UIColor orangeColor];
    
    [modal setModalTransitionStyle:(UIModalTransitionStyleFlipHorizontal)];
    // 当设为 UIModalPresentationCustom 后，fromView并未从视图结构中移除
//    [modal setModalPresentationStyle:(UIModalPresentationCustom)];
    
    // 设为其他转场类型后，fromView 从视图结构中移除;
//    [modal setModalPresentationStyle:(UIModalPresentationFullScreen)];
    [modal setModalPresentationStyle:(UIModalPresentationFormSheet)];
    
    [self presentViewController:modal animated:YES completion:^{
        
    }];
        
}

@end
