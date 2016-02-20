//
//  HZKNTableViewCell.h
//  HuiXianxia
//
//  Created by hzdlapple2 on 15/11/19.
//  Copyright © 2015年 com.huixianxia.c. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZKNLineTableViewCell : UITableViewCell

- (void)showTopline:(BOOL)show;

- (void)showToplineLeftOffset:(CGFloat)leftOffset;

- (void)showBottomLine:(BOOL)show;

- (void)showBottomLineLeftOffset:(CGFloat)leftOffset;

- (UITableView *)getTableView;

@end
