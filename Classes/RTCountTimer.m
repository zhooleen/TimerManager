//
//  RTCountTimer.m
//  TimerManager
//
//  Created by lzhu on 7/20/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTCountTimer.h"
#import "RTDispatchTimer.h"
#import <UIKit/UIKit.h>

@interface RTCountTimer()

@property (assign, nonatomic) NSTimeInterval begins;

@property (strong, nonatomic) RTDispatchTimer *timer;

@end

@implementation RTCountTimer

- (instancetype) init {
    self = [super init];
    if(self) {
        _elapse = 0;
        _counter = 0;
    }
    return self;
}
- (void) resume {
    if(self.timer == nil) {
        if(self.maximumTimes == 0) {
            self.maximumTimes = NSUIntegerMax;
        }
        self.timer = [[RTDispatchTimer alloc] init];
        self.timer.queue = self.queue;
        self.timer.interval = self.interval;
        self.timer.repeat = YES;
        self.timer.referenceObject = self;
        
        __weak typeof(self) w = self;
        self.timer.block = ^{
            __strong typeof(w) this = w;
            this.elapse = CACurrentMediaTime()-this.begins;
            ++this.counter;
            this.block(this.elapse, this.counter);
            if(this.counter >= this.maximumTimes) {
                [this cancel];
            }
        };
        self.begins = CACurrentMediaTime();
    } else {
        self.begins = CACurrentMediaTime() - self.elapse;
    }
    [self.timer resume];
}

- (void) suspend {
    [self.timer suspend];
}

- (void) cancel {
    [self.timer cancel];
    self.elapse = 0.0f;
    self.timer = nil;
    self.counter = 0;
}

- (BOOL) isRunning {
    return [self.timer isRunning];
}

- (void) dealloc {
    [self cancel];
}

@end
