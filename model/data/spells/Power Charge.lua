local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
spell["cost"] = 15
spell["desc"] = [[Greatly boost damage on the next physical attack]]
spell["numberofhits"] = 1
spell["conditional"] = [[END if attack is DONE]]
spell["hitchance"] = 100
spell["target"] = [[One Ally]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Power Charge]]
spell["status"] = [[None]]
spell["targetattribute"] = [[Strength]]
spell["numericalvalue"] = 150
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
