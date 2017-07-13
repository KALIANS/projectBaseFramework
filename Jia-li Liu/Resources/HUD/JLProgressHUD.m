//
//  JLProgressHUD.m
//  Jia-li Liu
//
//  Created by KLIANS on 2017/5/8.
//  Copyright © 2017年 KLIANS. All rights reserved.
//

#import "JLProgressHUD.h"
#import <YYImage/YYImage.h>

@implementation JLProgressHUD

+(instancetype)shareinstance{
    
    static JLProgressHUD *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JLProgressHUD alloc] init];
    });
    
    return instance;
    
}

+(void)showKwindowNoNetWorkHUD:(NSString *)msg{
    if ([JLProgressHUD shareinstance].netWorkHUD != nil) {
        [[JLProgressHUD shareinstance].netWorkHUD hideAnimated:YES];
        [JLProgressHUD shareinstance].netWorkHUD = nil;
    }
    [JLProgressHUD shareinstance].netWorkHUD = [MBProgressHUD showHUDAddedTo:kWindow animated:YES];
    [JLProgressHUD shareinstance].netWorkHUD.center = CGPointMake(ScreenWidth/2, ScreenHeight*0.8);
    [JLProgressHUD shareinstance].netWorkHUD.bezelView.color = [UIColor blackColor];
    [[JLProgressHUD shareinstance].netWorkHUD setMargin:10];
    [[JLProgressHUD shareinstance].netWorkHUD setRemoveFromSuperViewOnHide:YES];
    [JLProgressHUD shareinstance].netWorkHUD.detailsLabel.text = msg;
    [JLProgressHUD shareinstance].netWorkHUD.contentColor = [UIColor whiteColor];
    [JLProgressHUD shareinstance].netWorkHUD.detailsLabel.font = [UIFont systemFontOfSize:14];
    [JLProgressHUD shareinstance].netWorkHUD.mode = MBProgressHUDModeText;
    [JLProgressHUD shareinstance].netWorkHUD.userInteractionEnabled = NO;
}

+(void)netWorkHudHide{
    if ([JLProgressHUD shareinstance].netWorkHUD != nil) {
        [[JLProgressHUD shareinstance].netWorkHUD hideAnimated:YES];
    }
}

+(void)show:(NSString *)msg inView:(UIView *)view mode:(JLProgressMode *)myMode{
    //如果已有弹框，先消失
    if ([JLProgressHUD shareinstance].hud != nil) {
        [[JLProgressHUD shareinstance].hud hideAnimated:YES];
        [JLProgressHUD shareinstance].hud = nil;
    }
    
    //4\4s屏幕避免键盘存在时遮挡
    if ([UIScreen mainScreen].bounds.size.height == 480) {
        [view endEditing:YES];
    }
    
    [JLProgressHUD shareinstance].hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //[YJProgressHUD shareinstance].hud.dimBackground = YES;    //是否显示透明背景
    [JLProgressHUD shareinstance].hud.bezelView.color = [UIColor blackColor];
    [[JLProgressHUD shareinstance].hud setMargin:10];
    [[JLProgressHUD shareinstance].hud setRemoveFromSuperViewOnHide:YES];
    [JLProgressHUD shareinstance].hud.detailsLabel.text = msg;
    [JLProgressHUD shareinstance].hud.contentColor = [UIColor whiteColor];
    [JLProgressHUD shareinstance].hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    switch ((NSInteger)myMode) {
        case JLProgressModeOnlyText:
            [JLProgressHUD shareinstance].hud.mode = MBProgressHUDModeText;
            break;
            
        case JLProgressModeLoading:
            [JLProgressHUD shareinstance].hud.mode = MBProgressHUDModeIndeterminate;
            break;
            
        case JLProgressModeCircleLoading:
            [JLProgressHUD shareinstance].hud.mode = MBProgressHUDModeDeterminate;
            break;
            
        case JLProgressModeSuccess:
            [JLProgressHUD shareinstance].hud.mode = MBProgressHUDModeCustomView;
            [JLProgressHUD shareinstance].hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
            break;
            
        case JLProgressModeCusGif:{
            [JLProgressHUD shareinstance].hud.mode = MBProgressHUDModeCustomView;
            YYImage *image = [YYImage imageNamed:@"Niu.gif"];
            YYAnimatedImageView *gifImageView = [[YYAnimatedImageView alloc] initWithImage:image];
            [JLProgressHUD shareinstance].hud.customView = gifImageView;
            [JLProgressHUD shareinstance].hud.contentColor = [UIColor redColor];
            [JLProgressHUD shareinstance].hud.bezelView.color = [UIColor clearColor];
        }
            break;
            
        default:
            break;
    }
    
}


+(void)hide{
    if ([JLProgressHUD shareinstance].hud != nil) {
        [[JLProgressHUD shareinstance].hud hideAnimated:YES];
    }
}


+(void)showCusGif:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:(JLProgressMode *)JLProgressModeCusGif];
}

+(void)showMessage:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:(JLProgressMode *)JLProgressModeOnlyText];
    [[JLProgressHUD shareinstance].hud hideAnimated:YES afterDelay:1.0];
}


+(void)showOnlyText:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:(JLProgressMode *)JLProgressModeOnlyText];
}

+(void)showMessage:(NSString *)msg inView:(UIView *)view afterDelayTime:(NSInteger)delay{
    [self show:msg inView:view mode:(JLProgressMode *)JLProgressModeOnlyText];
    [[JLProgressHUD shareinstance].hud hideAnimated:YES afterDelay:delay];
}

+(void)showSuccess:(NSString *)msg inview:(UIView *)view{
    [self show:msg inView:view mode:(JLProgressMode *)JLProgressModeSuccess];
    [[JLProgressHUD shareinstance].hud hideAnimated:YES afterDelay:1.0];
    
}


+(void)showProgress:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:(JLProgressMode *)JLProgressModeLoading];
}

+(void)showMsgWithoutView:(NSString *)msg{
    UIWindow *view = [[UIApplication sharedApplication].windows lastObject];
    [self show:msg inView:view mode:(JLProgressMode *)JLProgressModeOnlyText];
    [[JLProgressHUD shareinstance].hud hideAnimated:YES afterDelay:1.0];
    
}

@end
