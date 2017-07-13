//
//  AppDelegate+JL.m
//  Jia-li Liu
//
//  Created by KLIANS on 2017/5/8.
//  Copyright © 2017年 KLIANS. All rights reserved.
//

#import "AppDelegate+JL.h"

@implementation AppDelegate (JL)


#pragma mark - 判断App是否首次打开 -
-(void)isAppFirstClose{
    BOOL isFirstLogin = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isFirstLogin"] boolValue];
    if (!isFirstLogin) {
        //是第一次
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"isFirstLogin"];
        
        //视频引导页
        //        self.window.rootViewController = [[JLMovieController alloc]init];
        
        //静态图引导页
        JLTabBarController *tabBarVc = [[JLTabBarController alloc] init];
        NSArray *mArray = @[@"1.png",@"2.png",@"3.png"];
        JLNewFetureController *vc = [[JLNewFetureController alloc]initWithNSArray:[mArray copy] withButtonSize:CGSizeMake(ScreenWidth-160, 50) withButtonTitle:@"立即体验" withButtonImage:nil withButtonTitleColor:kWhiteColor withButtonHeight:0.85 withViewController:tabBarVc];
        self.window.rootViewController = vc;
    }else{
        //不是首次启动
        JLTabBarController *tabBarVc = [[JLTabBarController alloc] init];
        self.window.rootViewController = tabBarVc;
    }
}


@end
