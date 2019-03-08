local spell = {}
spell["element"] = [[Ice]]
spell["desc"] = [[Raise resistance to ice damage to Null]]
spell["passive"] = true
spell["name"] = [[Null Ice]]

function spell.activate()
    state.context.passive(spell, state.battle.participants[state.battle.open], state.battle.participants[state.battle.open], 99, "defendstatus")
end

function spell.process(uspell, damage)
    if uspell.element == spell.element then
        return 0
    end
    return damage
end

return spell
