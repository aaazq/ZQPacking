//
//  NSString+ZQHash.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZQHash)

@property (readonly) NSString *base64String;
@property (readonly) NSString *md5String;
@property (readonly) NSString *sha1String;
@property (readonly) NSString *sha256String;
@property (readonly) NSString *sha512String;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;


//base64加密
+ (NSString*)stringWithBase64FormData:(NSData *)theData;
//base64解密
+ (NSString*)decodeWithBase64String:(NSString*)base64String;
//安全的base64加密
+ (NSString*)stringWithSafeBase64FromData:(NSData*)data;
//安全的base64解密
+ (NSString*)decodeWithSafeBase64String:(NSString*)base64String;
@end
