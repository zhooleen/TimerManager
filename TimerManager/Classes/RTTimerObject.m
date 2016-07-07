//
//  RTTimerObject.m
//  TimerManager
//
//  Created by lzhu on 7/7/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTTimerObject.h"

@implementation RTTimerObject

- (instancetype) initWithTimerHolder:(RTTimerHolder *)holder {
    self = [super init];
    if(self) {
        _timerHolder = holder;
        holder.referenceObject = self;
    }
    return self;
}


@end
