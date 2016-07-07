//
//  RTTimerHolder.m
//  TimerManager
//
//  Created by lzhu on 7/7/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTTimerHolder.h"

@implementation RTTimerHolder

- (void) run {
    if(self.referenceObject == nil) {
        [self stopTimer];
    } else if(self.block) {
        self.block();
    } else if(self.target != nil && self.action != nil) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Warc-performSelector-leaks"
        [self.target performSelector:self.action];
#pragma clang diagnostic pop
    } else if(self.invocation != nil && self.invocation.target != nil) {
        [self.invocation invoke];
    } else {
        [self stopTimer];
    }
}

- (void) startTimer {
    printf("start timer\n");
    if(_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(run) userInfo:nil repeats:self.repeat];
    }
}

- (void) stopTimer {
    printf("stop timer\n");
    if(_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

@end
