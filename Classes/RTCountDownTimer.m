//
//  RTCountDownTimer.m
//  TimerManager
//
//  Created by lzhu on 7/20/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTCountDownTimer.h"

@interface RTCountDownTimer()
@property (strong, nonatomic) dispatch_queue_t queue;
@property (strong, nonatomic) RTDispatchTimer *timer;
@end

@implementation RTCountDownTimer

- (instancetype) initWithIdentifier:(NSString*)identifer duration:(NSTimeInterval)duration intrval:(NSTimeInterval)interval queue:(dispatch_queue_t)queue{
    NSAssert(duration >= interval, @"");
    self = [super init];
    if(self) {
        _identifier = identifer;
        _duration = duration;
        _interval = interval;
        _leftTime = duration;
        _queue = queue;
    }
    return self;
}

- (void) resume {
    if(self.timer == nil) {
        self.timer = [[RTDispatchTimer alloc] init];
        self.timer.queue = self.queue;
        self.timer.interval = self.interval;
        self.timer.repeat = YES;
        self.timer.referenceObject = self;
        
        __weak RTCountDownTimer *w = self;
        self.timer.block = ^{
            __strong RTCountDownTimer *this = w;
            _leftTime -= this.interval;
            if(_leftTime <= 0) {
                _leftTime = 0;
                [this cancel];
            }
            if(this.delegate) {
                [this.delegate countDownTimer:this withLeftTime:this.leftTime];
            }
        };
    }
    [self.timer resume];
}

- (void) suspend {
    [self.timer suspend];
}

- (void) cancel {
    [self.timer cancel];
    self.timer.block = nil;
    self.timer.referenceObject = nil;
    self.timer.queue = nil;
    self.timer = nil;
    if(self.delegate) {
        [self.delegate countDownTimer:self withLeftTime:0.0f];
    }
}

- (BOOL) isRunning {
    return [self.timer isRunning];
}

@end
