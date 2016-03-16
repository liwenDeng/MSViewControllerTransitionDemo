//
//  MSModalVCTransitionDelegate.h
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/15.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

/**
 *  Modal 转场的代理
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MSModalVCTransitionDelegate : NSObject <UIViewControllerTransitioningDelegate>
/**
 *  是否允许交互
 */
@property (nonatomic, assign)BOOL interactive;
/**
 *  交互控制器
 */
@property (nonatomic, strong)UIPercentDrivenInteractiveTransition* interactionController;

@end
