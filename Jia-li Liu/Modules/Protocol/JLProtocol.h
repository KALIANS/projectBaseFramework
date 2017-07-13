//
//  HJBaseAPIProtocol.h
//  KLIANS
//
//  Created by KLIANS on 16/2/23.
//  Copyright (c) 2016年 KLIANS. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * 网络请求回调协议
 */
@protocol JLDataHandlerProtocol <NSObject>

@optional
//请求成功
- (void)netWorkCodeSuccessDealWithResponseObject:(id)responseObject;
//请求失败
- (void)netWorkCodeFailureDealWithResponseObject:(id)responseObject;
//缓存的数据
- (void)netWorkCodeCacheWithResponseObject:(id)responseObject;

@end
