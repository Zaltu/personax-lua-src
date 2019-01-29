local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Dark]]
spell["cost"] = 24
spell["desc"] = [[Moderate chance to instant-kill all foes with darkness damage]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 40
spell["target"] = [[All Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Mamudoon]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 100
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open])
end

return spell