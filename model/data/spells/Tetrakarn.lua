local spell = {}
spell["element"] = [[Support]]
spell["cost"] = 55
spell["desc"] = [[Repels the next physical attack back towards the enemy]]
spell["target"] = [[One Ally]]
spell["name"] = [[Tetrakarn]]
spell["costtype"] = [[SP]]
spell["blurb"] = [[ has a physical shield!]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 99, "defendstatus")
end

function spell.process(uspell, damage)
    valid = {"Slash", "Strike", "Pierce"}
    if valid[uspell.element] then
        state.battle.target = state.battle.open
        --Once activated, status is popped
        state.battle.participants[state.battle.target]["defendstatus"][spell.name] = nil
    end
    return damage
end

return spell
