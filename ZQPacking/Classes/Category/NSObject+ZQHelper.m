//
//  NSObject+ZQHelper.m
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import "NSObject+ZQHelper.h"

@implementation NSObject (ZQHelper)

/**
 获取Identifier
 */
+ (NSString *)getIdentifier {
    return NSStringFromClass(self);
}

/**
 获取NIB文件
 */
+ (UINib *)getNibObjc {
    BOOL hasNib = [[NSBundle mainBundle] pathForResource:NSStringFromClass(self) ofType:@"nib"] != nil;
    if (hasNib) {
        return [UINib nibWithNibName:NSStringFromClass(self) bundle:nil];
    } else {
        NSAssert(!hasNib, @"不存在Xib文件");
        return nil;
    }
}


@end
