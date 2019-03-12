local spell = {}
spell["desc"] = [[Small chance to counter physical attacks]]
spell["numericalvalue"] = 15
spell["passive"] = true
spell["name"] = [[Counter]]

function spell.activate()
    state.context.passive(spell, state.battle.participants[state.battle.open], state.battle.participants[state.battle.open], 99, "defendstatus")
end

function spell.process(uspell, damage)
    valid = {"Slash", "Strike", "Pierce"}
    if valid[uspell.element] and math.random(1, 100) < spell.numericalvalue then
        --no u
        state.battle.target = state.battle.open
    end
    return damage
end

return spell
