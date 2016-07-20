//
//  CountdownTimerController.m
//  TimerManager
//
//  Created by lzhu on 7/20/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "CountdownTimerController.h"

#import "RTTimerManager.h"

@interface CountdownTimerController()
@property (weak, nonatomic) id<RTTimer> timer;
@end
@implementation CountdownTimerController

- (void) viewDidLoad {
    __weak typeof(self) w = self;
    self.timer = [RTTimerManager countdownTimerWithIdentifier:@"com.redeight.countdown.timer" duration:120 interval:1 block:^(NSTimeInterval leftTime) {
        [w update:leftTime];
    }];
    NSTimeInterval time = [[(id)self.timer valueForKey:@"leftTime"] doubleValue];
    [self update:time];
    [self.timer resume];
}

- (void )update:(NSTimeInterval)time {
    int m = (int)(time) / 60;
    int s = (int)(time) % 60;
    NSString *str = [NSString stringWithFormat:@"%02d:%02d", m, s];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.label.text = str;
    });
}


@end
