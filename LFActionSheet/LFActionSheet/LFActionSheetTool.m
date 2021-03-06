//
//  LFActionSheetTool.m
//  bluetooth
//
//  Created by archerLj on 16/7/19.
//  Copyright © 2016年 bocodo.zoubudiu. All rights reserved.
//

#import "LFActionSheetTool.h"
#import "LFActionSheet.h"
#import <AVFoundation/AVFoundation.h>

@interface LFActionSheetTool() <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (strong, nonatomic) SelectImageAction selectImageAction;
@end

@implementation LFActionSheetTool
+(instancetype)sharedInstance {
    static LFActionSheetTool *sheetTool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sheetTool = [[LFActionSheetTool alloc] init];
    });
    return sheetTool;
}

-(void)showLogoutSheetWithMessage:(NSString *)message completion:(LogoutAction)action {
    LFActionSheet *sheet = [[LFActionSheet alloc] initWithMessage:message cancelTitle:@"取消" otherTitles:@"退出登录",nil];
    [sheet setTitleColor:[UIColor redColor] forOtherTitleIndex:0];
    [sheet showWithCompletion:^(NSInteger buttonIndex) {
        if (buttonIndex == 1) {
            if (action) {
                action();
            }
        }
    }];
}

-(void)showChoseImageSheetWithMessage:(NSString *)message complecation:(SelectImageAction)complecation {
    
    self.selectImageAction = complecation;
    LFActionSheet *actionSheet = [[LFActionSheet alloc] initWithMessage:message cancelTitle:@"取消" otherTitles:@"拍照", @"从相册选择", nil];
    [actionSheet showWithCompletion:^(NSInteger buttonIndex) {
        switch (buttonIndex) {
            case 1: {
                [self takePicture];
            }
                break;
            case 2: {
                [self choosePictureFromAlbum];
            }
                break;
            default:
                break;
        }
    }];
}

- (void)takePicture {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusDenied || authStatus == AVAuthorizationStatusRestricted) {
        self.selectImageAction(nil, YES);
        return;
    }
    
    UIViewController *currentVC = [self currentViewController];
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    [currentVC presentViewController:imagePicker animated:YES completion:nil];
}

- (void)choosePictureFromAlbum {
    UIViewController *currentVC = [self currentViewController];
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    [currentVC presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = info[UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.selectImageAction(image, NO);
}

- (UIViewController *)currentViewController {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIViewController *vc = keyWindow.rootViewController;
    while (vc.presentedViewController) {
        vc = vc.presentedViewController;
        
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = [(UINavigationController *)vc visibleViewController];
        } else if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = [(UITabBarController *)vc selectedViewController];
        }
    }
    return vc;
}
@end
