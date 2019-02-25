# Overview
This file defines all global variables that are callable from the controller or that need to be cached for further use. The following are all know values that can be contextually found within state and their significance.

## State Variables
- Version: Game version. Currently 0.0.0.0.X
- cut: The current cutscene being played.
- date: Current day's id (~1-365) and time (Early Morning, After School, etc...)
- slglobal: Current level and angle of each social link in the game
- availablechars: Names of characters that can be in the party
- party: Characters other than MC that are in the party (and all their data)
- mc: All data about the Main Character
- env: Current environment/place.
- flags: List of all flags that have been raised as of now. (perform "need in flags" for dependancy check)
- save: The save number (1-math.huge)
- context: What the player is doing now and the input processor for that context

## Current Existing contexts:
- link: Any cutscene (Social Link, Story or Event)
- shop: any kind of shop in the game
- calendar: date/time change
- freeroam
- dungeon
- battle
- inline
- cutscene
### TODO Contexts:
- velvet: Velvet Room
