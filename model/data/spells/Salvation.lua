local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
spell["cost"] = 60
spell["desc"] = [[Full heal for all party members and cures all status ailments]]
spell["numberofhits"] = 1
spell["conditional"] = [[spell.amrita.effect()]]
spell["hitchance"] = 100
spell["target"] = [[All Ally]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Salvation]]
--a function: status
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 100
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
