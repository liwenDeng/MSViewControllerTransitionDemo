//
//  MSModalVCTransitionDelegate.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/15.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "MSModalVCTransitionDelegate.h"
#import "MSModalVCAnimationController.h"

@implementation MSModalVCTransitionDelegate

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - UIViewControllerTransitioningDelegate
/**
 *  当执行present操作时会调用此方法
 *
 *  @return 返回present时进行的转场控制器
 */
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [[MSModalVCAnimationController alloc]init];
}

/**
 *  当执行dismiss操作时会调用此方法
 *
 *  @return 返回dismiss时进行的转场控制器
 */
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {

    return  [[MSModalVCAnimationController alloc]init];
}

/**
 *  执行 dismiss  时都会执行此方法
 *  @return 返回交互控制器
 */
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {

    return  self.interactive ? self.interactionController : nil;
}

/**
 *  执行 dismiss  时都会执行此方法
 *  @return 返回交互控制器
 */
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {

    return self.interactive ? self.interactionController : nil;
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0) {

    return nil;
}

#pragma mark - LazyLoading
- (UIPercentDrivenInteractiveTransition *)interactionController {
    if (!_interactionController) {
        _interactionController = [[UIPercentDrivenInteractiveTransition alloc]init];
    }
    return _interactionController;
}

@end
