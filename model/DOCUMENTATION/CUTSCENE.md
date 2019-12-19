# Overview
This doc pertains not only to the `cutscene` context, but also to the `inline` and `link` contexts as well.

## Cutscene Theory
There are many different situations in which a "cutscene" can play, and many of them are in very different logistical contexts, since the term "cutscene" is so incredibly vague. Persona X separates them into three different categories based on their utility within the game. All three of these (detailed below) follow some of the same global rules, mostly distinguished by the way they are loaded and certain unique hooks into `processinput`. Theoretically, this would be an ideal place for an abstract/parent class, but since those are even more of a pain in Lua than even normal classes, we do something else instead.

`cutscene`, as the more generic of them all, plays the role of our "parent" class. It contains the state update generators for each item it is possible to process in any situation. As such, it exposes `setShowType` and `refresh` as public static functions. The case of `refresh` is a special one, since it is theoretically meant to be unique per context, and it relies on anything using it to have properly called setShowType *beforehand* to properly set up the value that resides in `state.cut.open.show`.

## Cutscene
Cutscenes are the top-most generic scenes meant to be stored in a directly-called single cutscene Lua file and may progress to the next time period once ended. it stores the logic required for leveling up the MC's social stats. For potential 1 billion IQ game design, it also stores the logic required for ranking up social links. It is this context that is to be called for story events and the even more generic school/classtime cutscenes, for example.

## Link
Links are the Social Link specific cutscenes. The only real reason to have these separated is because the logic determining which SL cutscene file to load and also ensuring the rank-up scenes are called is not necessary for any of the normal cutscenes.

## Inline
Inline cutscenes are very special as a context, even more so than calendar to an extent. Somewhat similar to the rank-up link util, inline hijacks the processinput of the entire context and then plays a cutscene over the current view, interrupting anything behind it. It is meant to be able to be played in any other context in order to interrupt and spout exposition, or for tutorials and other 4th-wall-breaking notifications, like social link rank, player status, etc... Since they override the processinput function, they could technically even be called during a calendar event. I believe that would end up causing C++ to panic though, so let's not do that.

Since any context should be picked back up and continued after an inline cutscene is played, it is very important that no state variables be permanently altered by the inline logic. As such, it temporarily stores the value of any state variable it uses (mainly cutscene ones) and reinstores them at the end of the inline.