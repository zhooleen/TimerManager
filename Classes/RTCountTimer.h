//
//  RTCountTimer.h
//  TimerManager
//
//  Created by lzhu on 7/20/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTTimer.h"

@interface RTCountTimer : NSObject <RTTimer>

//INPUT

@property (assign, nonatomic) NSTimeInterval interval;

@property (assign, nonatomic) NSUInteger maximumTimes;//0 forever

@property (strong, nonatomic) dispatch_queue_t queue;

@property (copy, nonatomic) RTCountTimerBlock block;


//OUTPUT

@property (assign, nonatomic) NSTimeInterval elapse;

@property (assign, nonatomic) NSUInteger counter;

@end
