# TimerManager
A manager to avoid retain cycle when using NSTimer in Objective-C


# Usage

1. retain the timer-object, and start a timer
```
	_timerObject = [RTTimerManager scheduledTimer...];
```
2. The following ways to invalidate timer
	-  `_timerObject = nil`
		invalidate timer forever
	-  `[_timerObject.timerHolder stopTimer]`;
		awake a new timer by `[_timerObject.timerHoler startTimer]`;

#Example
 
