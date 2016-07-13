//
//  RTCocoaTimer.m
//  TimerManager
//
//  Created by lzhu on 7/13/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTCocoaTimer.h"

@interface RTCocoaTimer()

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation RTCocoaTimer

- (void) resume {
    if(self.timer && self.timer.isValid) {
        return;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.interval target:self selector:@selector(run) userInfo:nil repeats:self.repeat];
    if(![NSThread isMainThread]) {
        [[NSRunLoop currentRunLoop] run];
    }
    printf("RTCocoaTimer Resume\n");
}

- (void) suspend {
    [self cancel];
}

- (void) cancel {
    if(self.timer && self.timer.isValid) {
        [self.timer invalidate];
        printf("RTCocoaTimer Cancel\n");
    }
    self.timer = nil;
}

- (BOOL) isRunning {
    return self.timer? self.timer.isValid : NO;
}

- (void) run {
    if(self.referenceObject && self.block) {
        self.block();
    } else {
        [self cancel];
    }
}

- (void) dealloc {
    [self cancel];
}

@end
