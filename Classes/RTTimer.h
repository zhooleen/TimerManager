//
//  RTTimer.h
//  TimerManager
//
//  Created by lzhu on 7/12/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RTTimer <NSObject>

- (void) resume;

- (void) suspend;

- (void) cancel;

- (BOOL) isRunning;

@end
