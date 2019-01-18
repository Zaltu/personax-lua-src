local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
spell["cost"] = 6
spell["desc"] = [[Lowers attack power of one enemy]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 100
spell["target"] = [[One Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Tarunda]]
spell["status"] = [[None]]
spell["targetattribute"] = [[Attack]]
spell["numericalvalue"] = -50
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
