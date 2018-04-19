//
//  ZQSendMsgCodeTool.m
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import "ZQSendMsgCodeTool.h"

@interface ZQSendMsgCodeTool ()
{
    NSInteger _timerNo;
    NSTimer *_timer;
    NSTimeInterval _timeInterVel;
    NSString *_endShowTitle;
    UIButton *_sender;
    complemention _finish;
}
@end

@implementation ZQSendMsgCodeTool

+ (instancetype)shareTool
{
    return [[self alloc]init];
}

- (void)startSendMsgWithSender:(UIButton *)sender
                  endShowTitle:(NSString *)endShowTitle
                   timeIntevel:(NSTimeInterval)timeInterVel
                 complemention:(complemention)complemention{
    _timerNo = timeInterVel;
    _timeInterVel = timeInterVel;
    _sender = sender;
    _endShowTitle = endShowTitle;
    _finish = complemention;
    sender.enabled = NO;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

//定时器
- (void)timerAction:(NSTimer *)timer
{
    _timerNo--;
    [_sender setTitle:[NSString stringWithFormat:@"(%zd)",_timerNo] forState:UIControlStateDisabled];
    if (_timerNo == 0) {
        _timerNo = _timeInterVel;
        [timer invalidate];
        _sender.enabled = YES;
        [_sender setTitle:_endShowTitle forState:UIControlStateNormal];
        if (_finish) {
            _finish();
        }
    }
}

@end
