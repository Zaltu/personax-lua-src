# Overview
ENVs are an important data set, as they symbolize each physical environment it is possible to go to in the game. Unlike contexts, envs do not change the "game mode" of the game, simply the environment that the player should see, i.e. it does not affect gameplay.

There are two different types of ENVs: cells and dungeons. These are not separated by any obvious folder structure, but both have different requirements on how they must be defined.

TODO: Move to state doc  
The changing of ENVs is one of the only situations in which Lua calls C++, to inform the engine to change the level the player is in. This can be done independantly of the current context. That being said, an ENV change should not be called directly by C++ either, since we absolutely must lock the state in order to prevent off-hand inputs from causing strange behavior.

## Cells
TODO: flag definitions and handling

## Dungeons
Dungeons themselves to not necessarily require flag handling, as they normally are fairly immutable aside from perhaps mini-boss floors, depending on how those will be handled (TBD). They still differ from normal cells though, as they need to contain the "powerlevel" information used to construct the battle context. The powerlevel information is previded as follows:
```
--In dungeon A, first half:
1 = [{small small small}] (same weaknesses)
2 = [{big}]
3 = [{small small}] (different weaknesses)
--In dungeon A, second half with levels ++:
4 = [{small small small}] (same weaknesses)
5 = [{big}]
6 = [{small small}] (different weaknesses)
```
Where the indexes correspond to the powerlevels defined in the dungeon. Normally, the dungeon should never recieve a powerlevel that it does not define.