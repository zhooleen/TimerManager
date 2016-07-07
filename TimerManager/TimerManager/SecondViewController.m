//
//  SecondViewController.m
//  TimerManager
//
//  Created by lzhu on 7/7/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController


- (void) viewDidLoad {
    __weak typeof(self) weakself = self;
    self.timerObject = [RTTimerManager scheduledTimerWithTimeInterval:0.1f repeated:YES block:^{
        NSDate *date = [NSDate date];
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];
        formater.dateFormat = @"HH:mm:ss";
        formater.locale = [NSLocale currentLocale];
        NSString *string = [formater stringFromDate:date];
        dispatch_async(dispatch_get_main_queue(), ^{
            weakself.timerLabel.text = string;
        });
    }];
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 100);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        weakself.timerObject = nil;
    });
    
}
@end
