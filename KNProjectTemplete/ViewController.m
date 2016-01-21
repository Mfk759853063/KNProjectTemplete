//
//  ViewController.m
//  KNProjectTemplete
//
//  Created by kwep_vbn on 15/12/3.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "ViewController.h"
#import "KNTestService.h"
#import "MBProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.kn_navigationBar.title = @"Hello World";
    self.view.backgroundColor = [UIColor whiteColor];
    KNTestService *service = [KNTestService new];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [service requestTestAPI:@"http://sunnyvalue.github.io/MVP/food.json" parms:nil success:^(id operation, id response) {
            
        } faild:^(NSError *error, id operation) {
            
        }];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
