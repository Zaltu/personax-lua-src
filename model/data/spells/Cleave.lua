local spell = {}
spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Slash]]
spell["cost"] = 7
spell["desc"] = [[Small slash damage to one foe]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 90
spell["target"] = [[One Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Cleave]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 30
spell["costtype"] = [[HP (%)]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
