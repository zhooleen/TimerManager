//
//  RTDisplayLink.h
//  TimerManager
//
//  Created by lzhu on 7/20/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "RTTimer.h"

@interface RTDisplayLink : NSObject <RTTimer>

@property (strong, nonatomic, readonly) CADisplayLink *link;

@property (assign, nonatomic) NSInteger frameInterval;

@property (strong, nonatomic) RTDisplayLinkBlock block;

@property (weak,   nonatomic) id referenceObject;

@end
