//
//  RTTimerManager.m
//  TimerManager
//
//  Created by lzhu on 7/7/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTTimerManager.h"

@implementation RTTimerManager


+ (RTTimerObject*) scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)target action:(SEL)action repeated:(BOOL)repeat {
    NSAssert(target != nil, nil);
    NSAssert(action, nil);
    RTTimerHolder *holder = [[RTTimerHolder alloc] init];
    holder.target = target;
    holder.action = action;
    holder.interval = interval;
    holder.repeat = repeat;
    RTTimerObject *obj = [[RTTimerObject alloc] initWithTimerHolder:holder];
    [holder startTimer];
    return obj;
}

+ (RTTimerObject*) scheduledTimerWithTimeInterval:(NSTimeInterval)interval invocation:(NSInvocation*)invocation repeated:(BOOL)repeat {
    NSAssert(invocation != nil, nil);
    RTTimerHolder *holder = [[RTTimerHolder alloc] init];
    holder.invocation = invocation;
    holder.interval = interval;
    holder.repeat = repeat;
    RTTimerObject *obj = [[RTTimerObject alloc] initWithTimerHolder:holder];
    [holder startTimer];
    return obj;
}

+ (RTTimerObject*) scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeated:(BOOL)repeat block:(dispatch_block_t)block {
    NSAssert(block != nil, nil);
    RTTimerHolder *holder = [[RTTimerHolder alloc] init];
    holder.block = block;
    holder.interval = interval;
    holder.repeat = repeat;
    RTTimerObject *obj = [[RTTimerObject alloc] initWithTimerHolder:holder];
    [holder startTimer];
    return obj;
}

@end
