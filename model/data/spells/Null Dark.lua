local spell = {}
spell["element"] = [[Dark]]
spell["desc"] = [[Raise resistance to dark damage to Null]]
spell["passive"] = true
spell["name"] = [[Null Dark]]

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
