local spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Elec]]
spell["cost"] = 8
spell["desc"] = [[Moderate electric damage to one foe]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 95
spell["target"] = [[One Enemy]]
spell["passive"] = false
spell["statuschance"] = 10
spell["name"] = [[Zionga]]
spell["status"] = [[Shock]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 100
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.open])
end

return spell
