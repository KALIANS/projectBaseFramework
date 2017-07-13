//
//  JLNetworkClient.m
//  Jia-li Liu
//
//  Created by KLIANS on 2017/4/26.
//  Copyright © 2017年 KLIANS. All rights reserved.
//

#import "JLNetworkClient.h"
#import "JLBaseAPI.h"

@interface JLNetworkClient ()

/// 请求子网址
@property (nonatomic, copy) NSString *subUrl;

/// 请求参数
@property (nonatomic, strong) NSDictionary *parameters;

/// 容器，HUD父视图
@property (strong, nonatomic) UIView *containerView;

@property (nonatomic, strong) NSArray *files;

@end

@implementation JLNetworkClient


+(void)startMonitoringNetworkReachabilityStatus{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变时调用
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                CLog(@"未知网络");
                [JLProgressHUD showKwindowNoNetWorkHUD:@"未知网络"];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                CLog(@"没有网络");
                [JLProgressHUD showKwindowNoNetWorkHUD:@"网络连接有问题，请检查网络！"];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                CLog(@"手机自带网络");
                [JLProgressHUD netWorkHudHide];
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                CLog(@"WIFI");
                [JLProgressHUD netWorkHudHide];
                break;
        }
    }];
    //开始监控
    [manager startMonitoring];
}

#pragma mark - 获取NetworkClient实例 -
+ (instancetype)networkClientWithSubUrl:(NSString *)subUrl parameters:(NSDictionary *)parameters HJBaseAPI:(JLBaseAPI *)JLBaseAPI {
    
    return [self networkClientWithSubUrl:subUrl parameters:parameters files:nil JLBaseAPI:JLBaseAPI];
}

+ (instancetype)networkClientWithSubUrl:(NSString *)subUrl parameters:(NSDictionary *)parameters files:(NSArray *)files JLBaseAPI:(JLBaseAPI *)JLBaseAPI {
    
    JLNetworkClient *client = [JLNetworkClient new];
    client.subUrl = subUrl;
    client.parameters = parameters;
    client.files = files;
    client.baseAPI = JLBaseAPI;
    
    return client;
}

#pragma mark - 请求完成 且根据协议字段判断请求状态 -
//判断状态并且Block到控制器页面
- (void)requestSucces:(id)responseObject successJCDataHandler:(id<JLDataHandlerProtocol>)dataHandler {
    JLBaseAPI *bAPIModel = [self dealWhileSuccess:responseObject];

//    if (!bAPIModel || bAPIModel.code != NetworkCodeTypeSuccess) {
//        return;
//    }
    
    if (dataHandler && [dataHandler respondsToSelector:@selector(netWorkCodeSuccessDealWithResponseObject:)]) {
        
        [dataHandler netWorkCodeSuccessDealWithResponseObject:bAPIModel];
    }
}


/**
 *  判断数据请求完成状态
 *
 *  @return 请求完成后block
 */
- (JLBaseAPI *)dealWhileSuccess:(id)responseObject {
    //json转模型
    JLBaseAPI *bAPIModel = [self.baseAPI.class mj_objectWithKeyValues:responseObject];
    
    NSInteger code = bAPIModel.code;
    
    NSString *msg = bAPIModel.msg;
    
    //返回数据不存在，显示服务器错误
    if (!responseObject) {
        CLog(@"返回数据nil");
    }
    
    else if (code == NetworkCodeTypeTokenInvalid) {
        // token过期，直接退出
        CLog(@"token过期");
        
        return nil;
    }
    else if (code != NetworkCodeTypeSuccess) {
        
        //返回code不为成功是否显示返回msg信息
        CLog(@"请求失败");
    }
    else {
        // 成功获取数据后，去掉HUD
        CLog(@"去掉HUD");
    }
    
    return bAPIModel;
}



#pragma mark - GET请求 -
- (void)getRequestInView:(UIView *)containerView networkCodeTypeSuccessDataHandler:(id<JLDataHandlerProtocol>)dataHandler isCache:(BOOL)isCache{
    if (isCache) {
        //缓存
        [PPNetworkHelper GET:self.subUrl parameters:self.parameters responseCache:^(id responseCache) {
            CLog(@"获取到缓存");
            
            JLBaseAPI *bAPIModel = [self.baseAPI.class mj_objectWithKeyValues:responseCache];
            if (dataHandler && [dataHandler respondsToSelector:@selector(netWorkCodeCacheWithResponseObject:)]) {
                [dataHandler netWorkCodeCacheWithResponseObject:bAPIModel];
            }
            
        } success:^(id responseObject) {
            NSLog(@"klians==%@",responseObject);
            
            [self requestSucces:responseObject successJCDataHandler:dataHandler];
            
        } failure:^(NSError *error) {
            if (dataHandler && [dataHandler respondsToSelector:@selector(netWorkCodeFailureDealWithResponseObject:)]) {
                [dataHandler netWorkCodeFailureDealWithResponseObject:error];
            }
        }];
    }else{
        //不缓存
        [PPNetworkHelper GET:self.subUrl parameters:self.parameters success:^(id responseObject) {
            
            [self requestSucces:responseObject successJCDataHandler:dataHandler];
            
        } failure:^(NSError *error) {
            if (dataHandler && [dataHandler respondsToSelector:@selector(netWorkCodeFailureDealWithResponseObject:)]) {
                [dataHandler netWorkCodeFailureDealWithResponseObject:error];
            }
        }];
    }
}

@end



