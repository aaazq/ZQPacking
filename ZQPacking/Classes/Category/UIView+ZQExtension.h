//
//  UIView+ZQExtension.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZQExtension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

/*
 *通过Xib快速设置圆角、边框、边框颜色
 */
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderwidth;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

/**
 * 移除所有子视图.
 */
- (void)removeAllSubviews;

@end
