--DATAPATH is set during Lua initialization is C++ normally. This is for the testsuites.
if not DATAPATH then _G.DATAPATH = "model/data/" end
--JSON and state itself are both accessed in every possible call made to the GSV,
--so I set them as global variables.
_G.json = require('json')
_G.state = {}

--TODO rewrite
function state.loadstate(savefile)
	if savefile then savefile="PXS"..savefile..".lua" else savefile='model/data/saves/savestate.lua' end
	loadedstate = dofile(savefile)
	for key, value in pairs(loadedstate) do state[key]=value end
end

--TODO rewrite
function state.savestate(savefile)
	if savefile then savefile="PXS"..savefile..".json" state.evolve('save', savefile) else savefile='model/data/saves/savestate.lua' end
	local luawriter = require('luawriter')
	luawriter.convert(state, savefile)
end

--[[
AFAIK unused helper function to set the value of a certain key of state. Might be
removed, or might be used on state initialization. This function was initially
designed for when state was not a global variable. TBD.

:param str key: state[key] to be updated
:param any value: value to be set
]]--
function state.evolve(key, value)
	state[key] = value
end

--[[
Raises a flag. Flags are used mainly when changing contexts and when determining what
to load when changing envs. Currently, flags are absolute binary values. Meaning that
raising a flag sets it to true permanently (for that save)

:param str flag: the key of the flag to raise
]]--
function state.flag(flag)
	state.flags[flag] = true
end

--[[
The Big E itself. Recieves a JSON-formatted string as an event, breaks down each key
as a state.context value and notifies the current context that an event needs to be
processed.

:param str event: JSON-formatted event string
:returns: 0 if processed normally, "State is locked" message if the state is not in a state :^) hon hon to process the event.
:rtype: str *in both cases*
]]--
function state.event(event)
	if state.locked==true then return "State is locked" end
	state.lock()
	local map = json.decode(event)
	for key, value in pairs(map) do state.context[key]=value end
	state.context.processinput()
	state.unlock()
	return "0"
end

--[[
The big C itself. Loads up a new context in which to process events. This is a major runtime
change and should probably be considered where most errors are likely to come from, despite
only being a 3-line function. This should never be called directly by Unreal, only indirectly
from an event call.

There is no state.lock here as we assume that any call to changecontext will be effected
through a state.event processinput call
]]--
function state.changecontext(newc, ...)
	state.update = nil
	print("state update now:")
	print(state.update)
	state.context = require(newc)
	state.context.loadcontext(...)
end

--[[
The second big E itself. Loads a new Unreal level and contains the flag handling and loading
requests as well as capsule collision action context switching. This should be the single Lua
function that calls C++, in order to request resource loading. It should be considered the second
most likely function to cause errors.

:param str env: the env to load
]]--
function state.loadenv(env)
	state.loading(true, env)
	--dofile'd so flags are rechecked every time an environment is entered.
	state.env = dofile(DATAPATH.."envs/"..env..".lua")
	for flag, action in pairs(state.env) do
		if state.flags[flag] then action() end
	end
	state.loading(false, env)
end

--TODO rewrite
function state.loading(start, contextname)
	if not start then state.isloading=true print("Loading "..contextname.." complete") return end--Loading complete
	state.isloading=nil
	print("Loading "..contextname.."...")--Send loading request to graphics
end


--[[
Lock and unlock the state. This prevents events from being processed.
Having two functions is a bit redundant but idgaf
]]--
function state.lock() state.locked=true end
function state.unlock()	state.locked=false end

--Note that no return is needed as state sets itself as a global variable.
