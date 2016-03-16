//
//  MSModalPresentedVC.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/15.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "MSModalPresentedVC.h"

@interface MSModalPresentedVC ()

@property (nonatomic, strong)UIButton* btn;

@end

@implementation MSModalPresentedVC

- (instancetype)init {
    if (self = [super init]) {
        self.modalDelegate = [[MSModalVCTransitionDelegate alloc]init];
        self.transitioningDelegate = self.modalDelegate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn setTitle:@"dismiss" forState:(UIControlStateNormal)];
    btn.frame = CGRectMake(60, 100, 60, 40);
    self.btn.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
    self.btn = btn;
}

- (void)btnClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
