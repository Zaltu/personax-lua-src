--LEGACY/TEST PROOF OF CONCEPT
local battle = {}

local function target(who)
	local state = require('state')
	if state.battle.party[state.battle.participants[state.battle.open]] then
		state.battle.target=1
		return--USER NEEDS TO MAKE A CHOICE
	end
	if who=='One Enemy' then
		repeat
			state.battle.target=math.random(1, #state.battle.participants)
		until
			state.battle.party[state.battle.participants[state.battle.target].name]
	else
		repeat
			state.battle.target=math.random(1, #state.battle.participants)
		until
			state.battle.ene[state.battle.participants[state.battle.target].name]
	end
	print("Shadow is targeting "..state.battle.participants[state.battle.target].name)
end

local function ai(shadow)
	local spelli = 0
	repeat
		spelli = math.random(1, 8)
	until
		shadow.persona.spellDeck[spelli] and not shadow.persona.spellDeck[spelli].passive
	target('One Enemy')
	print("Shadow used "..shadow.persona.spellDeck[spelli].name..", but nothing happened!")
	--dofile(shadow.persona.spelldeck[spelli])
end


function resolveresistances(element, target)
end

local function loadpersona(persona)
	local state = require('state')
	for i=1, #persona.spellDeck do
		persona.spellDeck[i]=state.battle.spells[persona.spellDeck[i]]
	end
	for key, value in pairs(persona.spellDeck) do print(key, value.name) end
end

local function loadpersonas()
	local json = require('json_reader')
	local state = require('state')
	state.battle.spells=json.read({file='spells.json'})
	for i=1, #state.battle.participants do loadpersona(state.battle.participants[i].persona) print("\n") end
end

local function turn()
	local state = require('state')
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

local function detorder()
	local state = require('state')
	local done=false
	while not done do
		done=true
		for i=1, #state.battle.participants-1 do
			if tonumber(state.battle.participants[i].persona.stats[2])<tonumber(state.battle.participants[i+1].persona.stats[2]) then
				temp=state.battle.participants[i]
				state.battle.participants[i]=state.battle.participants[i+1]
				state.battle.participants[i+1]=temp
				done=false
			end
		end
	end
	state.battle.open = 1
	for i=1, #state.battle.participants do print(state.battle.participants[i].persona.name, state.battle.participants[i].persona.agi) end
end

local function _load(inst)
	local state = require('state')
	state.battle={}
	state.battle.party={}
	state.battle.ene={}
	state.battle.participants = {}
	for i=1, #inst.party do state.battle.party[inst.party[i].name]=true state.battle.participants[#state.battle.participants+1]=inst.party[i] end
	for i=1, #inst.ene do state.battle.ene[inst.ene[i].name]=true state.battle.participants[#state.battle.participants+1]=inst.ene[i] end
	detorder()
	loadpersonas()
	print("\nBattle Start!\n")
	if state.battle.ene[state.battle.participants[state.battle.open].name] then turn() end
end


function battle.refresh(update)
	local state = require('state')
	state.update={'None'}
end

function battle.processinput(input)
	local state = require('state')
	if input=='select' then
		turn()
	end
end

function battle.loadcontext(inst)
	math.randomseed(os.clock()*100000000000)
	local state = require('state')
	state.context=battle
	_load(inst)
	battle.refresh()
end

return battle