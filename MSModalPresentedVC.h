//
//  MSModalPresentedVC.h
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/15.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSModalVCTransitionDelegate.h"

@interface MSModalPresentedVC : UIViewController

@property (nonatomic, strong) MSModalVCTransitionDelegate* modalDelegate;

@end
