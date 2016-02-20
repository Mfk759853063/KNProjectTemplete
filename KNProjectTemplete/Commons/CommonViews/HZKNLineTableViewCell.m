//
//  HZKNTableViewCell.m
//  HuiXianxia
//
//  Created by hzdlapple2 on 15/11/19.
//  Copyright © 2015年 com.huixianxia.c. All rights reserved.
//

#import "HZKNLineTableViewCell.h"

@interface HZKNLineTableViewCell()

@property (strong, nonatomic) UIView *topLineView;
@property (strong, nonatomic) UIView *bottomLineView;

@end


@implementation HZKNLineTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)showTopline:(BOOL)show {
    [self layoutIfNeeded];
    self.topLineView.hidden = !show;
}

- (void)showToplineLeftOffset:(CGFloat)leftOffset {
    [self layoutIfNeeded];
    [self.topLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(leftOffset);
    }];
}

- (void)showBottomLine:(BOOL)show {
    self.bottomLineView.hidden = !show;
}

- (void)showBottomLineLeftOffset:(CGFloat)leftOffset {
    [self layoutIfNeeded];
    [self.bottomLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(leftOffset);
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 使用默认style
    UITableView *tableView = [self getTableView];
    if (tableView) {
        NSIndexPath *indexPath = [tableView indexPathForCell:self];
        BOOL showTopLine,showBottomLine;
        if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
            showTopLine = YES;
            showBottomLine = YES;
        } else if (indexPath.row == 0) {
            showTopLine = YES;
            showBottomLine = YES;
        } else {
            showTopLine = NO;
            showBottomLine = YES;
        }
        self.topLineView.hidden = self.topLineView.hidden? YES:!showTopLine;
        self.bottomLineView.hidden = self.bottomLineView.hidden?YES:!showBottomLine;
    }
}

- (UITableView *)getTableView {
    UIView *wrapperView=[self superview];
    UITableView *superTableView=(UITableView *)[wrapperView superview];
    return superTableView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

#pragma mark - getter && setter
- (UIView *)topLineView
{
    if (!_topLineView) {
        _topLineView = [[UIView alloc] init];
        [self.contentView addSubview:_topLineView];
        [_topLineView setBackgroundColor:[UIColor colorWithHex:0xcccccc]];
        [_topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.and.top.equalTo(self.contentView);
            make.height.equalTo(@0.5);
        }];
    }
    return _topLineView;
}

- (UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        [self.contentView addSubview:_bottomLineView];
        [_bottomLineView setBackgroundColor:[UIColor colorWithHex:0xcccccc]];
        [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.and.bottom.equalTo(self.contentView);
            make.height.equalTo(@0.5);
        }];
    }
    return _bottomLineView;
}

@end
