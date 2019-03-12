local spell = {}
spell["element"] = [[Status]]
spell["cost"] = 15
spell["desc"] = [[Raises chance to inflict statuses on the enemy]]
spell["target"] = [[All Enemy]]
spell["name"] = [[Stagnant Air]]
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    if state.party[state.battle.participants[state.battle.open]] then
        targets = state.battle.iparty
    else
        targets = state.battle.ienemy
    end
    for _, index in pairs(targets) do
        state.context.passive(spell, state.battle.participants[index], state.battle.participants[state.battle.open], 3, "dodgestatus")
    end
end

function spell.process(uspell, basehitchance, istarget)
    if not uspell.status then return 0 end
    if istarget then
        return 0
    end
    return basehitchance * spell.numericalvalue
end

return spell
