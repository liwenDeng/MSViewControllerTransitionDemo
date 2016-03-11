//
//  MSTabBarVCDelegate.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/10.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "MSTabBarVCDelegate.h"
#import "MSSlideAnimationController.h"

@interface MSTabBarVCDelegate ()

@property (nonatomic, strong)MSSlideAnimationController* animationControll;

@end

@implementation MSTabBarVCDelegate

- (instancetype)init {
    if (self = [super init]) {
        _animationControll = [[MSSlideAnimationController alloc]init];
    }
    return self;
}

#pragma mark - UITabBarControllerDelegate
- (id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactive ? self.interactionController : nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
//    if (self.interactive) {
//        return nil;
//    }
    NSInteger fromIndex = [tabBarController.viewControllers indexOfObject:fromVC];
    NSInteger toIndex = [tabBarController.viewControllers indexOfObject:toVC];
    // 判断滑动方向
    MSTabOperationDirection direction = fromIndex > toIndex ? MSTabOperationDirectionLeft : MSTabOperationDirectionRight;
    
    // 创建对应的转场动画
//    MSSlideAnimationController *slideAnimationController = [[MSSlideAnimationController alloc]initWithTransitionType:(MSTabTransition) direction:(direction)];
    _animationControll.direction = direction;
    _animationControll.transitionType = MSTabTransition;
    
    NSLog(@"变化没");
    
    return _animationControll;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    NSLog(@"询问是否应该选中");
    return YES;
}
//
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"确定选中");
}

#pragma mark -LazyProerty
- (UIPercentDrivenInteractiveTransition *)interactionController {
    if (!_interactionController) {
        _interactionController = [[UIPercentDrivenInteractiveTransition alloc]init];
    }
    return _interactionController;
}

@end
