function processEliminations()
	for index, participant in pairs(state.battle.participants) do
		if participant.hp < 0 then
			if state.party[participant.name] then
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
	end
	--ins = require('inspect')
	--print(ins(state.battle.iparty))
	--print(ins(state.battle.ienemy))
	--print(ins(state.battle.participants))
end

function spellitout(participant, spellindex)
	--Acquire spell
	spell = require("data/spells/"..participant.persona.spellDeck[spellindex])
	--print(shadow.persona.name.." used "..shadow.persona.spellDeck[spelli])
	--Tree powers activate
	spell.activate()
	processEliminations()
end

function ai(shadow)
	--TODO change based on spell targeting and passive spells
	local spelli = 0
	repeat
		spelli = math.random(8)
	until
		shadow.persona.spellDeck[spelli] ~= "" and shadow.persona.spellDeck[spelli] and not require("data/spells/"..shadow.persona.spellDeck[spelli]).passive

	spell = require("data/spells/"..shadow.persona.spellDeck[spelli])
	if spell.target == "One Enemy" then
		state.battle.target=state.battle.iparty[math.random(1, #state.battle.iparty)]
	elseif spell.target == "One Ally" then
		state.battle.target=state.battle.iparty[math.random(1, #state.battle.ienemy)]
	end


	spellitout(shadow, spelli)
end

function normalturn()
	ins = require('inspect')
	--print(ins(state.battle.iparty))
	--print("Open: "..state.battle.open)
	--print("Spellindex: ", state.context.spellindex)
	if state.party[state.battle.participants[state.battle.open].name] then
		--print("Processing user input")
		--If we don't have a valid input for this participant, break the cycle.
		if not state.context.spellindex then return 1 end
		state.battle.target = state.context.targetindex
		spellitout(state.battle.participants[state.battle.open], state.context.spellindex)
		--Reset battle target so it's not reused in following All <Side> spells
		state.context.targetindex = nil
	else
		ai(state.battle.participants[state.battle.open])
		state.battle.oncemore = nil
		--print("Next participant: "..state.battle.participants[state.battle.open].name.."\n")
	end
	return 0
end
