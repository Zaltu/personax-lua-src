local spell = {}
spell = {}
spell["element"] = [[Support]]
spell["cost"] = 6
spell["desc"] = [[Lowers attack power of one enemy]]
spell["target"] = [[One Enemy]]
spell["name"] = [[Tarunda]]
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open])
end

function spell.process(uspell, damage)
    invalid = {"Dark", "Light", "Support"}
    if invalid[uspell.element] then return end
    return damage * 0.5
end

return spell
