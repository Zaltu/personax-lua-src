# Overview
Calendar contexts are somewhat unique in that they can call other contexts during their context load. This is intended to have as result that the "sub"-context is loaded while the UI is showing the calendar context load screen. However, the calender context does not own a processinput function, as it is not intended to be "played", since it functions as a loading screen, and so it is one of the few non-env-loading situations in which Lua will be calling C++ functions in order to toggle pseudo-loading displays, including an env change as well.

To note that the current logic dictates that every single day between day 1 and day 365 needs to be defined, even if there are no timelots within it. That way, loading an empty day will result it in immediately loading the following day, and so on until it finds a valid timeslot to load. This is kind of silly and is likely to change at some point.

### Again...
The calendar contexts DO NOT HAVE REFRESH FUNCTIONS. This means that if the state is saved during a calendar context, the game will not be able to continue on loadstate, as the state.event call will be locked and won't accept processinput commands.