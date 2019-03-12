local spell = {}
spell["element"] = [[Status]]
spell["cost"] = 15
spell["desc"] = [[Raises chance of inflicting status ailments on everyone]]
spell["target"] = [[All]]
spell["name"] = [[Foul Breath]]
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    for _, participant in pairs(state.battle.participants) do
        state.context.passive(spell, participant, state.battle.participants[state.battle.open], 3, "dodgestatus")
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
