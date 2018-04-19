//
//  ZQDeviceTool.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>
//运营商类型
typedef NS_ENUM(NSInteger,CarrierType) {
    CarrierType_ChinaMobile = 1,//中国移动
    CarrierType_ChinaUnicom = 2,//中国联通
    CarrierType_ChinaTelecom = 3,//中国电信
    CarrierType_Other = 4,
};
@interface ZQDeviceTool : NSObject

/**
 *  获取Bundle Id
 */
+(NSString *)getBundleId;

/**
 *  获取app版本
 */
+(NSString *)getCurrentAppVersion;

/**
 *  获取设备型号
 */
+(NSString *)getDeviceFullModelName;

/**
 *  获取设备系统版本号
 */
+(NSString *)getDeviceSystemVersion;

/**
 *  获取当前运营商
 */
+(CarrierType) getCarrierName;

/**
 * 获取广告标识符
 */
+(NSString *) getIdfa;

/**
 * 获取导航条高度
 */
+(CGFloat)getNavigationHeight;

/**
 * 获取底部tabbar高度
 */
+(CGFloat)getTabbarHeight;



@end
