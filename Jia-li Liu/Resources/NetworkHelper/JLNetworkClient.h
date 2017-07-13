//
//  JLNetworkClient.h
//  Jia-li Liu
//
//  Created by KLIANS on 2017/4/26.
//  Copyright © 2017年 KLIANS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JLBaseAPI;

#pragma mark - 网络配置信息

typedef NS_ENUM(NSInteger, NetworkCodeType) {
    /// 失败
    NetworkCodeTypeFail = 0,
    /// 成功
    NetworkCodeTypeSuccess = 1,
    /// 服务繁忙
    NetworkCodeTypeServiceBusy = -1,
    /// Token无效
    NetworkCodeTypeTokenInvalid = 40000,
};

/**
 *  Network客户端
 */
@interface JLNetworkClient : NSObject

/**
 *  @author hejing
 *
 *  服务器返回Json数据映射模型
 */
@property (nonatomic, strong) JLBaseAPI *baseAPI;

/**
 *监听网络
 */
+(void)startMonitoringNetworkReachabilityStatus;

/**
 *  @author hejing
 *
 *  获取NetworkClient实例
 *
 *  @param subUrl     请求对应的url
 *  @param parameters url请求所需的参数
 *  @param JLBaseAPI    返回数据所要映射的API模型
 *
 *  @return NetworkClient实例
 */
+ (instancetype)networkClientWithSubUrl:(NSString *)subUrl parameters:(NSDictionary *)parameters HJBaseAPI:(JLBaseAPI *)JLBaseAPI;

/**
 *  @author hejing
 *
 *  获取NetworkClient实例
 *
 *  @param subUrl     请求对应的url
 *  @param parameters url请求所需的参数
 *  @param files      上传文件
 *  @param JLBaseAPI    返回数据所要映射的API模型
 *
 *  @return NetworkClient实例
 */
+ (instancetype)networkClientWithSubUrl:(NSString *)subUrl parameters:(NSDictionary *)parameters files:(NSArray *)files JLBaseAPI:(JLBaseAPI *)JLBaseAPI;

/**
 *  GET请求
 *  @param containerView     hud显示视图
 *  @param dataHandler       代理
 *  @param isCache           是否缓存
 *
 */
- (void)getRequestInView:(UIView *)containerView networkCodeTypeSuccessDataHandler:(id<JLDataHandlerProtocol>)dataHandler isCache:(BOOL)isCache;

@end

