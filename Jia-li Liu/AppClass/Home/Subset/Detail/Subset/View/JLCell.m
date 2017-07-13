//
//  JLCell.m
//  Jia-li Liu
//
//  Created by KLIANS on 2017/5/12.
//  Copyright © 2017年 KLIANS. All rights reserved.
//

#import "JLCell.h"

@interface JLCell()
/**
 *  头像
 */
@property(nonatomic,strong)UIImageView *icon;
/**
*  昵称
*/
@property (nonatomic, weak) UILabel *nameLabel;
/**
 *  时间
 */
@property (nonatomic, weak) UILabel *timeLabel;
/**
*  正文
*/
@property (nonatomic, weak) UILabel *introLabel;

@end

@implementation JLCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *str = @"JLCell";
    JLCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[JLCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:str];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *icon = [[UIImageView alloc]init];
        icon.backgroundColor = RGB(51, 210, 188);
        [self.contentView addSubview:icon];
        icon.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,10).widthIs(40).heightIs(40);
        self.icon = icon;
        
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.textColor = kBlackColor;
        nameLabel.font = FONT(14);
        nameLabel.text = @"🐒派来的逗比";
        [self.contentView addSubview:nameLabel];
        nameLabel.sd_layout.leftSpaceToView(icon,10).rightSpaceToView(self.contentView,10).topSpaceToView(self.contentView,10).heightIs(25);
        self.nameLabel = nameLabel;
        
        UILabel *timeLabel = [[UILabel alloc]init];
        timeLabel.textColor = kGrayColor;
        timeLabel.font = FONT(12);
        timeLabel.text = @"2017/05/05 17:59";
        [self.contentView addSubview:timeLabel];
        timeLabel.sd_layout.leftSpaceToView(icon,10).rightSpaceToView(self.contentView,10).topSpaceToView(nameLabel,0).heightIs(12);
        self.timeLabel = timeLabel;
        
        UILabel *introLabel = [[UILabel alloc]init];
        introLabel.textColor = kGrayColor;
        introLabel.font = FONT(12);
        introLabel.numberOfLines = 0;
        introLabel.text = @"浙师大是金华市唯一一所大学，这个地位在金华人民心中不会比浙大在杭州人民心中差，独子嘛，总是要优待一点，首先从面积上体现出来——浙师大有3000多亩地！还有很多储备地没有造过，而且从金华建校到现在没有拆过。所以，这是浙江唯一一所历史气息浓厚的超大面积大学。";
        [self.contentView addSubview:introLabel];
        introLabel.sd_layout.leftSpaceToView(self.contentView,10).rightSpaceToView(self.contentView,10).topSpaceToView(icon,5).bottomSpaceToView(self.contentView,10);
        self.introLabel = introLabel;
    
    }
    return self;
}

@end
