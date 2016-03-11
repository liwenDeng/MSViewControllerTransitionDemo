//
//  MSTabBarVCDelegate.h
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/10.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

/**
 *  实现自定义tabVC转场动画的协议
 *
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MSTabBarVCDelegate : NSObject <UITabBarControllerDelegate>
/**
 *  是否使用手势滑动交互式转场 
 */
@property (nonatomic) BOOL interactive;

/**
 *  交互式转场控制器
 */
@property (nonatomic,strong) UIPercentDrivenInteractiveTransition* interactionController;

@end
