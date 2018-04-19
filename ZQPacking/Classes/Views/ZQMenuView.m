//
//  ZQMenuView.m
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import "ZQMenuView.h"
#import "UIView+ZQExtension.h"
@interface ZQMenuView()
{
    NSArray *_dataArray;
    UIButton *_selectBtn;
    id<ZQMenuViewDelegate> _delegate;
}
@end
static NSInteger menuItemCount = 3;
@implementation ZQMenuView

- (instancetype)initWithFrame:(CGRect)frame
                    dataArray:(NSArray*)dataArray
                     delegate:(id<ZQMenuViewDelegate>)delegate {
    if (self = [super initWithFrame:frame]) {
        _dataArray = dataArray;
        _delegate = delegate;
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.alwaysBounceHorizontal = YES;
        if (dataArray != nil) {
            self.contentSize = CGSizeMake(self.width/menuItemCount*dataArray.count, 0);
            [self configureSubViews];
        }
        
    }
    return self;
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    self.contentSize = CGSizeMake(self.width/menuItemCount*dataArray.count, 0);
    [self configureSubViews];
}

- (void)configureSubViews {
    [self removeAllSubviews];
    for (int i = 0; i < _dataArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat btnW = (_dataArray.count <= menuItemCount) ? self.width/_dataArray.count : self.width/menuItemCount;
        CGFloat btnH = self.height;
        CGFloat btnX = btnW * i;
        CGFloat btnY = 0;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [btn setTitle:_dataArray[i][@"name"] forState:UIControlStateNormal];
        btn.tag = 1000+i;
        if (i == 0) {
            _selectBtn = btn;
        }
        btn.titleLabel.font = [UIFont systemFontOfSize:17];
        [btn setTitleColor:[UIColor colorWithWhite:255 alpha:i ? 0.6 : 1] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickActionWithSender:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
    }
}

- (void)clickActionWithSender:(UIButton*)sender {
    if ([sender isEqual:_selectBtn]) {return;}
    [_selectBtn setTitleColor:[UIColor colorWithWhite:255 alpha:0.6] forState:UIControlStateNormal];
    _selectBtn = sender;
    [sender setTitleColor:[UIColor colorWithWhite:255 alpha:1] forState:UIControlStateNormal];
    if ([_delegate respondsToSelector:@selector(clickMenuWithIndex:)]) {
        [_delegate clickMenuWithIndex:sender.tag-1000];
    }
}

- (void)commonMenuViewSetIndex:(NSInteger)selectIndex isAnimate:(BOOL)isAnimate {
    if (_selectBtn.tag == selectIndex + 1000) {return;}
    UIButton *newBtn = [self viewWithTag:1000+selectIndex];
    [self clickActionWithSender:newBtn];
    CGFloat pointX = 0.0f;
    if (_dataArray.count >= menuItemCount) {
        pointX = self.width*(selectIndex/menuItemCount);
    }
    [self setContentOffset:CGPointMake(pointX, 0) animated:isAnimate];
}


@end
