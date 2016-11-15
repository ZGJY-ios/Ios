//
//  GZGYAftersalesTableViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/26.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYAftersalesTableViewCell.h"

@implementation GZGYAftersalesTableViewCell
@synthesize orderLabel,numberLabel,dateLabel,lineLabel,orderImg,nameLabel,priceLabel,countLabel,stateLabel,forgoodsBtn;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        orderLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:35])];
        orderLabel.text = @"订单号:";
        [self addSubview:orderLabel];
        numberLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:155], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:250], [GZGApplicationTool control_height:35])];
        numberLabel.text = @"12323123123";
        [self addSubview:numberLabel];
        
        dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-[GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:35])];
        dateLabel.font = [UIFont systemFontOfSize:13];
        dateLabel.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        dateLabel.text = @"2016-10-11";
        [self addSubview:dateLabel];
        lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:90], SCREENWIDTH, 1)];
        lineLabel.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
        [self addSubview:lineLabel];
        orderImg = [[UIImageView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:135], [GZGApplicationTool control_wide:125], [GZGApplicationTool control_height:125])];
        orderImg.image = [UIImage imageNamed:@"sy_kjpic1.jpg"];
        orderImg.layer.cornerRadius = 4;
        orderImg.layer.borderColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0].CGColor;
        orderImg.layer.borderWidth = 1;
        [orderImg.layer setMasksToBounds:YES];
        [self addSubview:orderImg];
        nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:135], [GZGApplicationTool control_wide:560], [GZGApplicationTool control_height:35])];
        nameLabel.text = @"澳洲进口 体内平衡益生菌";
        [self addSubview:nameLabel];
        priceLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:180], [GZGApplicationTool control_wide:130], [GZGApplicationTool control_height:35])];
        priceLabel.textColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        priceLabel.text = @"¥120.00";
        [self addSubview:priceLabel];
        countLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:315], [GZGApplicationTool control_height:180], [GZGApplicationTool control_wide:50], [GZGApplicationTool control_height:35])];
        countLabel.text = @"×1";
        [self addSubview:countLabel];
        stateLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:225], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:35])];
        stateLabel.textColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        stateLabel.text = @"交易已完成";
        [self addSubview:stateLabel];
        forgoodsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        forgoodsBtn.frame = CGRectMake([GZGApplicationTool control_wide:500], [GZGApplicationTool control_height:190], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:70]);
        forgoodsBtn.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
        [forgoodsBtn setTitle:@"申请售后" forState:UIControlStateNormal];
        [forgoodsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        forgoodsBtn.layer.cornerRadius = 5;
        forgoodsBtn.layer.borderColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0].CGColor;
        forgoodsBtn.layer.borderWidth = 1;
        [forgoodsBtn.layer setMasksToBounds:YES];
        [self addSubview:forgoodsBtn];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end