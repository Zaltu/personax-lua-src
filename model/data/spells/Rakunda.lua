local spell = {}
spell = {}
spell["element"] = [[Support]]
spell["cost"] = 6
spell["desc"] = [[Lowers defence of one foe]]
spell["target"] = [[One Enemy]]
spell["name"] = [[Rakunda]]
spell["costtype"] = [[SP]]
spell["numericalvalue"] = 1.5

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 3, "defendstatus")
end

function spell.process(uspell, damage)
    invalid = {"Dark", "Light", "Support"}
    if invalid[uspell.element] then return damage end
    return damage * spell.numericalvalue
end

return spell
