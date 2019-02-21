local spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Strike]]
spell["cost"] = 15
spell["desc"] = [[Three light strike attacks to all foes]]
spell["numberofhits"] = 3
--a function: conditional
spell["hitchance"] = 80
spell["target"] = [[All Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Swift Strike]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 95
spell["costtype"] = [[HP (%)]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, nil, state.battle.participants[state.battle.open])
end

return spell
