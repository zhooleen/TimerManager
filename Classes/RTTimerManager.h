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

/**
 @param identifier : the countdown timer identifier, if timer with the 'identifier' exists, return it, otherwise create and return a new one
 @param duration   : The time duration the timer lasts. when expired, the timer cancelled.
 @param interval   : The time interval the timer works.
 @param block      : The callback block. 
 @return RTTimer   : The countdown timer. 
 
 Please hold the timer by weak reference. The manager will set it nil when expired.
 If you want the countdown timer again, re-query with [countdownTimerWithIdentifier...].
 Also, you can [cancel] it manually when necessorily, then it becomes nil.
 [suspend],[resume] as normal timer before it expires.
 */
+ (id<RTTimer>) countdownTimerWithIdentifier:(NSString*)identifier duration:(NSTimeInterval)duration interval:(NSTimeInterval)interval block:(RTCountDownTimerBlock)block;

+ (id<RTTimer>) displayLinkWithFrameInterval:(NSInteger)interval block:(RTDisplayLinkBlock)block;

@end
