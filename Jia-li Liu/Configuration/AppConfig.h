//
//  AppConfig.h
//  Jia-li Liu
//
//  Created by KLIANS on 2017/3/29.
//  Copyright © 2017年 KLIANS. All rights reserved.
//

#ifndef AppConfig_h
#define AppConfig_h


#endif /* AppConfig_h */

//公用Block
typedef void(^voidBlock)();
typedef void(^idBlock)(id obj);
typedef void(^stringBlock)(NSString *result);
typedef void(^stringBlock2)(NSString *result,NSString *description);
typedef void(^boolBlock)(BOOL boolen);
typedef void(^errorBlock)(NSError *error);
typedef void(^numberBlock)(NSNumber *result);
typedef void(^arrayWithErrorBlock)(NSArray *results,NSError *error);
typedef void(^arrayAndDescription)(NSArray *results,NSString *description);
typedef void(^arrayBlock)(NSArray *results);
typedef void(^successBlock)(id resultObj);

//通用颜色
#define kBlackColor         [UIColor blackColor]
#define kDarkGrayColor      [UIColor darkGrayColor]
#define kLightGrayColor     [UIColor lightGrayColor]
#define kWhiteColor         [UIColor whiteColor]
#define kGrayColor          [UIColor grayColor]
#define kRedColor           [UIColor redColor]
#define kGreenColor         [UIColor greenColor]
#define kBlueColor          [UIColor blueColor]
#define kCyanColor          [UIColor cyanColor]
#define kYellowColor        [UIColor yellowColor]
#define kMagentaColor       [UIColor magentaColor]
#define kOrangeColor        [UIColor orangeColor]
#define kPurpleColor        [UIColor purpleColor]
#define kClearColor         [UIColor clearColor]

// 手机系统版本
#define JLSTEM_VERSION [[UIDevice currentDevice] systemVersion]

// 当前屏幕宽
#define ScreenWidth   ([UIScreen mainScreen].bounds.size.width)

// 当前屏幕高
#define ScreenHeight  ([UIScreen mainScreen].bounds.size.height)

//APP导航栏字体颜色
#define AppNavTitleColor  kBlackColor

//APP主题颜色
#define AppColor  [UIColor colorWithHexString:[AppConfig new].appColor]

//APP导航栏背景颜色
#define AppNavBarColor  [UIColor colorWithRed:250/255.0 green:227/255.0 blue:111/255.0 alpha:1.0]

//APP导航栏返回按钮图片
#define kDefaultBackImageName @"backImage"

//自定义颜色
#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(1)];
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)];
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//keyWindow实例化
#define kWindow [UIApplication sharedApplication].keyWindow

//NSUserDefaults 实例化
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

//重定义打印方法
#ifdef DEBUG
#define CLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define CLog(format, ...)
#endif

//设置（方正黑体简体字体）字体大小
#define FONT(F)  [UIFont systemFontOfSize:F]
//[UIFont fontWithName:@"FZHTJW--GB1-0" size:F]

//获取图片资源
#define JLGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

//获取一段时间间隔
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime  NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)

//弱引用/强引用
#define JLWeakSelf(type)  __weak typeof(type) weak##type = type;
#define JLStrongSelf(type)  __strong typeof(type) type = weak##type;

/**
 获取当前语言
 */
#define LRCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

/**
 设置 view 圆角和边框
 */
#define JLViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

/**
 由角度转换弧度 由弧度转换角度
 */
#define JLDegreesToRadian(x) (M_PI * (x) / 180.0)
#define JLRadianToDegrees(radian) (radian*180.0)/(M_PI)


/**
 使用 ARC 和 MRC
 */
#if __has_feature(objc_arc)
// ARC
#else
// MRC
#endif


/**
 判断是真机还是模拟器
 */
// 判断是不是iOS系统，如果是iOS系统在真机和模拟器输出都是YES
#if TARGET_OS_IPHONE
#endif
#if (TARGET_IPHONE_SIMULATOR)
// 在模拟器的情况下
#else
// 在真机情况下
#endif


/**
 沙盒目录文件
 */
//获取temp
#define kPathTemp NSTemporaryDirectory()

//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]


/**
 GCD 的宏定义
 */
//GCD - 一次性执行
#define kDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
//GCD - 在Main线程上运行
#define kDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//GCD - 开启异步线程
#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);







