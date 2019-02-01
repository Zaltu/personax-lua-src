local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Support]]
spell["cost"] = 25
spell["desc"] = [[Cures all statuses on all allies]]
--a function: numberofhits
spell["conditional"] = [[all]]
--a function: hitchance
spell["target"] = [[All Ally]]
spell["passive"] = false
spell["statuschance"] = 100
spell["name"] = [[Amrita]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, nil, state.battle.participants[state.battle.open])
end

return spell
