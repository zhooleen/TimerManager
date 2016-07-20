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

/**
 Timer-1
 1. Hold the timer by strong reference, the manager just holds its weak reference
 2. The callback 'block' will execute in the specified queue 'queue'
 3. When the timer holder (usually the UIViewController) deallocs, the timer invalidates
 4. When app enter background, all timer canceled. 
 5. When app enter foreground, recreate the timer by this method, or resume the old one.
 */
+ (id<RTTimer>) timerWithInterval:(NSTimeInterval)interval repeated:(BOOL)repeat queue:(dispatch_queue_t)queue block:(dispatch_block_t)block;

/**
 Timer-2
 @ref the Timer 1
 2. The callback 'block' will execute in main thread
 */
+ (id<RTTimer>) timerWithInterval:(NSTimeInterval)interval repeated:(BOOL)repeat block:(dispatch_block_t)block;

/**
 Timer-3
 @param identifier : the countdown timer identifier, if timer with the 'identifier' exists, return it, otherwise create and return a new one
 @param duration   : The time duration the timer lasts. when expired, the timer cancelled.
 @param interval   : The time interval the timer works.
 @param block      : The callback block. 
 @return RTTimer   : The countdown timer. 
 
 Hold the timer by weak reference. The manager will set it nil when expired.
 If you want the countdown timer again, re-query with [countdownTimerWithIdentifier...].
 Also, you can [cancel] it manually when necessorily, then it becomes nil.
 [suspend],[resume] as normal timer before it expires.
 */
+ (id<RTTimer>) countdownTimerWithIdentifier:(NSString*)identifier duration:(NSTimeInterval)duration interval:(NSTimeInterval)interval block:(RTCountDownTimerBlock)block;

/**
 Timer-4
 CADisplayLink adapter to protocol RTTimer, use it just as a normal timer
 @ref Timer-1
 */
+ (id<RTTimer>) displayLinkWithFrameInterval:(NSInteger)interval block:(RTDisplayLinkBlock)block;

+ (id<RTTimer>) countTimerWithCapacity:(NSUInteger)capacity interval:(NSTimeInterval)interval block:(RTCountTimerBlock)block;
@end
