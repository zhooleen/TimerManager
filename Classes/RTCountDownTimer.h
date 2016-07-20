//
//  RTCountDownTimer.h
//  TimerManager
//
//  Created by lzhu on 7/20/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RTTimer.h"
#import "RTDispatchTimer.h"

@class RTCountDownTimer;

@protocol RTCountDownTimerDelegate <NSObject>

- (void) countDownTimer:(RTCountDownTimer*)timer withLeftTime:(NSTimeInterval)time;

@end

@interface RTCountDownTimer : NSObject <RTTimer>

@property (strong, nonatomic, readonly) NSString *identifier;

@property (assign, nonatomic, readonly) NSTimeInterval duration;

@property (assign, nonatomic, readonly) NSTimeInterval interval;

@property (strong, nonatomic) id<RTCountDownTimerDelegate> delegate;

@property (assign, nonatomic, readonly) NSTimeInterval leftTime;


- (instancetype) initWithIdentifier:(NSString*)identifer duration:(NSTimeInterval)duration intrval:(NSTimeInterval)interval queue:(dispatch_queue_t)queue;

@end
