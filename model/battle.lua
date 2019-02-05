local battle = {}
require('util/battle/battlecost')
require('util/battle/battleattack')

--Taken from util battlecost
function battle.cost(costtype, pcost) cost(costtype, pcost) end

--We assume at the moment of attack that a target has already been established or isn't needed
--Taken from util battleattack
function battle.attack(spell, target, caster) attack(spell, target, caster) end

local function next()
	repeat
		state.battle.open = state.battle.open + 1
		if state.battle.open>#state.battle.participants then state.battle.open=1 end
	until 
		state.battle.participants[state.battle.open]
end

local function processEliminations()
	for index, participant in pairs(state.battle.participants) do
		if participant.hp < 0 then
			if state.party[participant.name] then
				--print("Removing "..state.battle.participants[index].name)
				--NEEDS DOC (__LEN ISSUE)
				if index == #state.battle.participants then	table.remove(state.battle.participants, index) else state.battle.participants[index]=nil end
				for i, partyindex in pairs(state.battle.iparty) do
					if partyindex == index then
						table.remove(state.battle.iparty, i)
					end
				end
			else
				print("Removing "..state.battle.participants[index].name)
				state.battle.participants[index]=nil
				for i, enemyindex in pairs(state.battle.ienemy) do
					if enemyindex == index then
						table.remove(state.battle.ienemy, i)
					end
				end
			end
		end
	end
	ins = require('inspect')
	print(ins(state.battle.iparty))
	print(ins(state.battle.ienemy))
	print(ins(state.battle.participants))
end

local function spellitout(participant, spellindex)
	--Acquire spell
	spell = require("data/spells/"..participant.persona.spellDeck[spellindex])
	--print(shadow.persona.name.." used "..shadow.persona.spellDeck[spelli])
	--Tree powers activate
	spell.activate()
	processEliminations()
end

local function ai(shadow)
	local spelli = 0
	repeat
		spelli = math.random(8)
	until
		shadow.persona.spellDeck[spelli] ~= "" and shadow.persona.spellDeck[spelli]

	state.battle.target=state.battle.iparty[math.random(1, #state.battle.iparty)]

	spellitout(shadow, spelli)
end

local function turn(input)
	state.battle.turns = {}
	if state.context.key == "battle.userinput" then
		--print("Processing user input")
		state.battle.target = state.context.targetindex
		spellitout(state.battle.participants[state.battle.open], state.context.spellindex)
		next()
	end
	--While it is not guarenteed that it is an AI's turn, we know that Lua will not process
	--a player turn until next input, which wil reset the key
	state.context.key = "battle.ai"
	--While it is neither the player's turn nor the whole party died, parse the AI
	while not state.party[state.battle.participants[state.battle.open].name] and #state.battle.iparty > 0 do
		ai(state.battle.participants[state.battle.open])
		next()
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
	state.battle.participants = {} -- GIGAOOF
	--Load party persona files
	for i, person in pairs(state.party) do
		state.battle.participants[#state.battle.participants+1] = person
	end
	--Load enemy persona files
	for i, shadow in pairs(state.battle.enemies) do
		state.battle.participants[#state.battle.participants+1] = {persona=require("data/pers/"..shadow.name), name=shadow.name, hp=shadow.hp, sp=shadow.sp}
	end
	determineorder()
	setmetatable(state.battle.participants, {__is_luajson_array=true})
	state.battle.open=1
end

function battle.refresh(update)
	print(json.encode(state.battle.participants))
	state.update = json.encode(state.battle)
end

function battle.exposeSpellData()
	spellname = state.battle.participants[state.battle.open].persona.spellDeck[state.context.spellDataRequest]
	spellData = {target=require("data/spells/"..spellname).target, key=state.context.key}
	state.update = json.encode(spellData)
end

function battle.processinput()
	if state.context.key == "battle.spellrequest" then battle.exposeSpellData() return end
	--Input in {spellindex=X, targetindex=Y} form
    turn()
	battle.refresh()
end

function battle.loadcontext(powerlevel)
	math.randomseed(os.time())
	_load(powerlevel)
	print("loading")
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
