//
//  GZGYRegisteredView.m
//  ZGJY
//
//  Created by YYS on 16/11/11.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import "GZGYRegisteredView.h"

@implementation GZGYRegisteredView
@synthesize backBtn,titleLabel,backView,codeLabel,phoneField,codeField,codeBtn,passField,onceField,completeBtn;
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
        backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake([GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:40], [GZGApplicationTool control_wide:[GZGApplicationTool control_wide:50]], [GZGApplicationTool control_height:40]);
        [backBtn setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(Back:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backBtn];
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:175], [GZGApplicationTool control_height:40], [GZGApplicationTool control_wide:400], [GZGApplicationTool control_height:40])];
        titleLabel.text = @"手机快速注册";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [self addSubview:titleLabel];
        NSMutableArray * viewArray = [NSMutableArray arrayWithCapacity:1];
        for (int i = 0; i<4; i++) {
            backView = [[UIView alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:20], [GZGApplicationTool control_height:145]+[GZGApplicationTool control_height:150]*i, [GZGApplicationTool control_wide:710], [GZGApplicationTool control_height:100])];
            backView.backgroundColor = [UIColor whiteColor];
            [viewArray addObject:backView];
            [self addSubview:backView];
        }
        
        UIView * phoneView = viewArray[0];
        codeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [GZGApplicationTool control_wide:80], [GZGApplicationTool control_height:100])];
        codeLabel.text = @"+86";
        [phoneView addSubview:codeLabel];
        phoneField = [[UITextField alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:80], 0, [GZGApplicationTool control_wide:630], [GZGApplicationTool control_height:100])];
        phoneField.placeholder = @"请输入手机号";
        [phoneView addSubview:phoneField];
        
        UIView * codeView = viewArray[1];
        codeField = [[UITextField alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:10], 0, [GZGApplicationTool control_wide:440], [GZGApplicationTool control_height:100])];
        codeField.placeholder = @"请输入短信验证码";
        [codeView addSubview:codeField];
        codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        codeBtn.frame = CGRectMake([GZGApplicationTool control_wide:450], 0, [GZGApplicationTool control_wide:260], [GZGApplicationTool control_height:100]);
        [codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        codeBtn.backgroundColor = [UIColor colorWithRed:107/255.0 green:177/255.0 blue:150/255.0 alpha:1.0];
        [codeBtn addTarget:self action:@selector(Code:) forControlEvents:UIControlEventTouchUpInside];
        [codeView addSubview:codeBtn];
        
        UIView * passView = viewArray[2];
        passField = [[UITextField alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:10], 0, [GZGApplicationTool control_wide:700], [GZGApplicationTool control_height:100])];
        passField.placeholder = @"请输入登录密码";
        [passView addSubview:passField];
        
        UIView * onceView = viewArray[3];
        onceField = [[UITextField alloc]initWithFrame:CGRectMake([GZGApplicationTool control_wide:10], 0, [GZGApplicationTool control_wide:700], [GZGApplicationTool control_height:100])];
        onceField.placeholder = @"再次输入登录密码";
        [onceView addSubview:onceField];
        
        completeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        completeBtn.frame = CGRectMake([GZGApplicationTool control_wide:40], [GZGApplicationTool control_height:825], [GZGApplicationTool control_wide:670], [GZGApplicationTool control_height:100]);
        completeBtn.backgroundColor = [UIColor colorWithRed:179/255.0 green:51/255.0 blue:54/255.0 alpha:1.0];
        [completeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [completeBtn setTitle:@"完成注册" forState:UIControlStateNormal];
        [completeBtn addTarget:self action:@selector(Registered:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:completeBtn];
    }
    return self;
}
#pragma mark --- 返回
-(void)Back:(id)sender
{
    [self.delegate BackDelegeteClick:sender];
}
#pragma mark --- 获取验证码
-(void)Code:(id)sender
{
    [self.delegate CodeDelegeteClick:sender];
}
#pragma mark --- 完成注册
-(void)Registered:(id)sender
{
    [self.delegate RegisteredDelegeteClick:sender];
}
@end