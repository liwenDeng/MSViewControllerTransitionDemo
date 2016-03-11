//
//  MSSlideAnimationController.h
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/10.
//  Copyright © 2016年 dengliwen. All rights reserved.
//
/**
 *  转场动画控制器,实现了UIViewControllerAnimatedTransitioning
 *  告诉 MSTabBarVCDelegate 具体的转场动画实现方式
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 *  转场类型
 */
typedef NS_ENUM(NSUInteger, MSTransitionType) {
    /**
     *  Navigation转场
     */
    MSNavigationTransition = 0,
    /**
     *  Tab转场
     */
    MSTabTransition,
    /**
     *  Modal 模态转场(present)
     */
    MSModalTransition
};

/**
 *  Tab转场滑动方向
 */
typedef NS_ENUM(NSUInteger, MSTabOperationDirection) {
    MSTabOperationDirectionLeft = 0,
    MSTabOperationDirectionRight
};

/**
 *  模态转场类型
 */
typedef NS_ENUM(NSUInteger, MSModalOperation) {
    MSModalPresentation = 0,
    MSModalDisissal,
};

@interface MSSlideAnimationController : NSObject <UIViewControllerAnimatedTransitioning>

/**
 *  构造方法 返回一个动画控制器
 */
- (instancetype)initWithTransitionType:(MSTransitionType)transitionType direction:(MSTabOperationDirection)direction;

/**
 *  转场类型
 */
@property (nonatomic, assign) MSTransitionType transitionType;
@property (nonatomic, assign) MSTabOperationDirection direction;

@end
