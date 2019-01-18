local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Almighty]]
spell["cost"] = 15
spell["desc"] = [[Instantly kill anyone inflicted with fear]]
spell["numberofhits"] = 1
spell["conditional"] = [[if all[i].status IS fear]]
spell["hitchance"] = 100
spell["target"] = [[All]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Ghastly Wail]]
--a function: status
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 100
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
