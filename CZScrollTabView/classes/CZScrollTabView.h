//
//  CZScrollTabView.h
//  ScrollTab
//
//  Created by yunshan on 2019/4/26.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZScrollTabViewDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface CZScrollTabView : UIView
/**
 @brief 代理回调
 */
@property (nonatomic, weak) id<CZScrollTabViewDelegate> delegate;

/**
 @brief YES 横向 NO 纵向 默认纵向
 @discussion 在给 CZScrollTabView 赋值frame之前调用
 */
@property (nonatomic, assign) BOOL isHorizontal;

/**
 @brief YES 均分 NO 不均分 默认不均分
 @discussion 在给 CZScrollTabView 赋值frame之前调用
 */
@property (nonatomic, assign) BOOL isAverage;

/**
 @brief 数据源 @[@"标题1",@"标题2",@"标题3"]
 @discussion 如果想修改数据源，再次赋值即可
 */
@property (nonatomic, strong) NSArray * dataArray;

/**
 @brief 当前选中索引值
 */
@property (nonatomic, assign) NSInteger selectedIndex;

/**
 @brief 当 isHorizontal 为YES isAverage 为NO 横向不均分的时候，文本距左右的间隙，默认15
 */
@property (nonatomic, assign) CGFloat itemSpace;

/**
 @brief 当 isHorizontal 为YES isAverage 为NO 横向不均分的时候，文本的Font，默认是 system 14，如果有自定义，需传此值
 */
@property (nonatomic, assign) UIFont * customFont;

@end

NS_ASSUME_NONNULL_END
