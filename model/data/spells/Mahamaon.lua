local spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Light]]
spell["cost"] = 24
spell["desc"] = [[Moderate chance to instant-kill all foes with light damage]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 40
spell["target"] = [[All Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Mahamaon]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 100
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.open])
end

return spell
