//
//  JLTabBar.h
//  KLIANS
//
//  Created by KLIANS  bo on 16/5/28.
//  Copyright © 2016年 KLIANS  bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JLTabBar;

@protocol JLTabBarDelegate <NSObject>
@optional
- (void)tabBarPlusBtnClick:(JLTabBar *)tabBar;
@end


@interface JLTabBar : UITabBar

/** tabbar的代理 */
@property (nonatomic, weak) id<JLTabBarDelegate> myDelegate ;

@end
