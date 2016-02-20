//
//  KNMeilishuoHomePageViewController.m
//  KNProjectTemplete
//
//  Created by kwep_vbn on 16/2/20.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "KNMeilishuoHomePageViewController.h"
#import "KNTestService.h"
#import "HomePageRowModel.h"
#import "MJExtension.h"
#import "HZKNLineTableViewCell.h"

@interface KNMeilishuoHomePageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *dataSource;

@end


@implementation KNMeilishuoHomePageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.kn_navigationBar.title = @"美丽街";
    self.view.backgroundColor = [UIColor whiteColor];
    KNTestService *service = [KNTestService new];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [service requestTestAPI:@"http://mobapi.meilishuo.com/2.0/note/home_prototype.json?mac=02%3A00%3A00%3A00%3A00%3A00&_res=640%2A1136&_page_code=MLSHomePagePosterViewController&idfv=B522F5CF-B519-4CBC-B03B-BCCE5041AE90&device_id=oudid_d0f86d7609a1565a3cc9d29f17a1548be2d97646&open_udid=d0f86d7609a1565a3cc9d29f17a1548be2d97646&_sign=529d6b034f617985569dbcfed740ed287e7c7b35&access_token=df0185d48568572adc474c6740f7f48d&st=1455969697&idfa=E820A2A4-8BC3-481E-BD95-6940B270B464" parms:nil success:^(id operation, id response) {
            self.dataSource = [HomePageRowModel mj_objectArrayWithKeyValuesArray:[response valueForKeyPath:@"data.list"]];
            [self.tableView reloadData];
        } faild:^(NSError *error, id operation) {
            
        }];
    });
}

- (BOOL)needBackItem {
    return NO;
}

#pragma mark - TableViewDelegate && Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    HZKNLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[HZKNLineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"1";
    return cell;
}


@end
