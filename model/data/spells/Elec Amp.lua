local spell = {}
spell = {}
spell["element"] = [[Elec]]
spell["desc"] = [[Greatly raises damage of all electric attacks]]
spell["passive"] = true
spell["name"] = [[Elec Amp]]
spell["numericalvalue"] = 1.5

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 99, "attackstatus")
end

function spell.process(uspell, damage)
    if uspell.element == spell.element then
        return damage * spell.numericalvalue
    end
    return damage
end

return spell
