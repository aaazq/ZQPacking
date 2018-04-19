//
//  UIButton+ZQBackgroundColor.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZQBackgroundColor)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

- (void)setCornerBackgroundColor:(UIColor *)backgroundColor withRadius:(CGFloat)radius forState:(UIControlState)state;

@end
