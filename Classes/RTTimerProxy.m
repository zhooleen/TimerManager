//
//  RTTimerProxy.m
//  TimerManager
//
//  Created by lzhu on 7/12/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTTimerProxy.h"

@interface RTTimerProxy()

@property (strong, nonatomic) id<RTTimer> timer;

@end

@implementation RTTimerProxy

- (instancetype) initWithTimer:(id<RTTimer>)timer {
    self = [super init];
    if(self) {
        _timer = timer;
    }
    return self;
}

- (void) resume {
    [self.timer resume];
}

- (void) suspend {
    [self.timer suspend];
}

- (void) cancel {
    [self.timer cancel];
}

- (BOOL) isRunning {
    return [self.timer isRunning];
}

@end
