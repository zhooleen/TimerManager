//
//  RTTimerObject.h
//  TimerManager
//
//  Created by lzhu on 7/7/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RTTimerHolder.h"

@interface RTTimerObject : NSObject

@property (strong, nonatomic, readonly) RTTimerHolder *timerHolder;

- (instancetype) initWithTimerHolder:(RTTimerHolder*)holder;

@end
