local spell = {}
spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Almighty]]
spell["cost"] = 40
spell["desc"] = [[Almighty damage to all foes with chance to poison]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 80
spell["target"] = [[All Enemy]]
spell["passive"] = false
spell["statuschance"] = 25
spell["name"] = [[Virus Breath]]
spell["status"] = [[Poison]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 230
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
