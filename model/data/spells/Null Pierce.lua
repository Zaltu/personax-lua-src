local spell = {}
spell = {}
spell["element"] = [[Pierce]]
spell["desc"] = [[Raise resistance to pierce damage to Null]]
spell["passive"] = true
spell["name"] = [[Null Pierce]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 99, "defendstatus")
end

function spell.process(uspell, damage)
    if uspell.element == spell.element then
        return 0
    end
    return damage
end

return spell
