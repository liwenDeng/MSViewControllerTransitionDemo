//
//  MSNavigationTransitionVC.h
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/14.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

/**
 *  自定义转场功能的NavigationController
 */
#import <UIKit/UIKit.h>
#import "MSNavigationTransitionVCDelegate.h"

@interface MSNavigationTransitionVC : UINavigationController

@property (nonatomic, strong)MSNavigationTransitionVCDelegate *naviDelegate;

@end
