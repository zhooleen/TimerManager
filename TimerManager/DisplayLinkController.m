//
//  DisplayLinkController.m
//  TimerManager
//
//  Created by lzhu on 7/20/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "DisplayLinkController.h"
#import "RTDisplayLink.h"
#import "RTTimerManager.h"
#include <mach/mach_time.h>

@interface DisplayLinkController()
@property(strong, nonatomic) id<RTTimer> timer;
@end

@implementation DisplayLinkController


- (void) viewDidAppear:(BOOL)animated {
    
    __weak typeof(self) w = self;
    self.timer = [RTTimerManager displayLinkWithFrameInterval:2 block:^(NSTimeInterval ts, NSTimeInterval duration){
        struct mach_timebase_info timeBaseInfo;
        mach_timebase_info(&timeBaseInfo);
        CGFloat clockFrequency = (CGFloat)timeBaseInfo.denom / (CGFloat)timeBaseInfo.numer;
        clockFrequency *= 1000000000.0;
        w.timestamp.text = [@((uint64_t)(ts*clockFrequency)) stringValue];
        w.duration.text = [@(duration) stringValue];
    }];
    [self.timer resume];
}
@end
