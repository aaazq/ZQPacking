//
//  UIImage+ZQHelper.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZQHelper)

-(NSString *)base64Str;


/**
 压缩图片至指定大小

 @param image 原图片
 @param newSize 指定大小
 @return 压缩后的图片
 */
+ (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;


/**
 整体拉伸图片

 @param name 原图片
 @return 拉伸后的图片
 */
+ (UIImage *)stretchImageWithName:(NSString *)name;





@end
