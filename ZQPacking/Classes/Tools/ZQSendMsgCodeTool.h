//
//  ZQSendMsgCodeTool.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^complemention)();
@interface ZQSendMsgCodeTool : NSObject

+ (instancetype)shareTool;

/**
 @param sender 发送验证码的按钮
 @param endShowTitle 倒计时结束时按钮显示文字
 @param timeInterVel 倒计时长
 @param complemention 倒计时结束后回调
 */
- (void)startSendMsgWithSender:(UIButton *)sender
                  endShowTitle:(NSString *)endShowTitle
                   timeIntevel:(NSTimeInterval)timeInterVel
                 complemention:(complemention)complemention;

@end
