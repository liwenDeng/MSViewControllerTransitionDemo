//
//  MSNavigationTransitionVC.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/14.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "MSNavigationTransitionVC.h"

@interface MSNavigationTransitionVC ()

@property (nonatomic, strong)UIPanGestureRecognizer* pan;

@end

@implementation MSNavigationTransitionVC

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        _naviDelegate = [[MSNavigationTransitionVCDelegate alloc]init];
        self.delegate = _naviDelegate;
        
        self.view.backgroundColor = [UIColor blueColor];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        [self.view addGestureRecognizer:pan];
        self.pan = pan;

    }
    return self;
}

- (void)panAction:(UIPanGestureRecognizer*)sender {
    
    CGFloat direction = [sender velocityInView:self.view].x;
    CGFloat translationX = [sender translationInView:self.view].x;
    CGFloat translationAbs = translationX > 0 ? translationX : -translationX;
    CGFloat progress = translationAbs / self.view.frame.size.width ;
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            if (direction > 0) {
                if (self.viewControllers.count > 1) {
                    self.naviDelegate.interactive = YES;//启用手势交互
                    [self popViewControllerAnimated:YES];
                }
            }else {
                NSLog(@"wrong way!");
            }
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            if (self.naviDelegate.interactive) {
                NSLog(@"currentCount:====> %ld",self.viewControllers.count);
               [self.naviDelegate.interactionController updateInteractiveTransition:progress];
            }
        }
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            if (progress > 0.3) {
                [self.naviDelegate.interactionController finishInteractiveTransition];
            }else {
                [self.naviDelegate.interactionController cancelInteractiveTransition];
            }
            self.naviDelegate.interactive = NO;
        }
            break;
        default:
            break;
    }
}

@end
