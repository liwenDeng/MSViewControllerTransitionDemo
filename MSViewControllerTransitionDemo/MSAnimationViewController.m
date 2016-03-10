//
//  MSAnimationViewController.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/10.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "MSAnimationViewController.h"

@interface MSAnimationViewController ()

@end

@implementation MSAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    btn.frame = CGRectMake(20, 80, 140, 20);
    [self.view addSubview:btn];
    [btn setTitle:@"present" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(clicked) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    btn1.frame = CGRectMake(20, 160, 140, 20);
    [self.view addSubview:btn1];
    [btn1 setTitle:@"dismiss" forState:(UIControlStateNormal)];
    [btn1 addTarget:self action:@selector(dismiss) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)clicked{
    MSAnimationViewController *nextVC = [[MSAnimationViewController alloc]init];
    [self setModalPresentationStyle:(UIModalPresentationFullScreen)];
    [nextVC setModalPresentationStyle:(UIModalPresentationCustom)];
    nextVC.view.backgroundColor = [UIColor whiteColor];
    [self presentViewController:nextVC animated:YES completion:nil];

}

- (void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
