require('util/battle/battleturn')
function turn(open)
    --Actual Charm logic
    if state.party[state.battle.participants[state.battle.open].name] then
        state.battle.iparty[state.battle.open] = nil
        table.insert(state.battle.ienemy, state.battle.open)
    else
        state.battle.ienemy[state.battle.open] = nil
        table.insert(state.battle.iparty, state.battle.open)
    end
    
    --Charm always processes as thought the open participant is an AI
    ai(open)

    --Once this turn has been processed, revert the iindex change
    if state.party[state.battle.participants[state.battle.open].name] then
        state.battle.ienemy[state.battle.open] = nil
        table.insert(state.battle.iparty, state.battle.open)
    else
        state.battle.iparty[state.battle.open] = nil
        table.insert(state.battle.ienemy, state.battle.open)
    end
	return 0
end
