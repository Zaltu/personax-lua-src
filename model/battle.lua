local battle = {}


local function turnAI()
	if state.battle.party[state.battle.participants[state.battle.open].name] then
		print(state.battle.participants[state.battle.open].name.." used Myriad Arrows!")
		state.battle.open=state.battle.open+1
		if state.battle.open>#state.battle.participants then state.battle.open=1 end
		print("Next participant: "..state.battle.participants[state.battle.open].name.."\n")
	end
	while state.battle.party[state.battle.participants[state.battle.open].name]==nil do
		state.lock()
		ai(state.battle.participants[state.battle.open])
		state.battle.open=state.battle.open+1
		if state.battle.open>#state.battle.participants then state.battle.open=1 end
		battle.refresh()
		print("Next participant: "..state.battle.participants[state.battle.open].name.."\n")
	end
	state.unlock()
end


--In dungeon 1, first half:
--1 = [{small small small}] (same weaknesses)
--2 = [{big}]
--3 = [{small small}] (different weaknesses)
--In dungeon 1, second half with levels ++:
--4 = [{small small small}] (same weaknesses)
--5 = [{big}]
--6 = [{small small}] (different weaknesses)
--etc...
--Property of the dungeon imo, should be in the dungeon env config
local function spawnenemies()
end

local function detorder()
	local done=false
	while not done do
		done=true
		for i=1, #state.battle.participants do
			if tonumber(state.battle.participants[i].persona.stats[3])<tonumber(state.battle.participants[i+1].persona.stats[3]) then
				temp=state.battle.participants[i]
				state.battle.participants[i]=state.battle.participants[i+1]
				state.battle.participants[i+1]=temp
				done=false
			end
		end
	end
end

local function _load(powerlevel)
	state.battle = {powerlevel=powerlevel}
	state.battle.enemies = {}
	state.battle.participants = state.party
    spawnenemies()
    state.battle.open = 1
	detorder()
end

function battle.refresh(update)
	state.update=json.encode({'None'})
end

function battle.processinput(input)
    turnAI()
end

function battle.loadcontext(powerlevel)
	math.randomseed(os.time())
	_load(powerlevel)
	battle.refresh()
end

return battle


--[[
- battle setup
- user turn
- select spell (UE) (menu menu)
- send spell selection
- parse spell
- if targeted, request target
- else activate
- ene turn
- auto-select spell/target
- activate spell
]]
