require('util/battle/battleturn')
function turn(open)
    --Rage always processes as though the open participant is an AI
    if state.party[state.battle.participants[state.battle.open].name] then targets = state.battle.iparty else targets = state.battle.ienemy end
    state.battle.target=targets[math.random(1, #targets)]
    --TODO: Rage forces participant to physically attack someone twice
    --May also boost attack in the future. iirc it does that in P3
    --beatitout(weapon)
    --beatitout(weapon)
    return 0
end
