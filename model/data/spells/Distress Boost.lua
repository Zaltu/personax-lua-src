local spell = {}
spell["element"] = [[Status]]
spell["desc"] = [[Raises chance to distress the enemy]]
spell["passive"] = true
spell["numericalvalue"] = 0.25
spell["name"] = [[Distress Boost]]
spell["status"] = [[Distress]]

function spell.activate()
    state.context.passive(spell, state.battle.participants[state.battle.open], state.battle.participants[state.battle.open], 99, "dodgestatus")
end

function spell.process(uspell, basehitchance, istarget)
    if uspell.status ~= spell.status then return 0 end
    if istarget then
        return 0
    end
    return basehitchance * spell.numericalvalue
end

return spell
