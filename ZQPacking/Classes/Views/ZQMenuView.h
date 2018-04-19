//
//  ZQMenuView.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZQMenuViewDelegate <NSObject>

- (void)clickMenuWithIndex:(NSInteger)index;

@end

@interface ZQMenuView : UIScrollView

- (instancetype)initWithFrame:(CGRect)frame
                    dataArray:(NSArray*)dataArray
                     delegate:(id<ZQMenuViewDelegate>)delegate;

@property (nonatomic, strong) NSArray *dataArray;

- (void)commonMenuViewSetIndex:(NSInteger)selectIndex isAnimate:(BOOL)isAnimate;

@end
