local spell = {}
spell["element"] = [[Wind]]
spell["desc"] = [[Raise resistance to wind damage to Null]]
spell["passive"] = true
spell["name"] = [[Null Wind]]

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
