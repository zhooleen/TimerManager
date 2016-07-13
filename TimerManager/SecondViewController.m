//
//  SecondViewController.m
//  TimerManager
//
//  Created by lzhu on 7/7/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "SecondViewController.h"
#import "RTTimerManager.h"

@interface SecondViewController()

@property (strong, nonatomic) id<RTTimer> timer;
@property (strong, nonatomic) id<RTTimer> timer2;
@property (strong, nonatomic) dispatch_queue_t queue;
@end

@implementation SecondViewController

- (void) viewDidLoad {
    self.queue = dispatch_queue_create("com.redeight.TimerQueue", NULL);
    
    __weak typeof(self) weakself = self;
    
    self.timer = [RTTimerManager timerWithInterval:0.1f repeated:YES queue:self.queue block:^{
        NSDate *date = [NSDate date];
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];
        formater.dateFormat = @"HH:mm:ss";
        formater.locale = [NSLocale currentLocale];
        NSString *string = [formater stringFromDate:date];
        dispatch_async(dispatch_get_main_queue(), ^{
            weakself.timerLabel.text = string;
        });
    }];
    [self.timer resume];

    
    self.timer2 = [RTTimerManager timerWithInterval:0.2f repeated:YES block:^{
        printf(".\n");
    }];
    [self.timer2 resume];
    
}

- (void) viewWillDisappear:(BOOL)animated {
    self.timer = nil;
    self.timer2 = nil;
}
@end
