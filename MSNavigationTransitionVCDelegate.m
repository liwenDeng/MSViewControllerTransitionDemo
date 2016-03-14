//
//  MSNavigationTransitionVCDelegate.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/14.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "MSNavigationTransitionVCDelegate.h"
#import "MSNavigationAnimationController.h"

@implementation MSNavigationTransitionVCDelegate

#pragma mark - UINavigationControllerDelegate
/**
 *  代理方法，返回一个动画控制器
 *
 *  @return 一个动画控制器
 */
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {

    MSNavigationAnimationController *animationController = [[MSNavigationAnimationController alloc]init];
    
    return animationController;
}

/**
 *  代理方法，返回一个交互控制器
 *  @return 一个交互控制器
 */
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactive ? self.interactionController : nil;
}

#pragma mark - LazyLoading
- (UIPercentDrivenInteractiveTransition *)interactionController {
    if (!_interactionController) {
        _interactionController = [[UIPercentDrivenInteractiveTransition alloc]init];
    }
    return _interactionController;
}

@end
