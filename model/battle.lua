local battle = {}
require('util/battle/battlecost')
require('util/battle/battleattack')

--Taken from util battlecost
function battle.cost(costtype, pcost) cost(costtype, pcost) end

--We assume at the moment of attack that a target has already been established or isn't needed
--Taken from util battleattack
function battle.attack(spell, target, caster)
	attack(spell, target, caster)
end

local function spellitout(participant, spellindex)
	--Acquire spell
	spell = require("data/spells/"..participant.persona.spellDeck[spellindex])
	--print(shadow.persona.name.." used "..shadow.persona.spellDeck[spelli])
	--Tree powers activate
	spell.activate()
end

local function ai(shadow)
	local spelli = 0
	repeat
		spelli = math.random(8)
	until
		shadow.persona.spellDeck[spelli] ~= "" and shadow.persona.spellDeck[spelli]

	repeat
		state.battle.target=math.random(1, #state.battle.participants)
	until
		state.party[state.battle.participants[state.battle.target].name]
	
	spellitout(shadow, spelli)
end

local function turn(input)
	state.battle.turns = {}
	if state.context.key == "battle.userinput" then
		state.context.key = "battle.ai"
		--print("Processing user input")
		state.battle.target = state.context.targetindex
		spellitout(state.battle.participants[state.battle.open], state.context.spellindex)
		state.battle.open=state.battle.open+1
		if state.battle.open>#state.battle.participants then state.battle.open=1 end
	end
	while not state.party[state.battle.participants[state.battle.open].name] do
		ai(state.battle.participants[state.battle.open])
		state.battle.open=state.battle.open+1
		if state.battle.open>#state.battle.participants then state.battle.open=1 end
		--print("Next participant: "..state.battle.participants[state.battle.open].name.."\n")
	end
	--print("Next participant: "..state.battle.participants[state.battle.open].name.."\n")
end

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
	state.battle.iparty = {}
	state.battle.ienemy = {}
	for index, participant in pairs(state.battle.participants) do
		if state.party[participant.name] then
			table.insert(state.battle.iparty, index)
		else
			table.insert(state.battle.ienemy, index)
		end
	end
end

local function _load(powerlevel)
	state.battle = {powerlevel=powerlevel}
	spawnenemies()
	state.battle.participants = {}
	--Load party persona files
	for i, person in pairs(state.party) do
		state.battle.participants[#state.battle.participants+1] = person
	end
	--Load enemy persona files
	for i, shadow in pairs(state.battle.enemies) do
		state.battle.participants[#state.battle.participants+1] = {persona=require("data/pers/"..shadow.name), name=shadow.name, hp=shadow.hp, sp=shadow.sp}
	end
	determineorder()
	state.battle.open=1
end

function battle.refresh(update)
	state.update=json.encode(state.battle)
end


function battle.processinput()
	--Input in {spellindex=X, targetindex=Y} form
    turn()
	battle.refresh()
end

function battle.loadcontext(powerlevel)
	math.randomseed(os.time())
	_load(powerlevel)
	turn()
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
