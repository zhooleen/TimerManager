//
//  RTDisplayLink.m
//  TimerManager
//
//  Created by lzhu on 7/20/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTDisplayLink.h"

@implementation RTDisplayLink

- (void) resume {
    if(_link == nil) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(action)];
        [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        _link.frameInterval = self.frameInterval;
    }
    _link.paused = NO;
    printf("RTDisplayLink resume");
}

- (void) suspend {
    if(_link) {
        _link.paused = YES;
        printf("RTDisplayLink suspend");
    }
}

- (void) cancel {
    if(_link) {
        [_link invalidate];
        _link = nil;
        printf("RTDisplayLink cancel");
    }
}

- (BOOL) isRunning {
    return _link == nil? NO : !_link.paused;
}

- (void) action {
    if(self.referenceObject && self.block) {
        self.block(self.link.timestamp, self.link.duration);
    } else {
        [self cancel];
    }
}

- (void) dealloc {
    [self cancel];
    self.referenceObject = nil;
    self.block = nil;
}

@end
