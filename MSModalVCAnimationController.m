//
//  MSModalVCAnimationController.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/15.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "MSModalVCAnimationController.h"
#define IOS_VERSION_8_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))

@implementation MSModalVCAnimationController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    /*
    iOS 8 为<UIViewControllerContextTransitioning>协议添加了viewForKey:方法以方便获取 fromView 和 toView，但是在 Modal 转场里要注意，从上面可以知道，Custom 模式下，presentingView 并不受 containerView 管理，这时通过viewForKey:方法来获取 presentingView 得到的是 nil，必须通过viewControllerForKey:得到 presentingVC 后来获取。因此在 Modal 转场中，较稳妥的方法是从 fromVC 和 toVC 中获取 fromView 和 toView。
     */

    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;

    CGFloat toViewWidth = containerView.frame.size.width * 2 / 3;
    CGFloat toViewHeight = containerView.frame.size.height * 2 /3;

    // 处理Presentation 转场
    if ([toVC isBeingPresented]) {
        [containerView addSubview:toView];
               toView.bounds = CGRectMake(0, 0, 1, toViewHeight);
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithFrame:containerView.bounds];
        [containerView insertSubview:effectView belowSubview:toView];
        UIVisualEffect *effect = [UIBlurEffect effectWithStyle:(UIBlurEffectStyleDark)];
        [effectView setEffect:effect];
        
        [UIView animateWithDuration:0.5 animations:^{
            toView.frame = CGRectMake(0, 0, toViewWidth, toViewHeight);
            toView.center = containerView.center;
        } completion:^(BOOL finished) {
            BOOL isCancelled = [transitionContext transitionWasCancelled];
            [transitionContext completeTransition:!isCancelled];
        }];

    }
    
    // 处理Dismissal 转场
    if ([fromVC isBeingDismissed]) {
        [UIView animateWithDuration:0.5 animations:^{
            fromView.bounds = CGRectMake(0, 0, 1, toViewHeight);
        } completion:^(BOOL finished) {
            BOOL isCancelled = [transitionContext transitionWasCancelled];
            [transitionContext completeTransition:!isCancelled];
        }];
    }
    
    
}

@end
