//
//  RTTimerManager.m
//  TimerManager
//
//  Created by lzhu on 7/7/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RTTimerManager.h"

#import "RTDispatchTimer.h"
#import "RTCocoaTimer.h"
#import "RTTimerProxy.h"
#import "RTCountDownTimer.h"

@interface RTCountDownTimerHolder : NSObject

@property (strong, nonatomic) id<RTTimer> timer;

@property (copy, nonatomic) RTCountDownTimerBlock block;

@end @implementation RTCountDownTimerHolder @end



@interface RTTimerManager() <RTCountDownTimerDelegate>

@property (strong, nonatomic) NSHashTable *table;

@property (strong, nonatomic) id observer;

@property (strong, nonatomic) NSMutableDictionary *countDownTimers;

@property (strong, nonatomic) dispatch_queue_t queue;

@end



@implementation RTTimerManager

- (instancetype) init {
    self = [super init];
    if(self) {
        _table = [NSHashTable weakObjectsHashTable];
        _queue = dispatch_queue_create("com.redeight.TimerManager.Queue", DISPATCH_QUEUE_CONCURRENT);
        _countDownTimers = [NSMutableDictionary dictionaryWithCapacity:8];
    }
    return self;
}

- (void) observe {
    self.observer = [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        NSSet *set = [self.table setRepresentation];
        for(id<RTTimer> timer in set) {
            [timer cancel];
        }
    }];
}

- (void) deobserve {
    [[NSNotificationCenter defaultCenter] removeObserver:self.observer name:UIApplicationDidEnterBackgroundNotification object:nil];
}

+ (instancetype) shareManager {
    static dispatch_once_t once;
    static RTTimerManager *manager;
    dispatch_once(&once, ^{
        manager = [[RTTimerManager alloc] init];
        [manager observe];
    });
    return manager;
}

- (void) dealloc {
    [self deobserve];
}

+ (id<RTTimer>) timerWithInterval:(NSTimeInterval)interval repeated:(BOOL)repeat queue:(dispatch_queue_t)queue block:(dispatch_block_t)block {
    NSAssert(interval >= 0.01, @"Time interval if timer must great than or equal to 0.01");
    NSAssert(queue, @"Dispatch queue can not be nil");
    NSAssert(block, @"Block can not be nil");
    RTDispatchTimer *timer = [[RTDispatchTimer alloc] init];
    RTTimerProxy *proxy = [[RTTimerProxy alloc] initWithTimer:timer];
    timer.interval = interval;
    timer.repeat = repeat;
    timer.queue = queue;
    timer.block = block;
    timer.referenceObject = proxy;
    [[RTTimerManager shareManager].table addObject:timer];
    return proxy;
}

+ (id<RTTimer>) timerWithInterval:(NSTimeInterval)interval repeated:(BOOL)repeat block:(dispatch_block_t)block {
    NSAssert(interval >= 0.01, @"Time interval if timer must great than or equal to 0.01");
    NSAssert(block, @"Block can not be nil");
    RTCocoaTimer *timer = [[RTCocoaTimer alloc] init];
    RTTimerProxy *proxy = [[RTTimerProxy alloc] initWithTimer:timer];
    timer.interval = interval;
    timer.repeat = repeat;
    timer.block = block;
    timer.referenceObject = proxy;
    [[RTTimerManager shareManager].table addObject:timer];
    return proxy;
}

+ (id<RTTimer>) countdownTimerWithIdentifier:(NSString*)identifier duration:(NSTimeInterval)duration interval:(NSTimeInterval)interval block:(RTCountDownTimerBlock)block {
    RTCountDownTimerHolder *holder = [[RTTimerManager shareManager].countDownTimers objectForKey:identifier];
    if(holder) {
        holder.block = block;
        return holder.timer;
    }
    RTCountDownTimer *timer = [[RTCountDownTimer alloc] initWithIdentifier:identifier duration:duration intrval:interval queue:[RTTimerManager shareManager].queue];
    timer.delegate = [RTTimerManager shareManager];
    holder = [[RTCountDownTimerHolder alloc] init];
    holder.block = block;
    holder.timer = timer;
    [[RTTimerManager shareManager].countDownTimers setObject:holder forKey:identifier];
    return timer;
}

#pragma mark - RTCountDownTimerDelegate

- (void) countDownTimer:(RTCountDownTimer*)timer withLeftTime:(NSTimeInterval)time {
    RTCountDownTimerHolder *holder = [[RTTimerManager shareManager].countDownTimers objectForKey:timer.identifier];
    if(holder && holder.block) {
        holder.block(time);
    }
    if(time == 0.0f) {
        [[RTTimerManager shareManager].countDownTimers removeObjectForKey:timer.identifier];
    }
}

@end
