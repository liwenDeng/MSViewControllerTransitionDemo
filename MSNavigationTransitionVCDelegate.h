//
//  MSNavigationTransitionVCDelegate.h
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/14.
//  Copyright © 2016年 dengliwen. All rights reserved.
//


/**
 *  自定义的NavigationVC代理
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MSNavigationTransitionVCDelegate : NSObject <UINavigationControllerDelegate>

/**
 *  是否允许交互 (手势交互)
 */
@property (nonatomic, assign) BOOL interactive;

/**
 *  交互控制器
 */
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition* interactionController;

@end
