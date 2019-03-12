local spell = {}
spell["element"] = [[Slash]]
spell["desc"] = [[Raise resistance against slash attacks to 'Drain']]
spell["passive"] = true
spell["name"] = [[Drain Slash]]

function spell.activate()
    state.context.passive(spell, state.battle.participants[state.battle.open], state.battle.participants[state.battle.open], 99, "defendstatus"))
end

function spell.process(uspell, damage)
    if uspell.element == spell.element then
        return -damage
    end
    return damage
end

return spell
