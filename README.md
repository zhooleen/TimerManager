# TimerManager
1. Automatically cancel the timer when the timer holder dealloc
2. Automatically cancel all timer when app did enter background. Resume them manually if necessarily.
3. Also, Cancel the timer manually if required.

# Usage
``` Objective-C
/**
Get the timer
*/
__weak typeof(self) werakself = self;
id<RTTimer> timer = [RTTimerManager timerWithInterval:0.1f repeated:YES block:^{
	__strong typeof(weakself) this = weakself;
	//Do your work in the block using this instead of self if necessarily.
}];

/**
Hold it
*/
self.timer = timer;

/**
Resume
*/
[self.timer resume];

/**
Cancel
*/
[self.timer cancel]; //awake it again by `[self.timer resume]`;
/**
OR
*/
self.timer = nil; //cancel forever

```
 
 # WARNINGS
 Don't let block retain a strong reference to self
