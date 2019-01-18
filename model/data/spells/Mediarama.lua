local spell = {}
spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Support]]
spell["cost"] = 16
spell["desc"] = [[Moderate heal for all allies]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 100
spell["target"] = [[All Ally]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Mediarama]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 125
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
