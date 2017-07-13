//
//  JLHomeAPI.h
//  Jia-li Liu
//
//  Created by KLIANS on 2017/4/26.
//  Copyright © 2017年 KLIANS. All rights reserved.
//

#import "JLBaseAPI.h"

@class Lives,Extra,Label,Creator;

@interface JLHomeAPI : JLBaseAPI

+(instancetype)getHomeList;

@property (nonatomic, assign) NSInteger expire_time;

@property (nonatomic, assign) NSInteger dm_error;

@property (nonatomic, strong) NSArray<Lives *> *lives;

@property (nonatomic, copy) NSString *error_msg;

@end
@interface Lives : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, strong) NSArray *like;

@property (nonatomic, assign) NSInteger online_users;

@property (nonatomic, assign) NSInteger version;

@property (nonatomic, assign) NSInteger rotate;

@property (nonatomic, strong) Extra *extra;

@property (nonatomic, assign) NSInteger multi;

@property (nonatomic, assign) NSInteger link;

@property (nonatomic, copy) NSString *share_addr;

@property (nonatomic, assign) NSInteger slot;

@property (nonatomic, strong) Creator *creator;

@property (nonatomic, assign) NSInteger group;

@property (nonatomic, copy) NSString *city;

@property (nonatomic, copy) NSString *live_type;

@property (nonatomic, copy) NSString *stream_addr;

@property (nonatomic, assign) NSInteger optimal;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger landscape;

@end

@interface Extra : NSObject

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, strong) NSArray<Label *> *label;

@end

@interface Label : NSObject

@property (nonatomic, copy) NSString *tab_key;

@property (nonatomic, copy) NSString *tab_name;

@property (nonatomic, strong) NSArray<NSNumber *> *cl;

@end

@interface Creator : NSObject

@property (nonatomic, assign) NSInteger gender;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger level;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *portrait;

@end

