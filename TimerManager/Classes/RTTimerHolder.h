//
//  RTTimerHolder.h
//  TimerManager
//
//  Created by lzhu on 7/7/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RTTimerHolder : NSObject

/**
 Style 1: target-action
 */
@property (assign, nonatomic) id target;
@property (assign, nonatomic) SEL action;

/**
 Style 2: invocation
 */
@property (strong, nonatomic) NSInvocation *invocation;

/**
 Style 3: block
 */
@property (strong, nonatomic) dispatch_block_t block;


#pragma mark - Reference Object

@property (weak, nonatomic) id referenceObject;

#pragma mark - TIMER

@property (strong, nonatomic) NSTimer *timer;

@property (assign, nonatomic) NSTimeInterval interval;

@property (assign, nonatomic) BOOL repeat;

- (void) startTimer;

- (void) stopTimer;

- (void) run;

@end
