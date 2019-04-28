//
//  CZScrollTabView.m
//  ScrollTab
//
//  Created by yunshan on 2019/4/26.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import "CZScrollTabView.h"
#import "CZScrollTabItemView.h"
#import <CZCategory/NSString+CZCategory.h>
#import <CZCategory/UIView+CZCategory.h>

@interface CZScrollTabView ()<UITableViewDelegate, UITableViewDataSource>

/**
 @brief 容器视图
 */
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation CZScrollTabView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.itemSpace = 15;
        self.customFont = [UIFont systemFontOfSize:14];
    }
    return self;
}

#pragma mark 方法重写
-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if (!CGRectEqualToRect(frame, CGRectZero)) self.tableView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
}

-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    if (self.tableView.delegate) {
        self.selectedIndex = 0;
    } else {
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
}

-(void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    [self.tableView reloadData];
}

#pragma mark 属性
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (self.isHorizontal) _tableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
        _tableView.scrollEnabled = !self.isAverage;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor redColor];
        [self addSubview:_tableView];
    }
    return _tableView;
}

#pragma markz 自定义方法
-(CGFloat)getCellHeight:(NSIndexPath *)indexPath
{
    if (self.isHorizontal) {
        if (self.isAverage) {
            return self.width/self.dataArray.count;
        } else {
            NSString * text = self.dataArray[indexPath.row];
            CGSize textSize = [text getTextActualSize:self.customFont lines:0 maxWidth:[UIScreen mainScreen].bounds.size.width];
            return textSize.width + self.itemSpace*2;
        }
    } else {
        return self.isAverage ? (self.height/self.dataArray.count) : 50;
    }
}

-(CZScrollTabItemView *)getItemView:(UITableViewCell *)cell
{
    return [cell.contentView viewWithTag:1001];
}

#pragma mark UITableView回调事件
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CZScrollTabViewCellIndentifier = @"CZScrollTabViewCellIndentifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CZScrollTabViewCellIndentifier];
    NSString * text = self.dataArray[indexPath.row];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CZScrollTabViewCellIndentifier];
        if (self.isHorizontal) cell.contentView.transform = CGAffineTransformMakeRotation(M_PI_2);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        // 非旋转情况下
        if (!(self.isHorizontal && !self.isAverage)) {
            cell.frame = CGRectMake(cell.x, cell.y, self.isHorizontal ? self.height : self.width, [self getCellHeight:indexPath]);
            cell.contentView.frame = cell.bounds;
        }
        CZScrollTabItemView * view = nil;
        // 创建内容视图
        if (self.delegate && [self.delegate respondsToSelector:@selector(scrollTabItemViewAtIndex:text:contentSize:)]) {
            CGSize contentSize = (self.isHorizontal && !self.isAverage) ? CGSizeMake(cell.contentView.height, cell.contentView.width) : CGSizeMake(cell.contentView.width, cell.contentView.height);
            view = [self.delegate scrollTabItemViewAtIndex:indexPath.row text:text contentSize:contentSize];
        } else {
            view = [[CZScrollTabItemView alloc] init];
        }
        view.isHorizontal = self.isHorizontal;
        [cell.contentView addSubview:view];
        view.tag = 1001;
    }
    CZScrollTabItemView * view = [self getItemView:cell];
    // 旋转情况下
    if (self.isHorizontal && !self.isAverage) {
        cell.frame = CGRectMake(0, 0, self.height, [self getCellHeight:indexPath]);
        cell.contentView.frame = cell.bounds;
        view.frame = CGRectMake(0, 0, cell.contentView.height, cell.contentView.width);
    } else {
        view.frame = CGRectMake(0, 0, cell.contentView.width, cell.contentView.height);
    }
    view.textLabel.text = text;
    if (indexPath.row == self.selectedIndex) view.isSelected = YES;
    else view.isSelected = NO;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL isSame = (self.selectedIndex == indexPath.row);
    self.selectedIndex = indexPath.row;
    [self.tableView reloadData];
    // 回调
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollTabDidSelectedAtIndex:isSame:)]) {
        [self.delegate scrollTabDidSelectedAtIndex:indexPath.row isSame:isSame];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self getCellHeight:indexPath];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

@end
