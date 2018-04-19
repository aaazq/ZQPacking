//
//  NSString+ZQHelper.m
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import "NSString+ZQHelper.h"

#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

@implementation NSString (ZQHelper)

#pragma mark 清空字符串中的空白字符
- (NSString *)trimString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark 是否空字符串
- (BOOL)isEmptyString
{
    return ([self trimString].length == 0);
}


#pragma mark 时间戳转日期字符串
/**
 //时间戳转日期字符串 默认: yyyy-MM-dd HH:mm:ss
 
 @return 默认: 2018-04-18 16:29:02
 */
- (NSString *)timelineToDateString
{
    return [self timelineToDateStringWithFormatter:@"yyyy-MM-dd HH:mm:ss"];
}

/**
 时间戳以指定格式 转 日期字符串
 
 @param formatter eg. @"yyyy-MM-dd"
 @return eg. 2018-04-18
 */
- (NSString *)timelineToDateStringWithFormatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:formatter];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]];
    return [dateFormatter stringFromDate:date];
}

#pragma mark - 格式化金额
/**
 格式化金额数字，三位一逗号
 */
+ (NSString*)stringFormatMoneyCut:(NSString*)string {
    NSString *sign = nil;
    if ([string hasPrefix:@"-"]||[string hasPrefix:@"+"]) {
        sign = [string substringToIndex:1];
        string = [string substringFromIndex:1];
    }
    if (string.length > 3) {
        NSString *pointLast = [string substringFromIndex:[string length]-3];
        NSString *pointFront = [string substringToIndex:[string length]-3];
        int commaNum = (int)([pointFront length]-1)/3;
        NSMutableArray *arr = [NSMutableArray array];
        for (int i = 0; i < commaNum+1; i++) {
            int index = (int)[pointFront length] - (i+1)*3;
            int leng = 3;
            if(index < 0)
            {
                leng = 3+index;
                index = 0;
                
            }
            NSRange range = {index,leng};
            NSString *stq = [pointFront substringWithRange:range];
            [arr addObject:stq];
        }
        NSMutableArray *arr2 = [NSMutableArray array];
        int arrLength = (int)[arr count];
        for (int i = arrLength-1; i>=0; i--) {
            [arr2 addObject:arr[i]];
        }
        NSString *commaString = @"";
        if (arr2.count == 1) {
            commaString = [[arr2 componentsJoinedByString:@","] stringByAppendingString:pointLast];
        }else{
            commaString = [[arr2 componentsJoinedByString:@","] stringByAppendingString:pointLast];
        }
        if (sign) {
            commaString = [sign stringByAppendingString:commaString];
        }
        return commaString;
    }else{
        return string;
    }
}

/**
 格式化金额数字，超过1W, 展示为X万元，否则直接展示Xxxx元;
 
 @param money 金额
 @param font 单位字体大小
 @param color 单位字体颜色
 @return eg. 1.2万元 、6000元
 */
+ (NSMutableAttributedString*)stringFormatMoneyUtil:(CGFloat)money utilFont:(UIFont*)font utilColor:(UIColor*)color {

    if (money >= 10000) {
        NSString *moneyStr = [NSString stringWithFormat:@"%.2f万元", money/10000];
        NSMutableAttributedString *moneyMStr = [[NSMutableAttributedString alloc] initWithString:moneyStr];
        [moneyMStr addAttributes:@{NSFontAttributeName : font, NSForegroundColorAttributeName : color} range:[moneyStr rangeOfString:@"万元"]];
        return moneyMStr;
    } else {
        NSString *moneyStr = [NSString stringWithFormat:@"%.0f元", money];
        NSMutableAttributedString *moneyMStr = [[NSMutableAttributedString alloc] initWithString:moneyStr];
        [moneyMStr addAttributes:@{NSFontAttributeName : font, NSForegroundColorAttributeName : color} range:[moneyStr rangeOfString:@"元"]];
        return moneyMStr;
    }
    
}

#pragma mark - 格式化手机号
/**
 格式化手机号码
 */
+ (NSString *)stringFormatPhoneNumber:(NSString *)phoneNumber {
    if (phoneNumber.length != 11) {
        return phoneNumber;
    }
    //格式化手机号码
    NSString *formattedNumber = [phoneNumber stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    return formattedNumber;
}

#pragma mark - 格式化银行卡
/**
 格式化银行卡号，前6后4
 */
+ (NSString *)formatBankNumber:(NSString *)bankNumber {
    if (bankNumber.length == 0) {
        return bankNumber;
    }
    NSInteger length = bankNumber.length;
    NSString *formattedNumber = [bankNumber stringByReplacingCharactersInRange:NSMakeRange(6, length-4-6) withString:@"******"];
    return formattedNumber;
}




#pragma mark 获取IP地址
/******************  获取IP地址  ********************/
+ (NSString *)IPAddress
{
    NSArray *searchArray =
    @[IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6 ];
    
    NSDictionary *addresses = [self getIPAddresses];
    
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
     {
         address = addresses[key];
         if(address) *stop = YES;
     } ];
    return address ? address : @"0.0.0.0";
}

+ (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}

#pragma mark 字符串转二维码
/**
 通过字符串 转换为 指定尺寸的 二维码

 @param size 尺寸
 @return 图片
 */
- (UIImage *)encodeQRImageWithSize:(CGSize)size {
    UIImage *codeImage = nil;
    NSData *stringData = [self dataUsingEncoding: NSUTF8StringEncoding];
    
    //生成
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    
    UIColor *onColor = [UIColor blackColor];
    UIColor *offColor = [UIColor whiteColor];
    
    //上色
    CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"
                                       keysAndValues:
                             @"inputImage",qrFilter.outputImage,
                             @"inputColor0",[CIColor colorWithCGColor:onColor.CGColor],
                             @"inputColor1",[CIColor colorWithCGColor:offColor.CGColor],
                             nil];
    
    CIImage *qrImage = colorFilter.outputImage;
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:qrImage fromRect:qrImage.extent];
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
    codeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGImageRelease(cgImage);
    
    return codeImage;
}

#pragma mark - 拨打电话
/**
 拨打电话
 */
- (void)callTel {
    NSString * phone = [[NSString alloc] initWithFormat:@"telprompt://%@",self];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phone]];
    });
}

@end
