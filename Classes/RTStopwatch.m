//
//  RTStopwatch.m
//  TimerManager
//
//  Created by lzhu on 7/20/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTStopwatch.h"
#import "RTTimerManager.h"
#import "RTCountTimer.h"

@interface RTStopwatch()

@property (strong, nonatomic) NSMutableArray *records;

@property (strong, nonatomic) RTCountTimer *timer;

@end

@implementation RTStopwatch

- (instancetype) init {
    self = [super init];
    if(self) {
        _records = [NSMutableArray arrayWithCapacity:32];
    }
    return self;
}

- (void) record {
    [self.records addObject:@(self.timer.elapse)];
    [self.delegate stopwatchDidRecord:self];
}

- (NSInteger) numberOfRecords {
    return self.records.count;
}

- (NSTimeInterval) recordAtIndex:(NSInteger)index {
    return [self.records[index] doubleValue];
}

- (NSArray*) allRecords {
    return [self.records copy];
}

- (void) resume {
    if(self.timer == nil) {
        __weak typeof(self) w = self;
        self.timer = [RTTimerManager countTimerWithCapacity:0 interval:0.167 block:^(NSTimeInterval elapse, NSUInteger counter) {
            __strong typeof(w) this = w;
            [this.delegate stopwatch:this timeElapse:elapse];
        }];
    }
    [self.timer resume];
    [self.delegate stopwatchDidRecord:self];
}

- (void) suspend {
    [self.timer suspend];
    [self.delegate stopwatchDidSuspend:self];
}

- (void) cancel {
    [self.timer cancel];
    [self.records removeAllObjects];
    [self.delegate stopwatchDidCancel:self];
}

- (BOOL) isRunning {
    return [self.timer isRunning];
}

- (void) dealloc {
    [self cancel];
}
@end
