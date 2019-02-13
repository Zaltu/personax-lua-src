local spell = {}
spell = {}
spell["element"] = [[Support]]
spell["cost"] = 6
spell["desc"] = [[Boosts attack power of one ally]]
spell["target"] = [[One Ally]]
spell["name"] = [[Tarukaja]]
spell["costtype"] = [[SP]]
spell["numericalvalue"] = 1.5

function spell.activate(free)
    if not free then
        state.context.cost(spell.costtype, spell.cost)
    end
    state.context.passive(spell.name, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 3, "attackstatus")
end

function spell.process(uspell, damage)
    invalid = {"Dark", "Light", "Support"}
    if invalid[uspell.element] then return damage end
    return damage * spell.numericalvalue
end

return spell
