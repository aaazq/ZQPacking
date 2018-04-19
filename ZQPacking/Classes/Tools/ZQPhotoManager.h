//
//  ZQPhotoManager.h
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PhotoSelectedCallback)(UIImage *selectedImage);

@interface ZQPhotoManager : NSObject

@property (nonatomic, assign) BOOL allowsEditing;

+ (instancetype)manager;

- (void)selectPhotoWithTitle:(NSString *)title viewController:(UIViewController *)viewController photoCallback:(PhotoSelectedCallback)photoCallback;

@end
