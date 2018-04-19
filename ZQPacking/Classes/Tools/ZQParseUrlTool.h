//
//  ZQParseUrlTool.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/19.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZQParseUrlTool : NSObject


/**
 将url链接中后面拼接的参数，转换为字典

 @param query url
 @return dic
 */
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;


@end
