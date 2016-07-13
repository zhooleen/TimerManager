# TimerManager
1. Automatically cancel the timer when the timer holder dealloc
2. Automatically cancel all timer when app did enter background. Resume them manually if neccessory.
3. Also, Cancel the timer manually if required.

# Usage
``` Objective-C
/**
Get the timer
*/
id<RTTimer> timer = [RTTimerManager timerWithInterval:0.1f repeated:YES block:^{
	//do your work.
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


#Example
 
