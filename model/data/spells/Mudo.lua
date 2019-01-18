local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Dark]]
spell["cost"] = 6
spell["desc"] = [[Small chance to instant-kill one foe with darkness damage]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 25
spell["target"] = [[One Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Mudo]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 100
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
