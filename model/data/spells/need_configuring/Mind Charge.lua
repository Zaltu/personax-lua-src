local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
spell["cost"] = 15
spell["desc"] = [[Greatly boost damage on the next magic attack]]
spell["numberofhits"] = 1
spell["conditional"] = [[END if mattack is DONE]]
spell["hitchance"] = 100
spell["target"] = [[One Ally]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Mind Charge]]
spell["status"] = [[None]]
spell["targetattribute"] = [[Magic]]
spell["numericalvalue"] = 150
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open])
end

return spell
