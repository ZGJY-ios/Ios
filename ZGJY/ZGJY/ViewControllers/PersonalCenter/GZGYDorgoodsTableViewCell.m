//
//  GZGYDorgoodsTableViewCell.m
//  ZGJY
//
//  Created by YYS on 16/10/24.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYDorgoodsTableViewCell.h"

@implementation GZGYDorgoodsTableViewCell
@synthesize orderLabel,numberLabel,dateLabel,lineLabel,orderImg,nameLabel,priceLabel,countLabel,stateLabel,dividerLabel,forgoodsBtn;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        orderLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:25], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:120], [GZGApplicationTool control_height:35])];
        orderLabel.text = @"订单号:";
        [self addSubview:orderLabel];
        numberLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:155], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:250], [GZGApplicationTool control_height:35])];
        numberLabel.text = @"12323123123";
        [self addSubview:numberLabel];
        dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-[GZGApplicationTool control_wide:170], [GZGApplicationTool control_height:35], [GZGApplicationTool control_wide:150], [GZGApplicationTool control_height:35])];
        dateLabel.font = [UIFont systemFontOfSize:[GZGApplicationTool control_height:26]];
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
        dividerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [GZGApplicationTool control_height:295], SCREENWIDTH, 1)];
        dividerLabel.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
        [self addSubview:dividerLabel];
        forgoodsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        forgoodsBtn.frame = CGRectMake([GZGApplicationTool control_wide:500], [GZGApplicationTool control_height:315], [GZGApplicationTool control_wide:200], [GZGApplicationTool control_height:70]);
        forgoodsBtn.backgroundColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        [forgoodsBtn setTitle:@"确认收货" forState:UIControlStateNormal];
        [forgoodsBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        forgoodsBtn.layer.cornerRadius = 5;
        forgoodsBtn.layer.borderColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0].CGColor;
        forgoodsBtn.layer.borderWidth = 1;
        [forgoodsBtn.layer setMasksToBounds:YES];
        [self addSubview:forgoodsBtn];
    }
    return self;
}
-(void)setModel:(GZGYOrderModel *)model
{
    _model = model;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString * urlString = [model.thumbnail stringByReplacingOccurrencesOfString:@"localhost" withString:@"192.168.0.110"];
        
        [orderImg setHeader:urlString];
    });
    numberLabel.text = [NSString stringWithFormat:@"%@",_model.sn];
    dateLabel.text = [NSString stringWithFormat:@"%@",_model.creation_date];
    nameLabel.text = [NSString stringWithFormat:@"%@",_model.name];
    priceLabel.text = [NSString stringWithFormat:@"%@",_model.price];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
