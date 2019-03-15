# Overview
HA HA HA BOY OH BOY ARE YOU IN FOR A WILD RIDE, KID  
For simplicity, let's break this down into a couple main sections:
- Central battle context logic
- Battle turn logic
- Battle attack logic
- Battle alter logic
- Battle passive logic
- Spell type breakdown
- Status effect logic

## Central Battle Context
The battle context is by far the most complex, code-wise. It controls all aspects of battle, each spell, each status, every possible move, equipement parsing, and so on and so forth. One thing that the battle context does *not* do is set the ENV in which the battle takes place. This is handled in Unreal as it is tied to the dungeon ENV. Upon entering a battle, participants are moved/apparated in a separate area within the same dungeon cell and then the battle context is called.

### Context Load
The battle context load logic does quite a bit of preparation in order for all values to be set up. It needs to prepare both the player's party as well as all the enemies and define their default behavior. *In order*, loading the battle context:
- Determines a standard set of enemies based on the powerlevel provided to the context change
- Initializes all party members as participants
- Loads all enemy files for the given powerlevel and adds them as participants
- Determines the play order of each participant, based on the persona's agility
- Parses the initial passive abilities each participant has (spells in the spell list tagged as passive=true)
- Begins the process of parsing turns

### Turn Processing
Much of the turn processing logic is offloaded to the battle context util `battleturn`. Only the most high-level implementation exists directly in the battle context.  
Since I'm incredibly stupid, the turn processing is done in a loop, returning to the update a list of all individual actions taken (more in the `update` sub-section). The battle context itself handles offloading each individual participant's turn to their potential own turn logic, which is used to handle status effects.

The turn loop itself will loop over all participants so long at there remains at least one party member and one enemy and attempt to process the turn. Should that participant's valid turn function return `1`, we assume that we need player input in order to proceed, so we break out of the loop manually and proceed to the refresh. At the end of each participant's turn, we run the `next()` logic.

#### Next
The Next logic handles processing all the general turn requirements as well as passing the turn to the next participant.  
If the `oncemore` flag was raised, the entire function is skipped and it is again the same participant's turn.  
If not, it will increment the open index to the next participant, or reset it to the first as necessary.  
Finally, it will count down all the status changes and remove those that have ended, on the *new* open participant. This means status progression is parse *at the start of the participant's turn*.

### Update
The battle context update is huge. Very huge. It needs to contain all information on inidividual participants, the actions taken between the last turn and now, and anything else concerning the state of the battle. For simplicity's sake, and to make sure we're sure to have everything we need, the standard refresh function returns the full dump of `state.battle`. The main element that is significantly changed each time is `state.battle.turns`.

`state.battle.turns` is a list of all individual actions taken in the order in which they transpired. It can be visualized as the form:
```lua
state.battle.turns = {participant1={spell1={}, spell2={}, spell3={}}}
```
Though without those keys specifically, so
```lua
state.battle.turns = [{{}, {}, {}}]
```
The highest-level list generally corresponds to each of the participants who have had a turn processed automatically. Each nested dict corresponds to an individual action taken by a participant on another participant within the turn. The easiest example of this is spells affecting multiple people. A single participant uses "Maragi", and each enemy gets affected by the attack individually.

While this is the logistic separation, in reality the view should interpret each section as a different way of managing the camera. In this case, each high-level list element refers to a change in camera position and focus, as well as a group of things to display simultaneously. Whereas the nested dicts correspond to information required during the display. The example again being Maragi, where a single high-level spell is used, and the camera is positioned showing the participant and all the enemies, and each nested dict contains the information on how much damage was taken by each enemy.

Other important `state.battle` values include `state.battle.participants`, `state.battle.iparty` and `state.battle.ienemy`.

## Battle Turn Logic
The battleturn util holds all the repeating general logic needed to process a single turn. This includes the standard turn logic when unaffected by any status, the AI logic for (randomly) choosing a spell and target, process handlers for activating spells and attacking physically, checking for eliminations and removing eliminated participants. 

### Standard Turn Logic | normalturn
When the participant is an AI, simply activate the AI section and return 0, meaning the turn has been processed. If the participant is player-controlled, check if we were given a spell index. If we were not, it means we've come to a new player-controlled participant and we need the player to input something, so we break out of the turn loop in battle by returning 1. If we *are* given a spell index, it means we have a valid input from the player, so we process the spell and wipe the input, finally returning 0 and continuing to the next participant.

### AI Logic
The AI logic is extremely simplistic at the moment, simply taking a random spell from a persona's list and activating it on a random opponent. It is smart enough to activate the spells on the appropriate set of participants (One Ally, All Enemy, etc...) and works with both participants from the party and shadows, in order to be used for statuses such as charm and rage.

### Spell and Physical Attacks | spellitout/beatitout
In this case, we're exceptionally refering to *normal, weapon and equipement based attacks* when talking about "Physical" attacks. Not spells using the Slash/Strike/Pierce elements.

Both of these are processed nearly identically, simply taken from different config file paths.
- Spells are loaded from `data/spells/`
- Physical attacks are loaded from the weapon files in `data/equip/weapons/`
The data files are expected to contain an `activate` function, which is then called.

### Elimination Processing
There are two utility functions available to process the removal of a participant from the battle:
- processEliminations: is run after every attack, wether by spell or physical and removes every participant 0 or less HP
- removeParticipant: contains the logic necessary to remove a single participant from the appropriate iindex list and the participants table
For safety reasons, processEliminations should only be run at the end of a particular turn, to avoid nullptrs. While removing a single participant is also potentially dangerous, it is significantly more controlable and is used in certain situations, like the Panic status.