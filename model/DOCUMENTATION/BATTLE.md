# Overview
HA HA HA BOY OH BOY ARE YOU IN FOR A WILD RIDE, KID  
For simplicity, let's break this down into a couple main sections:
- Central battle context logic
- Battle turn logic
- Battle attack/cost logic
- Battle alter logic
- Battle passive logic
- Spell type breakdown
- Status effect logic

---
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

---
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
The data files are expected to contain an `activate` function, which is then called. Once the spells have been parsed, a generic check on all participants is performed to see if they are still alive.

### Elimination Processing
There are two utility functions available to process the removal of a participant from the battle:
- processEliminations: is run after every attack, wether by spell or physical and removes every participant 0 or less HP
- removeParticipant: contains the logic necessary to remove a single participant from the appropriate iindex list and the participants table
For safety reasons, processEliminations should only be run at the end of a particular turn, to avoid nullptrs. While removing a single participant is also potentially dangerous, it is significantly more controlable and is used in certain situations, like the Panic status.

---
## Battle Attack and Cost Logic
The battleattack util is a giant helper module for the the most common spell format processing. That format being a generic, non-passive spell applying HP or SP damage to one or all enemies based on an element. While the implementation is somewhat complex, any spell matching those conditions (or base yourself off Agi or another simple standard spell) can be passed to the `attack` function with expected results.

It is worth noting that battleattack *does not handle reducing the caster's HP or SP*. That process requires a call to battlecost's single function `cost` and does not apply a specific event in `state.battle.turns`, since there is no visible effect on-screen. The participant's icon is simply modified on caster turn if there has been a change. This is up to unreal to handle and is pulled from `state.battle.participants`.

It is also worth noting that the target participant is always fetched directly from the participant list, while the caster is expected to be passed in parameter. Initially both were passed in parameter, but the change was made to accomodate "Repel" actions. It is likely that caster will eventually get the same treatment.

---
## Battle Alter Logic
This module serves as an even more generic helper for spells, particularly those not activated through the `battleattack` wrapper. It holds the generic implementation of processing the different status groups that a participant can have for configuring the effects of a spell. These are mainly:
- Calculating an attack bonus
- Calculating a defense bonus
- Calculating a hit/evasion bonus
- Parsing a Persona's resistances
Attack and Defense bonuses are each attibuted to a single participant in an exchange. In other words, parsing the Attack bonus will only verify if the *caster* has anything that would alter his attack power and parsing the Defense bonus will only verify if the target has anything that would alter their defensive value. It is also important to note, that parsing the Defense bonus *will also include parsing the resistances*, so no need to call it separately.

Hit/Evasion, as the name suggests, goes both ways. For example, Sukukaja both improves your chances to hit an enemy, but also to dodge incoming attacks. As such, parsing the Hit/Evasion bonus runs through both the caster and the target `dodgestatus` lists.

It is also important to note that the Attack and Defense parsers expect to be given *the current expected damage dealt* and return, likewise, a *modified absolute damage value with the statuses taken into account*. The Hit/Evasion parser, on the other hand, takes the *base chance for a spell to hit* and returns *the amount to add (or substract) to that value*.

The Resistance parser works a little differently, and isn't really called outside of the Defense bonus parser, but returns the *multiplier* to apply to the damage being dealt. The function also handles knocking enemies `down` and flagging `oncemore`.

As above, it is also worth noting that the target participant is always fetched directly from the participant list, while the caster is expected to be passed in parameter. Initially both were passed in parameter, but the change was made to accomodate "Repel" actions. It is likely that caster will eventually get the same treatment.

---
## Battle Passive Logic
Passive spells, sometimes counterintuitively, refers in this case to any spell whose *effect lasts longer than 1 turn*. It is refered to for two different logical separations in the codebase because I didn't think my shit through. This `battlepassive` module is responsible for:
- Adding new passives to participants' status lists.
- Counting down each passive's remaining turns
- Loading a participant's initial passive abilities at the start of a battle.

When a passive is added, the `passive` function will handle adding a usable entry into the participant's appropriate status list. It will also append an entry into the `state.battle.turns` list for the application of that status. To point out that, as I mentioned earlier, since it adds a brand new list element it is always understood that the status will be shown independantly of any other action that might happen during that turn.

At the start of each turn (in the `next` function from earlier), the `countdownpassives` function is called. This will decrement each entry in each status list of the open participant and remove those who have reached 0. There is a special case for the `turnstatus` list. Those statuses refer to repeating actions that should be processed at the start of every turn, independantly of what the participant chooses to do (for example, the Reguvenate series). For these statuses, it is this function that will process them.

At the start of every battle, each participant's spell list is gone over once, and any spells loaded that include the `passive` key will be automatically activated. These activated spells are parsed the same way as normal passive spells, but are removed from `state.battle.turns` list and as such *will never be displayed*. This is the second, completely different meaning for the term "passive spell".

---
## Spell Type Breakdown
There are a grand total of a whole fucking lot of spells that are configured for use in Persona X, including most of the spells available in Persona 3. Most of these spells fall into a destinctive category and are treated relatively similarly to other spells of that category. Here posted is a breakdown of those categories and a brief explanation of their implementation. Note that this is not a limitation on what spells could be capable of doing, simply how the default spells are set up.

Series Name | Spell Examples | Implementation
---|---|---
Generic Damage Series | Agi, Maragi, Bash, Hama, etc... | Call the generic attack module.
Heals Series | Dia, Diarahan, Media | Compute the additional HP to add within the spell. Negative damage should be considered healing. Overheal is not a thing
Evasion Boost Series | Dodge Fire, Evade Fire, Sukukaja | Call passive module. Process function edits hit/evasion rate
Damage Alter Series | Fire Boost, Null Fire, Power Charge, Rakunda | Call passive module. Process function edits damage
Repel Series | Repel Fire, Counterstrike | Considered a defense status. Process function switches `state.battle.target` for `state.battle.open`
Drain Series | Drain Fire, Drain Slash | Reversed the sign of the damage done. The engine considers negative damage to be healing.
Status Effect Series | Marin Karin, Tentarafoo | Checks for status hit/miss and appends the status to the participant's turnstatus. Also sets the participant's status to the status in question for turn processing.
Status Boost Series | Charm Boost, Rage Boost | Functions the same as Damage Alter series, but refers to spell statuses in process function
Status Cure Series | Charmdi, Enradi, Patra | Removes the participant's status key and removes the corresponding entry from the turnstatus list.
Regen Series | Regenerate, Invigorate, Spring of Life | Passive turnstatuses. Heal an attibute for a certain amount on process.
Recarm Series | Recarm, Samarecarm | These special cases assume the `targetindex` received from Unreal is a former participant's name. Re-adds them to `iparty` and the participants list.
Akarn Series | Makarakarn, Tetrakarn | Adds a repel-like spell to defense passives. Upon valid activation, removes itself.
Re Patra | Re Patra | Removes `down` key from target
Drain Series | Life Drain, Spirit Drain | Removes value from target and adds it to caster directly
Special Series | Recarmdra, Salvation | Other spells are combinations of existing spells. They are generally locally implemented however.
