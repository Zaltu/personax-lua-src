local spell = {}
spell["element"] = [[Heal]]
spell["desc"] = [[Greatly increase effectiveness of heal spells]]
spell["passive"] = true
spell["name"] = [[Divine Grace]]
spell["numericalvalue"] = 0.5

function spell.activate()
    state.context.passive(spell, state.battle.participants[state.battle.open], state.battle.participants[state.battle.open], 99, "attackstatus")
end

function spell.process(uspell, damage)
    if uspell.element == spell.element then
        return damage + damage * spell.numericalvalue
    end
    return damage
end


return spell
