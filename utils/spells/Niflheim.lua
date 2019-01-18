local spell = {}
spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Ice]]
spell["cost"] = 32
spell["desc"] = [[Huge ice damage to one foe]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 99
spell["target"] = [[One Enemy]]
spell["passive"] = false
spell["statuschance"] = 100
spell["name"] = [[Niflheim]]
spell["status"] = [[Freeze]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 650
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
