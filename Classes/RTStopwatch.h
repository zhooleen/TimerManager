//
//  RTStopwatch.h
//  TimerManager
//
//  Created by lzhu on 7/20/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RTTimer.h"

@protocol RTStopwatchDelegate;

@interface RTStopwatch : NSObject <RTTimer>

@property (weak, nonatomic) id<RTStopwatchDelegate> delegate;

- (void) record;

- (NSInteger) numberOfRecords;

- (NSTimeInterval) recordAtIndex:(NSInteger)index;

- (NSArray*) allRecords;

@end


@protocol RTStopwatchDelegate <NSObject>

- (void) stopwatchDidResume:(RTStopwatch*)stopwatch;

- (void) stopwatchDidSuspend:(RTStopwatch*)stopwatch;

- (void) stopwatchDidCancel:(RTStopwatch*)stopwatch;

- (void) stopwatchDidRecord:(RTStopwatch*)stopwatch;

- (void) stopwatch:(RTStopwatch*)stopwatch timeElapse:(NSTimeInterval)elapse;

@end
