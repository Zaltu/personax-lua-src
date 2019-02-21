local spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Wind]]
spell["cost"] = 24
spell["desc"] = [[Major wind damage to all foes]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 90
spell["target"] = [[All Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Magarudyne]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 320
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, nil, state.battle.participants[state.battle.open])
end

return spell
