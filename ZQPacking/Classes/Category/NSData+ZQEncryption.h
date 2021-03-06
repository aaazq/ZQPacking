//
//  NSData+ZQEncryption.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ZQEncryption)

- (NSData *)AES256EncryptWithKey:(NSString *)key;   //加密
- (NSData *)AES256DecryptWithKey:(NSString *)key;   //解密

+ (NSData*)stringToByte:(NSString*)string;

+ (NSString*)byteToString:(NSData*)data;

@end
