local spell = {}
spell = {}
spell["element"] = [[Strike]]
spell["desc"] = [[Raise resistance against strike attacks to 'Strong']]
spell["passive"] = true
spell["name"] = [[Resist Strike]]
spell["numericalvalue"] = 0.5

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 99, "defendstatus")
end

function spell.process(uspell, damage)
    if uspell.element == spell.element then
        return damage * spell.numericalvalue
    end
    return damage
end

return spell
