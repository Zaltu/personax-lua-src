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
state.battle.turns is a LIST OF SPELL EFFECT TABLES.  
state.battle.turns = {participant1={spell1={}, spell2={}, spell3={}}}