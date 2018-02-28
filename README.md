# LFActionSheet
自定义微信样式ActionSheet <br />

 ![image](https://github.com/LFOpen/LFActionSheet/raw/master/pics/pic1.png)
 ![image](https://github.com/LFOpen/LFActionSheet/raw/master/pics/pic2.png)
 ![image](https://github.com/LFOpen/LFActionSheet/raw/master/pics/pic3.png)

# Cocoapods 集成
因为要使用私有库，所以需要同时指定私有库和Cocoapod公有库的地址
```
source 'https://github.com/LFOpen/LFOpen.git'
source 'https://github.com/CocoaPods/Specs.git'

target 'XXXX' do
  pod 'LFActionSheet'
end
```

# 使用方法

#### 1. 普通ActionSheet
先 #import <LFActionSheet.h>
```
    LFActionSheet *actionSheet = [[LFActionSheet alloc] initWithMessage:@"请选择地图类型" cancelTitle:@"取消" otherTitles:@"谷歌地图", @"百度地图", @"高德地图", nil];
    actionSheet.delegate = self;
    [actionSheet show];
```

在代理方法中去判断点击按钮的下标即可

 ```
 -(void)lfActionSheet:(LFActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%ld", (long)buttonIndex);
}
 ```
 
 #### 2. 封装好的两个ActionSheet
 先 #import <LFActionSheetTool.h>
 
 1. 退出登录用ActionSheet
 ```
     [[LFActionSheetTool sharedInstance] showLogoutSheetWithMessage:@"确定要退出登录吗?" completion:^{
        NSLog(@"退出登录");
    }];
 ```
 
 2. 选择照片用ActionSheet
 ```
     [[LFActionSheetTool sharedInstance] showChoseImageSheetWithMessage:@"请选择照片" complecation:^(UIImage *selectedImage) {
        NSLog(@"%@", selectedImage);
    }];
 ```
