//
//  RTTimerManager.h
//  TimerManager
//
//  Created by lzhu on 7/7/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RTTimerObject.h"

@interface RTTimerManager : NSObject

+ (RTTimerObject*) scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)target action:(SEL)action repeated:(BOOL)repeat;

+ (RTTimerObject*) scheduledTimerWithTimeInterval:(NSTimeInterval)interval invocation:(NSInvocation*)invocation repeated:(BOOL)repeat;

+ (RTTimerObject*) scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeated:(BOOL)repeat block:(dispatch_block_t)block;

@end
