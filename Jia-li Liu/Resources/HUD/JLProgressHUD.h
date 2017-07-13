//
//  JLProgressHUD.h
//  Jia-li Liu
//
//  Created by KLIANS on 2017/5/8.
//  Copyright © 2017年 KLIANS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>

typedef enum{
    JLProgressModeOnlyText=10,           //文字
    JLProgressModeLoading,               //加载菊花
    JLProgressModeCircleLoading,         //加载圆形
    JLProgressModeSuccess,               //成功
    JLProgressModeCusGif                 //自定义Gif
    
}JLProgressMode;


@interface JLProgressHUD : NSObject
/*===============================   属性   ================================================*/

@property (nonatomic,strong) MBProgressHUD  *hud;//提示HUd

@property (nonatomic,strong) MBProgressHUD  *netWorkHUD;//网络状态提示HUd

/*===============================   方法   ================================================*/
+(instancetype)shareinstance;

//网络提醒，没网一直显示在最顶层
+(void)showKwindowNoNetWorkHUD:(NSString *)msg;

//网络提醒隐藏
+(void)netWorkHudHide;

//显示
+(void)show:(NSString *)msg inView:(UIView *)view mode:(JLProgressMode *)myMode;

//隐藏
+(void)hide;

//自定义动画
+(void)showCusGif:(NSString *)msg inView:(UIView *)view;

//只显示文字
+(void)showOnlyText:(NSString *)msg inView:(UIView *)view;

//显示进度
+(void)showProgress:(NSString *)msg inView:(UIView *)view;

//显示成功提示
+(void)showSuccess:(NSString *)msg inview:(UIView *)view;

//显示提示（1秒后消失）
+(void)showMessage:(NSString *)msg inView:(UIView *)view;

//显示提示（N秒后消失）
+(void)showMessage:(NSString *)msg inView:(UIView *)view afterDelayTime:(NSInteger)delay;

//在最上层显示
+(void)showMsgWithoutView:(NSString *)msg;

@end
