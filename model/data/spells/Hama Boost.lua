local spell = {}
spell["element"] = [[Light]]
spell["desc"] = [[Raises chance of killing with Light attacks]]
spell["passive"] = true
spell["name"] = [[Hama Boost]]
spell["numericalvalue"] = 0.25

function spell.activate()
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 3, "dodgestatus")
end

function spell.process(uspell, basehitchance, istarget)
    if uspell.element == spell.element and not istarget then
        return basehitchance * spell.numericalvalue
    end
    return 0
end

return spell
