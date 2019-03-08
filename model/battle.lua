local battle = {}
require('util/battle/battlecost')
require('util/battle/battleattack')
require('util/battle/battlepassive')
require('util/battle/battleturn')

--Taken from util battlecost
function battle.cost(costtype, pcost) cost(costtype, pcost) end

--Taken from battlepassive
function battle.passive(spell, target, caster, turns, statustype) passive(spell, target, caster, turns, statustype) end

--We assume at the moment of attack that a target has already been established or isn't needed
--Taken from util battleattack
function battle.attack(spell, target, caster) attack(spell, target, caster) end

local function next()
	if state.battle.participants[state.battle.open] and state.battle.participants[state.battle.open].oncemore then
		table.insert(state.battle.turns, {{caster=state.battle.participants[state.battle.open], oncemore=true}})
		state.battle.participants[state.battle.open].oncemore = nil
		return
	end
	--Taken from battlepassive
	countdownpassives()
	repeat
		state.battle.open = state.battle.open + 1
		if state.battle.open>#state.battle.participants then state.battle.open=1 end
	until 
		state.battle.participants[state.battle.open]

	if state.battle.participants[state.battle.open].down then
		table.insert(state.battle.turns, {{caster=state.battle.participants[state.battle.open], getup=true}})
		state.battle.participants[state.battle.open].down = nil
		next()
	end
end

function participants_len(tab)
    last = 0
    for index, _ in pairs(tab) do
        last = index
    end
    return last
end


local function turn()
	state.battle.turns = {}
	while #state.battle.iparty>0 and #state.battle.ienemy>0 do
		if state.battle.participants[state.battle.open].status then
			code = require("data/spells/status/"..state.battle.participants[state.battle.open].status).turn(state.battle.participants[state.battle.open])
		else
			--Taken from battleturn
			code = normalturn()
		end
		--Make sure spellindex isn't carried over accross participant turns
		state.context.spellindex = nil
		if code == 1 then
			--Require input
			break
		end
		next()
	end
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
		state.battle.participants[#state.battle.participants+1] = {
			persona=person.persona,
			name=person.name,
			hp=person.hp,
			maxhp=person.maxhp,
			sp=person.sp,
			maxsp=person.maxsp,
			turnstatus={},
			attackstatus={},
			defendstatus={},
			dodgestatus={},
			endstatus={}
		}
	end
	--Load enemy persona files
	for i, shadow in pairs(state.battle.enemies) do
		state.battle.participants[#state.battle.participants+1] = {
			persona=require("data/pers/"..shadow.name),
			name=shadow.name,
			hp=shadow.hp,
			maxhp=shadow.hp,
			sp=shadow.sp,
			maxsp=shadow.sp,
			turnstatus={},
			attackstatus={},
			defendstatus={},
			dodgestatus={}
		}
	end
	determineorder()
	state.battle.open=1
	state.battle.turns = {}
	--Taken from battlepassive
	battlepassives()
end

function battle.refresh(update)
	--print(json.encode(state.battle.participants))
	setmetatable(state.battle.participants, {__len=participants_len}) -- GIGAOOF
	state.update = json.encode(state.battle)
	setmetatable(state.battle.participants, nil) -- GIGAOOF
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
- end turn
- auto-select spell/target
- activate spell
]]
