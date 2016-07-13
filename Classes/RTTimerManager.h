//
//  RTTimerManager.h
//  TimerManager
//
//  Created by lzhu on 7/7/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RTTimer.h"

@interface RTTimerManager : NSObject

+ (id<RTTimer>) timerWithInterval:(NSTimeInterval)interval repeated:(BOOL)repeat queue:(dispatch_queue_t)queue block:(dispatch_block_t)block;

+ (id<RTTimer>) timerWithInterval:(NSTimeInterval)interval repeated:(BOOL)repeat block:(dispatch_block_t)block;

@end
