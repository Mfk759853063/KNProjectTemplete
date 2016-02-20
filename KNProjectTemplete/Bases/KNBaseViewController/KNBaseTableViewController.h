//
//  KNBaseTableViewController.h
//  KNProjectTemplete
//
//  Created by kwep_vbn on 16/2/20.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "KNBaseViewController.h"

@interface KNBaseTableViewController : KNBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

- (UITableViewStyle)tableViewStyle;

@end
