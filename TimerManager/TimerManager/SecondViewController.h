//
//  SecondViewController.h
//  TimerManager
//
//  Created by lzhu on 7/7/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RTTimerManager.h"

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@property (strong, nonatomic) RTTimerObject *timerObject;

@end
