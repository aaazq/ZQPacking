//
//  NSString+ZQHelper.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZQHelper)

//判断是否为空字符串
- (BOOL)isEmptyString;
- (NSString *)trimString;

/**
 //时间戳转日期字符串 默认: yyyy-MM-dd HH:mm:ss

 @return 默认: 2018-04-18 16:29:02
 */
- (NSString *)timelineToDateString;


/**
 时间戳以指定格式 转 日期字符串

 @param formatter eg. @"yyyy-MM-dd"
 @return eg. 2018-04-18
 */
- (NSString *)timelineToDateStringWithFormatter:(NSString*)formatter;


/**
 格式化金额数字，三位一逗号
 */
+ (NSString*)stringFormatMoneyCut:(NSString*)string;


/**
 格式化金额数字，超过1W, 展示为X万元，否则直接展示Xxxx元;

 @param money 金额
 @param font 单位字体大小
 @param color 单位字体颜色
 @return eg. 1.2万元 、6000元
 */
+ (NSMutableAttributedString*)stringFormatMoneyUtil:(CGFloat)money utilFont:(UIFont*)font utilColor:(UIColor*)color;


#pragma mark - 格式化手机号
/**
 格式化手机号码
 */
+ (NSString *)stringFormatPhoneNumber:(NSString *)phoneNumber;


#pragma mark - 格式化银行卡
/**
 格式化银行卡号，前6后4
 */
+ (NSString *)formatBankNumber:(NSString *)bankNumber;




//获取IP地址
+ (NSString *)IPAddress;


/**
 通过字符串 转换为 指定尺寸的 二维码
 
 @param size 尺寸
 @return 图片
 */
- (UIImage *)encodeQRImageWithSize:(CGSize)size;



/**
  拨打电话
 */
- (void)callTel;





@end
