local spell = {}
spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Elec]]
spell["cost"] = 16
spell["desc"] = [[Major electric damage to one foe]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 95
spell["target"] = [[One Enemy]]
spell["passive"] = false
spell["statuschance"] = 10
spell["name"] = [[Ziodyne]]
spell["status"] = [[Shock]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 320
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
