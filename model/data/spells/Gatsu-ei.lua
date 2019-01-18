local spell = {}
spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Slash]]
spell["cost"] = 10
spell["desc"] = [[Light slash damage to one foe. Gets more powerful as the moon wanes]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 90
spell["target"] = [[One Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Gatsu-ei]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 140
spell["costtype"] = [[HP (%)]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
