local spell = {}
spell["element"] = [[Elec]]
spell["desc"] = [[Raise resistance against electric attacks to 'Drain']]
spell["passive"] = true
spell["name"] = [[Drain Elec]]

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
