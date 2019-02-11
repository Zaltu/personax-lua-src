local spell = {}
spell = {}
spell["element"] = [[Support]]
spell["cost"] = 6
spell["desc"] = [[Boosts attack power of one ally]]
spell["target"] = [[One Ally]]
spell["name"] = [[Tarukaja]]
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open])
end

function spell.process(uspell, damage)
    invalid = {"Dark", "Light", "Support"}
    if invalid[uspell.element] then return end
    return damage * 1.5
end

return spell
