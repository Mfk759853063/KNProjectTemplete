//
//  KNNavigationController.m
//  KNNavigationController
//
//  Created by kwep_vbn on 15/11/23.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "KNNavigationController.h"
#import "KNNavigationDefines.h"
#import "UIViewController+KNNavigation.h"

@interface KNNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation KNNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self congigureNavigationBarForViewController:viewController];
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}

- (void)setDelegate:(id<UINavigationControllerDelegate>)delegate {}

- (void)handlePanRecognizer:(UIPanGestureRecognizer*)recognizer {}

- (void)congigureNavigationBarForViewController:(UIViewController *)viewcontroller {
    if (!viewcontroller.kn_navigationBar) {
        KNNavigationBar *navigationBar = [[KNNavigationBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 64)];
        viewcontroller.kn_navigationBar = navigationBar;
        [viewcontroller.view addSubview:viewcontroller.kn_navigationBar];
    }
}
@end
