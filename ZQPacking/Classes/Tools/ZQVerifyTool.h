//
//  ZQVerifyTool.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/19.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZQVerifyTool : NSObject

/**
 判断身份证
 */
+ (BOOL)validateIDCardNumber:(NSString *)value;
/**
 判断银行卡
 */
+ (BOOL) isValidCreditNumber:(NSString*)value;
/**
 密码纯数字
 */
+ (BOOL)isPasswordNumberOnly:(NSString *)password;

/**
 密码纯字母
 */
+ (BOOL)isPasswordLetterOnly:(NSString *)password;

/**
 密码6位数字
 */
+ (BOOL)isPasswordNumber:(NSString *)password;
/**
 验证密码格式
 */
+ (BOOL)validatePassword:(NSString *)password;
/**
 判断邮箱
 */
+ (BOOL)validateEmail:(NSString *)email;

@end
