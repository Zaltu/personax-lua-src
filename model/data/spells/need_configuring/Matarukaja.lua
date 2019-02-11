local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
spell["cost"] = 12
spell["desc"] = [[Boosts attack power for all allies]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 100
spell["target"] = [[All Ally]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Matarukaja]]
spell["status"] = [[None]]
spell["targetattribute"] = [[Attack]]
spell["numericalvalue"] = 50
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, nil, state.battle.participants[state.battle.open])
end

return spell
