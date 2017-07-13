//
//  LivesCell.m
//  KLIANSLiveDemo
//
//  Created by KLIANS on 2017/3/24.
//  Copyright © 2017年 KLIAN. All rights reserved.
//

#import "LivesCell.h"

@implementation LivesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _icon.layer.cornerRadius = 25;
    _icon.clipsToBounds = YES;
    
    _tipLabel.layer.cornerRadius = 12.5;
    _tipLabel.layer.borderWidth = 2;
    _tipLabel.layer.borderColor = [UIColor whiteColor].CGColor;
}

-(void)fillLivesCellData:(Lives *)cellModel{
    Creator *creator = cellModel.creator;
    [_icon sd_setImageWithURL:[NSURL URLWithString:creator.portrait] placeholderImage:nil];
    [_ima sd_setImageWithURL:[NSURL URLWithString:creator.portrait] placeholderImage:nil];
    _name.text = creator.nick;
    _num.text = [NSString stringWithFormat:@"%ld",(long)cellModel.online_users];
    _address.text = [NSString stringWithFormat:@"%@",cellModel.city];
}

@end
