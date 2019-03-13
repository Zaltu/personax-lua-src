require('util/battle/battleturn')
function turn(open)
    --Panicked participants have a 10% chance of leaving the battle
    if math.random(1, 100) < 10 then
        removeParticipant(state.battle.open, state.battle.participants[state.battle.open].name)
        return 0
    end
    --Panic always processes as though the open participant is an AI
    ai(open)
	return 0
end
