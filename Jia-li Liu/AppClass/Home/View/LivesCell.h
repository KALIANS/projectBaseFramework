//
//  LivesCell.h
//  KLIANSLiveDemo
//
//  Created by KLIANS on 2017/3/24.
//  Copyright © 2017年 KLIAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LivesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *num;
@property (weak, nonatomic) IBOutlet UIImageView *ima;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

-(void)fillLivesCellData:(Lives *)cellModel;


@end
