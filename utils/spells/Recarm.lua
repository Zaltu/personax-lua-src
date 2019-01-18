local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
spell["cost"] = 20
spell["desc"] = [[Revives one ally with half their HP]]
spell["numberofhits"] = 1
spell["conditional"] = [[if ally.down NOT PASS]]
spell["hitchance"] = 100
spell["target"] = [[One Ally]]
spell["passive"] = false
spell["statuschance"] = 100
spell["name"] = [[Recarm]]
spell["status"] = [[Down]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 50
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
