local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
spell["cost"] = 20
spell["desc"] = [[Full heal for one ally]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 100
spell["target"] = [[One Ally]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Diarahan]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 100
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open])
end

return spell
