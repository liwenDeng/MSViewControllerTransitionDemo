//
//  MSSlideTabBarViewController.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/10.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "MSSlideTabBarViewController.h"
#import "MSTabBarVCDelegate.h"

@interface MSSlideTabBarViewController ()

@property (nonatomic, strong)MSTabBarVCDelegate *tabBarVCDelegate;
@property (nonatomic, strong)UIPanGestureRecognizer *pan;

@property (nonatomic) CGFloat originX;
@property (nonatomic) CGFloat finalX;

@end

@implementation MSSlideTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabBarVCDelegate = [[MSTabBarVCDelegate alloc]init];
    self.tabBarVCDelegate.interactive = NO;
    self.delegate = self.tabBarVCDelegate;
    
    //添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    _pan = pan;
    [self.view addGestureRecognizer:pan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)panAction:(UIPanGestureRecognizer*)sender {
    CGFloat direction = [sender velocityInView:self.view].x;
    CGFloat translationX = [sender translationInView:self.view].x;
    CGFloat translationAbs = translationX > 0 ? translationX : -translationX;
    CGFloat progress = translationAbs / self.view.frame.size.width;
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.tabBarVCDelegate.interactive = YES;//启用手势交互
            if (direction < 0) {
                //左滑 向右翻页
                if (self.selectedIndex < self.viewControllers.count - 1) {
                    self.selectedIndex += 1;
                }
            }else {
                //右滑 向左翻页
                if (self.selectedIndex > 0) {
                    self.selectedIndex -= 1;
                }
            }
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self.tabBarVCDelegate.interactionController updateInteractiveTransition:progress];
        }
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            
            if (progress > 0.5) {
                self.tabBarVCDelegate.interactionController.completionSpeed = 0.99;// * self.tabBarVCDelegate.interactionController.duration ;
                [self.tabBarVCDelegate.interactionController finishInteractiveTransition];
            }else {
                //取消转场后，UITabBarController会自动恢复selectedIndex的值,不需要手动恢复
                self.tabBarVCDelegate.interactionController.completionSpeed = 0.99; //* self.tabBarVCDelegate.interactionController.duration;
                [self.tabBarVCDelegate.interactionController cancelInteractiveTransition];
            }
            self.tabBarVCDelegate.interactive = NO;
        }
            break;
        default:
            break;
    }
}

- (void)dealloc {
    [self.view removeGestureRecognizer:_pan];
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
