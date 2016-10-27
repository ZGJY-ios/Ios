//
//  GZGYCountdown.h
//  ZGJY
//
//  Created by YYS on 16/10/19.
//  Copyright © 2016年 LiuYaDong. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^TimerStopBlock)();

@interface GZGYCountdown : UIView

@property (nonatomic,assign)NSInteger timestamp;// 时间戳

@property (nonatomic,copy)TimerStopBlock timerStopBlock;// 时间停止后回调
//创建单例对象
+ (instancetype)shareCountDown;// 工程中使用的倒计时是唯一的
//创建非单例对象
+ (instancetype)countDown; // 工程中倒计时不是唯一的

@end