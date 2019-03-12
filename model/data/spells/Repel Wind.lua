local spell = {}
spell["element"] = [[Wind]]
spell["desc"] = [[Raise resistance against wind attacks to 'Repel']]
spell["passive"] = true
spell["name"] = [[Repel Wind]]

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
