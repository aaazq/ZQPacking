//
//  NSString+ZQCharacters.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZQCharacters)

//讲汉字转换为拼音
- (NSString *)pinyinOfName;

//汉字转换为拼音后，返回大写的首字母
- (NSString *)uppercasePinYinFirstLetter;

//根据文字大小返回指定宽度下的文字高度
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)sizeWithFont:(UIFont *)font;


@end
