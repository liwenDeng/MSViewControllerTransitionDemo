//
//  MSNavigationAnimationController.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/14.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "MSNavigationAnimationController.h"

#define IOS_VERSION_8_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))

@implementation MSNavigationAnimationController

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    UIView *fromView;
    UIView *toView;
    if (IOS_VERSION_8_OR_ABOVE) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    }else {
        fromView = fromVC.view;
        toView = toVC.view;
    }
    
    NSInteger fromIndex = [fromVC.navigationController.viewControllers indexOfObject:fromVC];
    NSInteger toIndex = [fromVC.navigationController.viewControllers indexOfObject:toVC];
    
    CGFloat translation = containerView.frame.size.width;
    CGAffineTransform toViewTransform = CGAffineTransformIdentity;
    CGAffineTransform fromViewTransform = CGAffineTransformIdentity;
    
    
    UIViewAnimationOptions animationType;
    if (fromIndex > toIndex) {
        animationType = UIViewAnimationOptionTransitionCurlDown;
    }else {
        translation = -translation;
        animationType = UIViewAnimationOptionTransitionCurlUp;
    }

    fromViewTransform = CGAffineTransformMakeTranslation(translation, 0);
    toViewTransform = CGAffineTransformMakeTranslation(-translation, 0);
    toView.transform = toViewTransform;
    
    [containerView addSubview:toView];

    
    [UIView animateWithDuration:0.5 animations:^{
        fromView.transform = fromViewTransform;
        toView.transform = CGAffineTransformIdentity;
        [transitionContext updateInteractiveTransition:1];
        //        NSLog(@"动画进行了");
    } completion:^(BOOL finished) {
        //转场结束后视图恢复到初状态
        fromView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;
        //###必须加上这句代码！！！ 否则toView不会显示
        //2. 必须告诉动画控制器转场是否完成
        BOOL isCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!isCancelled];
    }];

//    
//    [UIView transitionFromView:fromView toView:toView duration:0.5 options:(animationType) completion:^(BOOL finished) {
//        BOOL cancled = [transitionContext transitionWasCancelled];
//        [transitionContext completeTransition:!cancled];
//    }];
}
@end
