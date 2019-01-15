_G.json = require('json_reader')
local luawriter = require('luawriter')
_G.state = {}

state.flags = {}
state.Version = "0.0.0.0.1"
state.cut = nil
state.date = {}
state.date.day = 1
state.date.time = 0
state.slglobal = require("data/slglobal")
state.mc = {}
state.availablechars = {state.mc}
state.party = {state.mc}
state.env = nil
state.save = 0
state.context = nil


function state.loadstate(savefile)
	if savefile then savefile="PXS"..savefile..".lua" else savefile='data/saves/savestate.lua' end
	loadedstate = require(savefile)
	for key, value in pairs(loadedstate) do state[key]=value end
end


function state.savestate(savefile)
	if savefile then savefile="PXS"..savefile..".json" state.evolve('save', savefile) else savefile='data/saves/savestate.lua' end
	luawriter.convert(state, savefile)
end


function state.evolve(key, value)
	state[key] = value
end


function state.flag(f)
	state.flags[#state.flags] = f
end


function state.event(event)
	if state.locked==true then state.eventcallerror="State is locked" return "State is locked" end
	state.lock()
	local map = json.decode(event)
	for key, value in pairs(map) do state.context[key]=value end
	state.context.processinput()
	state.unlock()
	return "0"
end


--There is no state.lock here as we assume that any call to changecontext will be effected
--through a state.event processinput call
function state.changecontext(newc, ...)
	state.loading(true, newc)
	state.inline=nil
	state.context = require(newc)
	state.context.loadcontext(...)
	state.loading(false, newc)
end


function state.loadenv(env)
	state.env = require(env)
	for flag, action in pairs(state.env) do
		if state.flags[flag] then action() end
	end
end


function state.loading(start, contextname)
	if not start then state.isloading=true print("Loading "..contextname.." complete") return end--Loading complete
	state.isloading=nil
	print("Loading "..contextname.."...")--Send loading request to graphics
end


--Having two functions is a bit redundant but idgaf
function state.lock() state.locked=true end
function state.unlock()	state.locked=false end

--This file defines all global variables that are callable from the controller or that need
--to be cached for further use. The following are all know values that can be contextually
--found within state and their significance.

--Version: Game version. Currently 0.0.0.0.X
--cut: The current cutscene being played.
--date: Current day's id (~1-365) and time (Early Morning, After School, etc...)
--slglobal: Current level and angle of each social link in the game
--availablechars: Names of characters that can be in the party
--party: Characters other than MC that are in the party (and all their data)
--mc: All data about the Main Character
--env: Current environment/place.
--flags: List of all flags that have been raised as of now. (perform "need in flags" for dependancy check)
--save: The save number (1-inf)
--context: What the player is doing now and the input processor for that context
--backlog: The last key pressed. No inputs are saved unless this value is nil LEGACY?


--Current Existing contexts:
--link: Any cutscene (Social Link, Story or Event)
--shop: any kind of shop in the game
--calendar: date/time change
--freeroam
--dungeon

--Possible contexts:
--link: Social Link
--inline: any other cutscene
--freeroam: Overworld (Separated into ENVs)
--dungeon: Dungeon
--battle: Battle
--velvet: Velvet Room
--shop: any kind of shop in the game
--calendar: date/time change