local spell = {}
spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Ice]]
spell["cost"] = 8
spell["desc"] = [[Moderate ice damage to one foe]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 95
spell["target"] = [[One Enemy]]
spell["passive"] = false
spell["statuschance"] = 10
spell["name"] = [[Bufula]]
spell["status"] = [[Freeze]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 100
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
