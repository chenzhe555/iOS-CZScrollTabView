//
//  CZScrollTabItemView.m
//  CZScrollTabView
//
//  Created by yunshan on 2019/4/26.
//  Copyright © 2019 chenzhe. All rights reserved.
//

#import "CZScrollTabItemView.h"

@implementation CZScrollTabItemView

-(void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    self.lineView.hidden = !isSelected;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.textLabel.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    if (self.isHorizontal) {
        self.lineView.frame = CGRectMake((frame.size.width - 20)/2, frame.size.height - 4, 20, 4);
    } else {
        self.lineView.frame = CGRectMake(0, (frame.size.height - 16)/2, 4, 16);
    }
}

-(UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont systemFontOfSize:14];
        _textLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_textLabel];
    }
    return _textLabel;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithRed:255/255.0 green:85/255.0 blue:85/255.0 alpha:1];
        [self addSubview:_lineView];
        [self bringSubviewToFront:_lineView];
        _lineView.hidden = YES;
    }
    return _lineView;
}
@end
