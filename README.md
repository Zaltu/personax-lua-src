# Program Structure
## C++
### Initialize Lua State
The first step upon loading into a save file is to initialize the lua state. To keep our code relatively simple in terms of imports, the game state is saved as a Lua global variable (see Lua section below). The C++ initialization preps the Lua C API lua_State object used for interacting with the shared stack, and also runs the initial Lua setup to make the global state available to reference in later Lua C API calls.

The global state variable (GSV) occupies index 0 of the shared C/Lua stack. Since all operations pass through this variable, it should never be removed or displaced.

The PX C++ API offers two built-in ways of interacting with the Lua stack.
- *getUpdate*: Returns the C++ JSON object of the state.update table.
- *sendStateEvent*: Send an event to the PX Lua API, in the form recognizable by the current context (see Lua section below).

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
The entirety of the Lua code is built around the gobdal state variable (GSV). It contains all information required to identify the current state of the game on load. The bulk of the GSV callable code is stored as a global variable initialized when resolving the state.lua file. The functionality exposed in the GSV is:
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

### Lua Responsibility - Processing Events
Following what the philosophy explained in the C++ section, the Lua code is designed to functionally work off a single event being fired. It is then processed internally and state.update is set. The exposed functionality changecontext and loadenv, while seemingly useful, are not to be used by anything other than the Lua event processing.

To note: the GSV *blocks all input* while processing an event. It *does not* store inputs. Mashing a on something will not cause multiple events to be fired. The function will be terminated prematurely. This is expected behavior.

### Lua Responsibility - Context Switching
Contexts are the major game logic subdivisions in the codebase. The context determines what the user is intended to be doing during the time it is active. Since significant user inputs are mapped to events, there must be a context set at all times while inputs are enabled.
To this end, context changes are only possible through Lua code that was called by a process event, with one semi-exception (we'll get to that later). Since the state is locked upon receiving an event, this ensures that state.update will not get corrupted by an asynchroneous call. To my understanding, the program would very likely crash from segfault anyway should two events attempt to alter the shared stack, so this is for the best technically as well.

### Available Contexts
The contexts that are available by default are symbolically fixed. That meaning that you could in theory add more contexts, but since they themselves are responsible for *switching* contexts, any added contexts cannot be reached unless an existing context is changed to switch to it. The defined, available contexts are:
- freeroam
- link (Social Link)
- shop
- calendar (special case)
- battle
- dungeon
- inline (in-line text handling)
- velvet (special shop)

### Lua Data Files
While JSON is a useful tool to pass recognizable data through the shared stack, it it not particularly efficient. Based on some tests run (see some of the info in zaltu/luawriter), requiring a Lua file is up to over 10,000 times faster to load than parsing JSON. Obviously, this is somewhat expected, but it is still a remarkable difference.

Because of this, all the game's "text" data files (stats, text, etc...) are stored as importable Lua files that return a Lua table containing the information. The Lua context can then use this information to generate the appropriate JSON for the shared stack.

This has rather *critical* implementation structure implications. While requiring Lua files is significantly faster and in many cases easier to organize, *requiring a Lua file is an import not an instantiation*! In my humble opinion, classes are a bitch to handle in Lua and are not especially suited as a program structure to representing individually each a single object. As such, each file is only ever *imported* as a fixed table.

Information reguarding the `require` implementation can be found in the Lua documentation, but the gist of it is that each table returned will be sent to the global `package.loaded[<module>]` table. When a file is subsequently re-required, it will simply reference that table if it already exists. This means that each and every require is completely static to it's own scope. Requiring the same file twice within the same scope will invariably result in two references to the same table.

In general, we really really don't care. Each file imported very much more so represents an object than a class and incredibly few situations would see you importing duplicates of the same file. On top of that, due to the nature of each file, it is oftentimes perfectly acceptable to have multiple references to the same file should exist in the same scope for simplicity. Therefore it is important to be aware not to directly edit the contents of an imported table.

That being said, there are times when we *want* to import and edit a file, generally to then save it as a separate entity (when the MC levels up a Persona, for example). Again, since we are working with the concept of a "game state", we won't be saving those changes out to individual files, but to our more general "state" freeze, which are our save files. Still, we need a way to deep copy the table returned in the simplest, most direct form. Lua does not offer such functionality in it's standard library. While there are a number of relatively simple snippets and modules designed to have the same effect, it was decided instead to use a small workaround that invalidates the issue.

The Lua `dofile` function compiles the code of the specified filepath and executes it immediately, returning the value returned by the file. This means that the value is *not* stored in the `package.loaded` table and is a completely unique data structure, no matter how many times you execute it. We can therefore safely assume that any tables imported using this method will get garbage collected once the scope ends.

Not taking these points into account can and will lead to very bizarre, inconsistent and difficult to pinpoint bugs as the consequences are highly dependent on the specific runtime Lua state. Be vigilent.

### Lua Folder Structure
Lua files represent the "model" of the game from a classic MVC standpoint. As such, they are under the top-level "model" folder. Directly within the model folder are the main important modules. For the organization of this program, that basically comes down to *all contexts*. Normally, each context is represented by a single file, as many are not overly complex from a game state management point of view. In some cases, like the battle context, there are many things that need to be handled however, and keeping them all in a single file, while possible, would be annoying as all hell. In such situations, the extra file(s) are stored under `model/util/<context>/`, for example `model/util/battle/`.

On top of these contexts, there are a couple other important functionality scripts that exist within the top level:
- state: The "main" file of the GSV. While technically not a context, manages everything and lives on the highest level.
- json_reader: Lua JSON module. As previously stated, this is also actually a global variable loaded when resolving state.lua.
- luawriter: Utility to write a Lua table to an importable Lua file. Mainly used for saving games and may move.
- testsuite: Testing utility for Lua code. Not built.

The text data of the game is found under the model as well, since only the model accesses it. The `model/data/` directory is organized as such:
- *data/chars/*: (Main) Characters and their stats.
- *data/days/*: All ~365 days to be played. More documentation on their definition within.
- *data/envs/*: Definitions of flags and other that are associated with each "env", corresponding more or less to a UE level.
- *data/inline/*: Defines all non-Social Link cutscenes.
- *data/links/*: Definitions of all Social Links. One file per link for now.
- *data/pers/*: Definitions of all Personas (spoilers, shadows are Personas).
- *data/saves/*: Save files go here.
- *data/shops/*: Definition of each shop's options tree.
- *data/spells/*: Spell implementations.

The other files found directly in the *data/* directory represent various constants generally used by contexts. These are ones that don't particularly deserve a full folder to themselves, ie can be contained in a single file.

### Notes on Relative and Absolute File Paths
The relative import paths set by each Lua `require` call are handled and parsed by the Lua interpreter. There is little to no reason to set absolute paths in those cases as they are long and generally unreadable.

Unfortunately, `dofile` does not chare the same utility that `require` does for reasons that are beyond me. It will only accept absolute paths, or "absolute" relative paths (those being paths relative to the *process's* working directory). We must therefore rely on aquiring the absolute path to the `model/` directory  on runtime by getting the absolute path of state, since it is guarenteed to be `require`d. Unfortunately, Lua does not have this built in and C++, being it's usual shitty self, has no consistent way of doing so in the standard library. Seriously wtf is Python actually so good.

Anyway, luckily UE has a function to exposed the path to the executable (`BaseDir`) which can be used for official builds. When compiling the testsuites however, there are rules to be followed because of this:
- C++: `./processEvent.exe` where `processEvent.exe` is in the same directory as `model/`
- Lua: `lua model/testsuite.lua` where `testsuite.lua` is in the same directory as `state.lua`

# Building the Test Suites
OH BOY HERE WE GO
I can only half blame C++ for this since all these problems come more from using LuaJIT over Lua than any actual code issue. Note that this is all about just building the test suites, not the full program, since that part is largely more handled by UE and it's configuration. Provided in the repo are the vscode tasks required to build the program. The command being:
`g++ -std=c++11 -o processEvent.exe -I/usr/local/include/luajit-2.0 controller/testsuite.cpp -Wl,/usr/local/lib/libluajit-5.1.so -Wl,-rpath='/usr/local/lib/' -ldl`
- `std=c++11`: is required for stuff. It should probably be c++14 anyway (or whatever the latest is), but the "real" c++ dependencies are handled by the UE release, so this is purely to support the cobbled-together C++ parts of the tests, most of which will not be anything like the real game implementation.
- `-I/usr/local/include/luajit-2.0`: Replace with the appropriate path, of course, but must point to the include files generated when building the required config of LuaJIT (as explained below)
- `-Wl,/usr/local/lib/libluajit-5.1.so`: LuaJIT install does not necessarily put the libraries in the correct dynamic linked paths (check with `ldconfig -v`). For linking the dynamic library on compile time, we need to specify the exact path of the LuaJIT dynamic library generated when building with GCC.
- `-Wl,-rpath='/usr/local/lib/'`: Set the required path to the libraries dynamically loaded by LuaJIT during runtime. I was under the impression that the so.2 and so.2.0.5 generated were all symlinks to each other, but apparently that can't be the case since nothing will run without access to all of them.

AND DON'T FORGET
Lua packages installed with Luarocks go to a default include that is probably not set correctly in the LuaJIT package path. Make sure that the LUA_PATH on runtime includes the Luarocks install directory or everything will panic.

# Requirements

## LuaJIT Build
OH BOY HERE WE GO
LuaJIT is based on the ostensibly more popular Lua 5.1 releases than the latest 5.4 releases. Unfortunately, there is at least one important feature that we need from Lua 5.2 that does not come by default with LuaJIT.
Luckily for us, God-King Mike has a build key that allows certain 5.2 functionality (including the one we want) to be included in LuaJIT. This is not included in most standard releases of LuaJIT though, and so we compile it ourselves using an edited Makefile. Note that *both static and dynamic libraries need to be built*.

The only change (for now) is adding the `-DLUAJIT_ENABLE_LUA52COMPAT` key.

The edited Makefile for LuaJIT is included in this repo under `extlib/LuaJIT/src/`.

## Packages
This program was run and tested with the following utilities:
- LuaJIT 2.0.5 (custom)
- gcc 4.8.5

C++
- nlohmann/json 3.4

Lua Rocks
- luajson 1.3.4
- inspect 3.1.1
- luafilesystem 1.7.0
