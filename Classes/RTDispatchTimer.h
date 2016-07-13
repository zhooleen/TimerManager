//
//  RTDispatchTimer.h
//  TimerManager
//
//  Created by lzhu on 7/12/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RTTimer.h"

@interface RTDispatchTimer : NSObject <RTTimer>

@property (strong, nonatomic) dispatch_queue_t queue;

@property (strong, nonatomic) dispatch_block_t block;

@property (weak, nonatomic) id referenceObject;

@property (assign, nonatomic) NSTimeInterval interval;

@property (assign, nonatomic) BOOL repeat;

@end
