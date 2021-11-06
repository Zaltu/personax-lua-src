function removeParticipant(index, name)
	if state.party[name] then
		--print("Removing "..state.battle.participants[index].name)
		state.battle.participants[index]=nil
		for i, partyindex in pairs(state.battle.iparty) do
			if partyindex == index then
				table.remove(state.battle.iparty, i)
			end
		end
	else
		--print("Removing "..state.battle.participants[index].name)
		state.battle.participants[index]=nil
		for i, enemyindex in pairs(state.battle.ienemy) do
			if enemyindex == index then
				table.remove(state.battle.ienemy, i)
			end
		end
	end
end

function processEliminations()
	for index, participant in pairs(state.battle.participants) do
		if participant.hp < 0 then
			removeParticipant(index, participant.name)
		end
	end
	--ins = require('inspect')
	--print(ins(state.battle.iparty))
	--print(ins(state.battle.ienemy))
	--print(ins(state.battle.participants))
end

function spellitout(participant, spellname)
	--Acquire spell
	spell = require("data/spells/"..spellname)
	--print(shadow.persona.name.." used "..shadow.persona.spellDeck[spelli])
	--Tree powers activate
	spell.activate()
	processEliminations()
end

function beatitout(participant)
	--Acquire phys attack pseudo-spell
	weapon = require("data/equip/weapon/"..participant.weapon)
	--print(shadow.persona.name.." used "..shadow.persona.spellDeck[spelli])
	--Tree powers activate
	weapon.activate()
	processEliminations()
end

function ai(shadow)
	--TODO change based passive spells
	local spelli = 0
	repeat
		spelli = math.random(9)
	until
		(shadow.persona.spellDeck[spelli] ~= "" and shadow.persona.spellDeck[spelli] and not require("data/spells/"..shadow.persona.spellDeck[spelli]).passive) or spelli == 9

	--For when a party member is ai-controlled
	if state.party[state.battle.participants[state.battle.open].name] then
		targets = state.battle.ienemy
		allies = state.battle.iparty
	else
		targets = state.battle.iparty
		allies = state.battle.ienemy
	end

	--Omegaoof
	if spelli == 9 then
		beatitout(shadow)
	else
		spell = require("data/spells/"..shadow.persona.spellDeck[spelli])
		if spell.target == "One Enemy" then
			state.battle.target=targets[math.random(1, #targets)]
		elseif spell.target == "One Ally" then
			state.battle.target=allies[math.random(1, #allies)]
		end
		spellitout(shadow, spelli)
	end
end

function normalturn()
	--ins = require('inspect')
	--print(ins(state.battle.iparty))
	--print("Open: "..state.battle.open)
	--print("Spellname: ", state.context.spellname)
	if state.party[state.battle.participants[state.battle.open].name] then
		--print("Processing user input")
		--If we don't have a valid input for this participant, break the cycle.
		if not state.context.spellname and not state.context.hitindex then return 1 end
		if state.context.targetindex ~= -1 then  -- Passing nullptr over C/Lua acts weird. Set -1 as convention
			state.battle.target = state.context.targetindex
		end
		if state.context.spellname then
			spellitout(state.battle.participants[state.battle.open], state.context.spellname)
		else
			beatitout(state.battle.participants[state.battle.open])
		end
		--Reset battle target so it's not reused in following All <Side> spells
		state.context.targetindex = nil
	else
		ai(state.battle.participants[state.battle.open])
		--print("Next participant: "..state.battle.participants[state.battle.open].name.."\n")
	end
	return 0
end
