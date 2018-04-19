//
//  ZQParseUrlTool.m
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/19.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import "ZQParseUrlTool.h"

@implementation ZQParseUrlTool

/**
 将url链接中后面拼接的参数，转换为字典
 
 @param query url
 @return dic
 */
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
