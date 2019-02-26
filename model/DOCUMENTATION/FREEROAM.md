# Overview
Nothing happens directly in freeroam. While originally, various chunks of Lua code were planned to be baked into the UE actors and called on capsule collision, that would have meant a decently significant loss in flexibility for editing the game's content on the fly. Instead, these baked commands will be stored in corresponding actor files that are associated to the flags used by the environment to request viewport loading.

### Only in Freeroam
Freeroam is the only context in which the user has freedom of movement (+dungeon, which is ostensibly a subclass. See it's own doc), so it's the only context in which interaction with a graphical element will engage a dialog between the GSV and UE. In the same sense, it is the only context that is undeniably molded by the environment (UE level) in which the player currently is.

### Actor Definition
The code to run (generally a context change request) is defined in the Actor files. Actor files are handled by the environment, depending on the flags raise when loading the ENV, and the ENV is referenced by the freeroam context. There's more info on this in the ENV documentation, so I'll skip that part here.

### Forwarding inputs
The freeroam context should never be recieveing "dead" inputs anyway, since that's handled by UE (by dead inputs I mean any input that is not a valid reference to an actor, since C++ will only generate an event should an input be processed when two capsules overlap, etc...). When freeroam recieves an input, it should then attempt to call the corresponding entry in the environment's actor table (which is just the ENV directly, thanks to Lua being awesome).
