local battle = {}


local function target(who)
	if state.party[state.battle.participants[state.battle.open]] then
		state.battle.target=1
		return--USER NEEDS TO MAKE A CHOICE
	end
	state.battle.target=math.random(1, #state.battle.participants)
	print("Shadow is targeting "..state.battle.participants[state.battle.target].name)
end

local function ai(shadow)
	local spelli = 0
	repeat
		spelli = math.random(8)
	until
		shadow.persona.spellDeck[spelli] ~= "" and shadow.persona.spellDeck[spelli]
	target('One Enemy')
	--ins = require('inspect')
	--print(ins(shadow.persona.spellDeck[spelli]))
	print("Shadow used "..shadow.persona.spellDeck[spelli]..", but nothing happened!")
	--dofile(shadow.persona.spelldeck[spelli])
end

local function turnAI()
	if state.party[state.battle.participants[state.battle.open].name] then
		print(state.battle.participants[state.battle.open].name.." used Myriad Arrows!")
		state.battle.open=state.battle.open+1
		if state.battle.open>#state.battle.participants then state.battle.open=1 end
		print("Next participant: "..state.battle.participants[state.battle.open].name.."\n")
	end
	while not state.party[state.battle.participants[state.battle.open].name] do
		ins = require('inspect')
		print(ins(state.party))
		print(state.battle.participants[state.battle.open].name)
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
	-- Get a random set of enemies from the powerleveled list in the current dungeon env
	state.battle.enemies = state.env.enemies[state.battle.powerlevel][math.random(1, #state.env.enemies[state.battle.powerlevel])]
end

local function determineorder()
	local done=false
	while not done do
		done=true
		for i=1, #state.battle.participants-1 do
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
	spawnenemies()
	state.battle.participants = {}
	--Load party persona files
	for i, person in pairs(state.party) do
		state.battle.participants[#state.battle.participants+1] = {persona=require("data/pers/"..person.persona), name=person.firstname}
	end
	--Load enemy persona files
	for i, shadow in pairs(state.battle.enemies) do
		state.battle.participants[#state.battle.participants+1] = {persona=require("data/pers/"..shadow), name=shadow}
	end
	determineorder()
	state.battle.open=1
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
	turnAI()
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
