//
//  HJHealthRecordsVC.h
//  MilkPo_User
//
//  Created by IMAC on 16/6/4.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "JLBaseViewController.h"
#import "iCarousel.h"

@interface JLVC : JLBaseViewController<iCarouselDataSource,iCarouselDelegate>

@property (nonatomic, strong) iCarousel *carousel;

@property (nonatomic,assign) BOOL wrap;

@end
