local spell = {}
spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Slash]]
spell["cost"] = 13
spell["desc"] = [[Two major slash attacks to all foes]]
spell["numberofhits"] = 2
--a function: conditional
spell["hitchance"] = 95
spell["target"] = [[All Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Tempest Slash]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 350
spell["costtype"] = [[HP (%)]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
