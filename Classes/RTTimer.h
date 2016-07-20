//
//  RTTimer.h
//  TimerManager
//
//  Created by lzhu on 7/12/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RTTimer <NSObject>

- (void) resume;        //start or resume the timer

- (void) suspend;       //let the timer pause

- (void) cancel;        //invalidate the timer

- (BOOL) isRunning;     //is running

@end


typedef void(^RTDisplayLinkBlock)(NSTimeInterval timestamp, NSTimeInterval duration);

typedef void(^RTCountDownTimerBlock)(NSTimeInterval leftTime);

typedef void(^RTCountTimerBlock)(NSTimeInterval elapse, NSUInteger counter);
