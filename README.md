
# Program Structure
## C++
### Initialize Lua State
The first step upon loading into a save file is to initialize the lua state. To keep our code relatively simple in terms of imports, the game state is saved as a Lua global variable (see Lua section below). The C++ initialization preps the Lua C API lua_State object used for interacting with the shared stack, and also runs the initial Lua setup to make the global state available to reference in later Lua C API calls.

The global state variable (GSV) occupies index 0 of the shared C/Lua stack. Since all operations pass through this variable, it should never be removed or displaced.

The PX C++ API offers two built-in ways of interacting with the Lua stack.
*getUpdate*
- Returns the C++ JSON object of the state.update table.
*sendStateEvent*
- Send an event to the PX Lua API, in the form recognizable by the current context (see Lua section below).

These functions are balanced, meaning they will always leave the stack in the state it started, making them safe to use. It is possible to interact with the stack in other ways, but due to the difficulty in tracing potential segfaults and the general unstability of the shared stack, it is highly recommended not to do so.

### C++ Reponsibility
In a general, overhead sense, the C++ code is used to translate user input in a graphical environment (UE4) to the logical model that the GSV represents. It is C++'s responsibility to send appropriately formatted events to the GSV and to interpret the resulting state.update in the correct manner within the current context.

There are certain, very specific circumstances in which Lua will call C++. Mainly, to request loading of some form of resources including context switches, UI elements, animations and models, and so on. While many things should be possible, the main use of this is to change contexts. The idea being that C++ will interpret state.update once the event it sent has returned. Since context changes should only be possible through events in the first place, there will never be a time where C++ must request a context switch on it's own. User input is therefore limited in effect (in the scope of C++) to firing an event in the GSV.

The intented flow goes:
- User inputs something
- - C++ translates input into GSV event
- - C++ fires event
- - - GSV processes event, determines a context change is required
- - - GSV sends request to C++ to load new UE level, graphic context, etc...
- - - GSV finishes processing the event, and configures state.update to correctly in the new context
- - C++ recieves the state.update
- - C++ interprets the context of state.update based on the JSON template recieved
- User sees results of their actions

It is important to note that this is obviously *not done on a frame-by-frame basis*. This is done based on the triggers residing in the UE level that correspond to firing a Lua event and that from my currently limited understanding is run asynchroneously to the frame refresh.

### Exposed C++ Functions
Currently, none. This is a WIP pre-alpha alpha early access and there are no graphics. The functionality required for a finished product along the currently intended design are
- Load Level
- Load UI Template
- Load Control Scheme

## Lua
### Initialize Game State
The entirety of the Lua code is built around the gobdal state variable (GSV). It contains all information required to identify the current state of the game on load. The bulk of the GSV callable code is stored as a global variable initialized when resolving the state.lua file. The functionality exposed in the GSV are:
- loadstate: load a save file
- savestate: save the game
- event: process a given event
- changecontext: process the switch from one context to another
- loadenv: process the changing of graphical environments
- loading: toggle a loading screen request
- flag: a convenience function to access the global flags thrown
- evolve: a convenience function to add a key to the global state, use sparingly
- lock/unlock: block/allow event inputs

It should also be noted that there exists another global variable set in state.lua, that being the Lua JSON utility. Since state.update is designed to be a dumps'd JSON and since each context must be able to set it, it is convenient to have access to it anywhere.

### Processing Events
Following what the philosophy explained in the C++ section, the Lua code is designed to functionally work off a single event being fired. It is then processed internally and state.update is set. The exposed functionality changecontext and loadenv, while seemingly useful, are not to be used by anything other than the Lua event processing.

To note: the GSV *blocks all input* while processing an event. It *does not* store inputs. Mashing a on something will not cause multiple events to be fired. The function will be terminated prematurely. This is expected behavior.

### Lua Responsibility - Context Switching
Contexts are the major game logic subdivisions in the codebase. The context determines what the user is intended to be doing during the time it is active. Since significant user inputs are mapped to events, there must be a context set at all times while inputs are enabled.
To this end, context changes are only possible through Lua code that was called by a process event, with one semi-exception (we'll get to that later). Since the state is locked upon receiving an event, this ensures that state.update will not get corrupted by an asynchroneous call. To my understanding, the program would very likely crash from segfault anyway should two events attempt to alter the shared stack, so this is for the best technically as well.


# Requirements
This program was run and tested with the following utilities:
- LuaJIT 2.0.4
- luajit-devel 2.0.4
- gcc 4.8.5

C++
- nlohmann/json 3.4

Lua Rocks
- luajson 1.3.4
- inspect 3.1.1