//
//  UIImage+ZQHelper.m
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import "UIImage+ZQHelper.h"

static CGFloat const kImageWidth = 750;
@implementation UIImage (ZQHelper)

-(NSString *)base64Str
{
    CGSize imageSize = self.size;
    CGFloat imageW = kImageWidth;
    CGFloat imageH = imageW * imageSize.height / imageSize.width;
    UIImage *newImage = [UIImage imageWithImageSimple:self scaledToSize:CGSizeMake(imageW, imageH)];
    NSData *data = UIImageJPEGRepresentation(newImage, 0.8f);
    //    NSData *data = UIImagePNGRepresentation(self);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}

/**
 压缩图片至指定大小
 
 @param image 原图片
 @param newSize 指定大小
 @return 压缩后的图片
 */
+ (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}




@end
