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

#pragma mark - UITabBarControllerDelegate
/**
 *  返回一个交互控制器
 *
 *  @return 如果允许交互（自定义添加的手势交互，如滑动）则返回一个 UIPercentDrivenInteractiveTransition 类型的交互控制器对象,否则返回nil
 */
- (id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactive ? self.interactionController : nil;
}

/**
 *  通过返回的动画控制器，该动画控制器实现了转场动画
 *
 *  @return 一个动画控制器
 */
- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{

    NSInteger fromIndex = [tabBarController.viewControllers indexOfObject:fromVC];
    NSInteger toIndex = [tabBarController.viewControllers indexOfObject:toVC];
    // 判断滑动方向
    MSTabOperationDirection direction = fromIndex > toIndex ? MSTabOperationDirectionLeft : MSTabOperationDirectionRight;
    
    // 创建对应的转场动画
    MSSlideAnimationController *slideAnimationController = [[MSSlideAnimationController alloc]initWithTransitionType:(MSTabTransition) direction:(direction)];
    slideAnimationController.direction = direction;
    slideAnimationController.transitionType = MSTabTransition;
    
    return slideAnimationController;
}

#pragma mark -LazyProerty
- (UIPercentDrivenInteractiveTransition *)interactionController {
    if (!_interactionController) {
        _interactionController = [[UIPercentDrivenInteractiveTransition alloc]init];
    }
    return _interactionController;
}

@end
