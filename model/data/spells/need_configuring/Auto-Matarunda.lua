local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
--a function: cost
spell["desc"] = [[All foes enter battle with lowered attack power]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
spell["target"] = [[All Enemy]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Auto-Matarunda]]
--a function: status
spell["targetattribute"] = [[Attack]]
spell["numericalvalue"] = -50
--a function: costtype

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, nil, state.battle.participants[state.battle.open])
end

return spell
