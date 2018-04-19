//
//  UIAlertController+ZQExtension.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (ZQExtension)

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle actionHandler:(void (^)(UIAlertAction *action))handler;

+ (instancetype)actionSheetWithTitle:(NSString *)title actionTitle:(NSString *)actionTitle actionType:(UIAlertActionStyle)actionType actionHandler:(void (^)(UIAlertAction *action))handler;

@end
