local spell = {}
spell["element"] = [[Dark]]
spell["desc"] = [[Raise resistance against dark attacks to 'Repel']]
spell["passive"] = true
spell["name"] = [[Repel Dark]]

function spell.activate()
    state.context.passive(spell, state.battle.participants[state.battle.open], state.battle.participants[state.battle.open], 99, "defendstatus")
end

function spell.process(uspell, damage)
    if uspell.element == spell.element then
        --no u
        state.battle.target = state.battle.open
    end
    return damage
end

return spell
