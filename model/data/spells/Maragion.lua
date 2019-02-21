local spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Fire]]
spell["cost"] = 12
spell["desc"] = [[Moderate fire damage to all foes]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 90
spell["target"] = [[All Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Maragion]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 100
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, nil, state.battle.participants[state.battle.open])
end

return spell
