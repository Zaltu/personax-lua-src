local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Light]]
spell["cost"] = 35
spell["desc"] = [[High chance to instant-kill all foes with light damage]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 80
spell["target"] = [[All Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Samsara]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 100
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
