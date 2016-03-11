//
//  MSSlideAnimationController.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/10.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "MSSlideAnimationController.h"

#define IOS_VERSION_8_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))

@interface MSSlideAnimationController ()



@end

@implementation MSSlideAnimationController

- (instancetype)initWithTransitionType:(MSTransitionType)transitionType direction:(MSTabOperationDirection)direction{
    if (self = [super init]) {
        _transitionType = transitionType;
        _direction = direction;
    }
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning 转场动画协议
/**
 *  执行动画的地方，最核心的方法
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    /*此方法接受一个遵守协议的转场环境对象
     提供转场所需的重要数据，参与转场的视图控制器和转场过程的状态信息。
     UIKit在转场开始前生成遵守转场协议的对象 transitionContext，具有以下重要信息：
     
     返回容器视图，转场动画发生的地方
     - (nullable UIView *)containerView;
     
     获取参与转场的视图控制器，有 UITransitionContextFromViewControllerKey UITransitionContextToViewControllerKey 两个Key
     - (nullable __kindof UIViewController *)viewControllerForKey:(NSString *)key;
     
     iOS8新增API用于方便获取参与转场的视图，有UITransitionContextFromViewKey UITransitionContextToViewKey 两个Key
     通过viewForKey: 获取的视图是viewControllerForKey: 返回的控制器的根视图，或者nil。只有在UIModalPresentationCuston模式下的Modal转场，通过此方法获取presentView时得到的将是nil
     - (nullable __kindof UIView *)viewForKey:(NSString *)key NS_AVAILABLE_IOS(8_0);
     */
    
    //在 iOS 8 中可通过以下方法来获取参与转场的三个重要视图，在 iOS 7 中则需要通过对应的视图控制器来获取，
    //另外只适用于 Navigation 和 tabBar， Modal转场需要通过VC获取view http://www.jianshu.com/users/7ba5d9065301/latest_articles
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView;
    UIView *toView;
    
    UIView *containerView = [transitionContext containerView];
    if (IOS_VERSION_8_OR_ABOVE) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    }else {
        fromView = fromVC.view;
        toView = toVC.view;
    }

    [containerView addSubview:toView];
    
    CGFloat translation = containerView.frame.size.width;
    CGAffineTransform toViewTransform = CGAffineTransformIdentity;
    CGAffineTransform fromViewTransform = CGAffineTransformIdentity;
    
    switch (self.transitionType) {
        case MSNavigationTransition:
        {
            
        }
            break;
        case MSTabTransition:
        {
            //判断滑动方向
            translation = self.direction == MSTabOperationDirectionLeft ? translation : -translation;
            fromViewTransform = CGAffineTransformMakeTranslation(translation, 0);
            toViewTransform = CGAffineTransformMakeTranslation(-translation, 0);
        }
            break;
        case MSModalTransition:
        {
        
        }
            break;
        default:
            break;
    }
//    NSLog(@"执行动画");
    toView.transform = toViewTransform;
    
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
        if (isCancelled) {
            [toView removeFromSuperview];
        }else {
            [fromView removeFromSuperview];
        }
        [transitionContext completeTransition:!isCancelled];
    }];
    


}

/**
 *  返回动画时间
 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
//        NSLog(@"time:0.5");
    return 0.5;
}

/**
 *  如果实现了，会在转场动画结束后调用以执行一些收尾工作
 */
- (void)animationEnded:(BOOL)transitionCompleted {
    if (transitionCompleted) {
       NSLog(@"finished");
    }else {
        NSLog(@"not finished");
    }
}
@end
