//
//  ViewController.m
//  KNProjectTemplete
//
//  Created by kwep_vbn on 15/12/3.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.kn_navigationBar.title = @"Hello World";
    self.view.backgroundColor = [UIColor redColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIViewController *vc = [[ViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    });
    
    if (1) {
        UIImage *backImage = [UIImage imageNamed:@"bton_back_normal"];
        __weak ViewController *weakSelf = self;
        self.kn_navigationBar.leftItem = [[KNNavigationItem alloc] initWithItemSize:CGSizeMake(100, 44) title:@"" image:backImage handler:^(id sender) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
