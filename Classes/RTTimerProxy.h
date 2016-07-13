//
//  RTTimerProxy.h
//  TimerManager
//
//  Created by lzhu on 7/12/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTTimer.h"

@interface RTTimerProxy : NSObject <RTTimer>

- (instancetype) initWithTimer:(id<RTTimer>)timer;

@end
