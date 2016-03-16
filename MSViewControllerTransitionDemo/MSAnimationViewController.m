//
//  MSAnimationViewController.m
//  MSViewControllerTransitionDemo
//
//  Created by dengliwen on 16/3/10.
//  Copyright © 2016年 dengliwen. All rights reserved.
//

#import "MSAnimationViewController.h"
#import "MSNavigationTransitionVC.h"

@interface MSAnimationViewController ()

@property (nonatomic, strong) UIPanGestureRecognizer* pan;
@property (nonatomic, strong) MSNavigationTransitionVCDelegate* naviDelegate;

@end

@implementation MSAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    btn1.frame = CGRectMake(20, 160, 140, 20);
    [self.view addSubview:btn1];
    [btn1 setTitle:@"goBack" forState:(UIControlStateNormal)];
    [btn1 addTarget:self action:@selector(goBack) forControlEvents:(UIControlEventTouchUpInside)];
    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
//    [self.view addGestureRecognizer:pan];
//    self.pan = pan;
}



- (void)goBack{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

//- (void)panAction:(UIPanGestureRecognizer*)sender {
//    CGFloat direction = [sender velocityInView:self.view].x;
//    CGFloat translationX = [sender translationInView:self.view].x;
//    CGFloat translationAbs = translationX > 0 ? translationX : -translationX;
//    CGFloat progress = translationAbs / self.view.frame.size.width ;
//    
//    
//
//    
//    switch (sender.state) {
//        case UIGestureRecognizerStateBegan:
//        {
//            // 需要在这里对naviDelegate赋值，当执行pop操作后，self.navigationController 将变成nil
//            MSNavigationTransitionVC *navi = (MSNavigationTransitionVC*)self.navigationController;
//            MSNavigationTransitionVCDelegate *naviDelegate = (MSNavigationTransitionVCDelegate*)navi.delegate;
//            self.naviDelegate = naviDelegate;
//            
//            navi.naviDelegate.interactive = YES;//启用手势交互
//            if (direction > 0) {
//                [navi popViewControllerAnimated:YES];
//            }else {
////                MSAnimationViewController *nextVC = [[MSAnimationViewController alloc]init];
////                if (self.navigationController) {
////                    [self.navigationController pushViewController:nextVC animated:YES];
////                }
//                NSLog(@"wrong way!");
//            }
//        }
//            break;
//        case UIGestureRecognizerStateChanged:
//        {
//            NSLog(@"progress:%lf",progress);
//            [self.naviDelegate.interactionController updateInteractiveTransition:progress];
//        }
//            break;
//        case UIGestureRecognizerStateCancelled:
//        case UIGestureRecognizerStateEnded:
//        {
//            
//            if (progress > 0.3) {
////                navi.naviDelegate.interactionController.completionSpeed = 0.99;// * self.tabBarVCDelegate.interactionController.duration ;
//                [self.naviDelegate.interactionController finishInteractiveTransition];
//            }else {
//                //取消转场后，UITabBarController会自动恢复selectedIndex的值,不需要手动恢复
////                navi.naviDelegate.interactionController.completionSpeed = 0.99; //* self.tabBarVCDelegate.interactionController.duration;
//                [self.naviDelegate.interactionController cancelInteractiveTransition];
//            }
//            self.naviDelegate.interactive = NO;
//        }
//            break;
//        default:
//            break;
//    }
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self.view removeGestureRecognizer:self.pan];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
