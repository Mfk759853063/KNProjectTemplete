//
//  KNBaseTableViewController.m
//  KNProjectTemplete
//
//  Created by kwep_vbn on 16/2/20.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "KNBaseTableViewController.h"
#import "KNNavigationDefines.h"

@implementation KNBaseTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:[self tableViewStyle]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.tableView.contentInset = UIEdgeInsetsMake(kNavigationBarHeight, 0, 0, 0);
}

- (UITableViewStyle)tableViewStyle {
    
    return UITableViewStylePlain;
}

#pragma mark - TableViewDelegate && Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
