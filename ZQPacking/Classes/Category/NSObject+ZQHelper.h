//
//  NSObject+ZQHelper.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZQHelper)

/**
 获取Identifier
 */
+ (NSString *)getIdentifier;

/**
 获取NIB文件
 */
+ (UINib *)getNibObjc;

@end
