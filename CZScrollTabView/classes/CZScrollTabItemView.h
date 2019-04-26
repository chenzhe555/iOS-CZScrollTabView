//
//  CZScrollTabItemView.h
//  CZScrollTabView
//
//  Created by yunshan on 2019/4/26.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZScrollTabItemView : UIView

/**
 @brief 文本Label
 */
@property (nonatomic, strong) UILabel * textLabel;

/**
 @brief 横竖线视图
 */
@property (nonatomic, strong) UIView * lineView;

/**
 @brief YES 横向 NO 纵向 默认纵向
 */
@property (nonatomic, assign) BOOL isHorizontal;

/**
 @brief 当前是否选中
 */
@property (nonatomic, assign) BOOL isSelected;
@end

NS_ASSUME_NONNULL_END
