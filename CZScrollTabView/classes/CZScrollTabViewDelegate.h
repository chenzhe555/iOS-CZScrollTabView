//
//  CZScrollTabViewDelegate.h
//  CZScrollTabView
//
//  Created by yunshan on 2019/4/26.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CZScrollTabItemView;

NS_ASSUME_NONNULL_BEGIN

@protocol CZScrollTabViewDelegate <NSObject>

@optional

/**
 @brief 生成自定义Item视图

 @param index 索引值
 @param text 显示的文本
 @param contentSize 整个ContentView容器尺寸
 @return 自定义Item视图
 */
-(CZScrollTabItemView *)scrollTabItemViewAtIndex:(NSInteger)index text:(NSString *)text contentSize:(CGSize)contentSize;

/**
 @brief 点击Item事件

 @param index 选中索引值
 @param isSame 是否点击的相同的
 */
-(void)scrollTabDidSelectedAtIndex:(NSInteger)index isSame:(BOOL)isSame;
@end

NS_ASSUME_NONNULL_END
