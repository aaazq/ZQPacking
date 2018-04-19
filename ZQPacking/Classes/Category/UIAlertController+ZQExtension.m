//
//  UIAlertController+ZQExtension.m
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import "UIAlertController+ZQExtension.h"

@implementation UIAlertController (ZQExtension)

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle actionHandler:(void (^)(UIAlertAction *action))handler
{
    
    return [self alertVcWithTitle:title message:message actionTitle:actionTitle actionType:UIAlertActionStyleDefault actionHandler:handler preferredStyle:UIAlertControllerStyleAlert];
}

+ (instancetype)actionSheetWithTitle:(NSString *)title actionTitle:(NSString *)actionTitle actionType:(UIAlertActionStyle)actionType actionHandler:(void (^)(UIAlertAction *action))handler
{
    return [self alertVcWithTitle:title message:nil actionTitle:actionTitle actionType:actionType actionHandler:handler preferredStyle:UIAlertControllerStyleActionSheet];
}

+ (instancetype)alertVcWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle actionType:(UIAlertActionStyle)actionType actionHandler:(void (^)(UIAlertAction *action))handler preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *actionAction = [UIAlertAction actionWithTitle:actionTitle style:actionType handler: handler];
    
    [alertVC addAction:cancelAction];
    [alertVC addAction:actionAction];
    
    return alertVC;
}

@end
