//
//  ZQNarrowBtn.m
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import "ZQNarrowBtn.h"

@implementation ZQNarrowBtn

- (instancetype)initWithFrame:(CGRect)frame {
    if (self= [super initWithFrame:frame]) {
        [self configureSelf];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self configureSelf];
    }
    return self;
}
- (void)configureSelf {
    //    [self setBackgroundColor:MainColor forState:UIControlStateNormal];
    //    [self setBackgroundColor:MainHilightColor forState:UIControlStateHighlighted];
    //    [self setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    //    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    //    self.layer.cornerRadius = 22;
    self.adjustsImageWhenHighlighted = NO;
    self.layer.masksToBounds = YES;
    [self addTarget:self action:@selector(btnSmallAnimation:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(btnSmallAnimation:) forControlEvents:UIControlEventTouchDragEnter];
    [self addTarget:self action:@selector(btnBigAnimation:) forControlEvents:UIControlEventTouchDragExit];
    [self addTarget:self action:@selector(btnBigAnimation:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)btnSmallAnimation:(UIButton *)sender {
    [UIView beginAnimations:@"small" context:nil];
    [UIView setAnimationDuration:0.2];
    CGAffineTransform transform = sender.transform;
    CGAffineTransform transform1 = CGAffineTransformScale(transform, 0.95, 0.95);
    sender.transform = transform1;
    self.titleLabel.textColor = [UIColor whiteColor];
    [UIView commitAnimations];
}

- (void)btnBigAnimation:(UIButton *)sender {
    [UIView beginAnimations:@"bid" context:nil];
    [UIView setAnimationDuration:0.2];
    sender.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
    
}


@end
