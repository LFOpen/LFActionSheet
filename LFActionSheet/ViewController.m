//
//  ViewController.m
//  LFActionSheet
//
//  Created by archerLj on 2018/2/27.
//  Copyright © 2018年 com.bocodo.csr. All rights reserved.
//

#import "ViewController.h"
#import "LFActionSheet.h"
#import "LFActionSheetTool.h"

@interface ViewController () <LFActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    LFActionSheet *actionSheet = [[LFActionSheet alloc] initWithMessage:@"选择" cancelTitle:@"取消" otherTitles:@"功能一", @"功能二", @"功能三", @"功能四", nil];
    actionSheet.delegate = self;
    [actionSheet show];
    
//    [[LFActionSheetTool sharedInstance] showChoseImageSheetWithMessage:@"请选择图片" complecation:^(UIImage *selectedImage) {
//        self.imageView.image = selectedImage;
//    }];
    
//    [[LFActionSheetTool sharedInstance] showLogoutSheetWithMessage:@"退出登录后，该账户相关的数据将被清除，确定要退出登录吗？" completion:^{
//        NSLog(@"退出登录了");
//    }];
}

-(void)lfActionSheet:(LFActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%d", buttonIndex);
}

@end
