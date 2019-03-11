local spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Fire]]
spell["cost"] = 3
spell["desc"] = [[Small fire damage to one foe]]
spell["numberofhits"] = 1
spell["hitchance"] = 95
spell["target"] = [[One Enemy]]
spell["name"] = [[Agi]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 50
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.open])
end

return spell
