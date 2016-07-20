//
//  RTDispatchTimer.m
//  TimerManager
//
//  Created by lzhu on 7/12/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTDispatchTimer.h"

@interface RTDispatchTimer()
@property (strong, nonatomic) dispatch_source_t timer;
@property (assign, nonatomic) BOOL running;
@end

@implementation RTDispatchTimer

- (instancetype) init {
    if(self = [super init]) {
        _running = NO;
    }
    return self;
}

- (void) resume {
    if(self.timer == nil) {
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, self.queue);
        dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, self.interval * NSEC_PER_SEC, 0.05f);
        __weak typeof(self) this = self;
        dispatch_source_set_event_handler(self.timer, ^{
            if(this.referenceObject && this.block) {
                this.block();
            } else {
                [this cancel];
            }
        });
    }
    if(!_running) {
        dispatch_resume(self.timer);
        printf("RTDispatchTimer Resume\n");
    }
    _running = YES;
}

- (void) suspend {
    if(self.timer && _running) {
        dispatch_suspend(self.timer);
        printf("RTDispatchTimer Suspend\n");
    }
    _running = NO;
}

- (void) cancel {
    if(self.timer) {
        if(dispatch_source_testcancel(self.timer) == 0) {
            dispatch_cancel(self.timer);
        } else {
            dispatch_resume(self.timer);
            dispatch_cancel(self.timer);
        }
        self.timer = nil;
        printf("RTDispatchTimer Cancel\n");
    }
    _running = NO;
}

- (BOOL) isRunning {
    return _running;
}

- (void) dealloc {
    [self cancel];
}

@end
