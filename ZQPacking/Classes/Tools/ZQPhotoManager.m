//
//  ZQPhotoManager.m
//  ZQPacking_Example
//
//  Created by 张奇 on 2018/4/18.
//  Copyright © 2018年 13525505765@163.com. All rights reserved.
//

#import "ZQPhotoManager.h"
#import <MobileCoreServices/MobileCoreServices.h>
//#import <AssetsLibrary/AssetsLibrary.h>
#import<AVFoundation/AVCaptureDevice.h>
#import<AVFoundation/AVMediaFormat.h>

@interface ZQPhotoManager ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, weak) UIViewController *currentVC;
@property (nonatomic, copy) PhotoSelectedCallback photoCallback;

@end

@implementation ZQPhotoManager

+ (instancetype)manager
{
    return [[self alloc]init];
}

- (void)selectPhotoWithTitle:(NSString *)title viewController:(UIViewController *)viewController photoCallback:(PhotoSelectedCallback)photoCallback
{
    self.currentVC = viewController;
    self.photoCallback = photoCallback;
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [self choosePhotoFor:UIImagePickerControllerSourceTypePhotoLibrary];
    }];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *  action) {
        [self choosePhotoFor:UIImagePickerControllerSourceTypeCamera];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertVc addAction:photoAction];
    [alertVc addAction:cameraAction];
    [alertVc addAction:cancelAction];
    [viewController presentViewController:alertVc animated:YES completion:nil];
}

- (void)choosePhotoFor:(UIImagePickerControllerSourceType)sourceType
{
    // 判断有无相机权限
    if (sourceType == UIImagePickerControllerSourceTypeCamera) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusDenied || status == AVAuthorizationStatusRestricted) {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"相机不可用，请打开相机对应用的访问权限" preferredStyle:UIAlertControllerStyleAlert];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
            [self.currentVC presentViewController:alertVC animated:YES completion:nil];
            return;
        }
    }
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.sourceType = sourceType;
    imagePicker.allowsEditing = self.allowsEditing;
    imagePicker.delegate = self;
    [self.currentVC presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = nil;
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:( NSString *)kUTTypeImage]){
        if (self.allowsEditing) {
            image = [info objectForKey:UIImagePickerControllerEditedImage];
        }else{
            image = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
        if (self.photoCallback) {
            self.photoCallback(image);
        }
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
