# Overview
ENVs are an important data set, as they symbolize each physical environment it is possible to go to in the game. Unlike contexts, envs do not change the "game mode" of the game, simple the environment that the player should see, i.e. it does not affect gameplay.

There are two different types of ENVs: cells and dungeons. These are not separated by any obvious folder structure, but both have different requirements on how they must be defined.

TODO: Move to state doc  
The changing of ENVs is one of the only situations in which Lua calls C++, to inform UE to change the level the player is in. This can be done independantly of the current context. That being said, an ENV change should not be called directly by C++ either, since we absolutely must lock the state in order to prevent off-hand inputs from causing strange behavior.

## Cells

## Dungeons
Dungeons themselves to not necessarily require flag handling, as they normally are fairly immutable aside from perhaps mini-boss floors, depending on how those will be handled (TBD).