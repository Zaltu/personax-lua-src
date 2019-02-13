local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
spell["cost"] = 5
spell["desc"] = [[Greatly raises everyone's critical chances]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 100
spell["target"] = [[All]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Revolution]]
spell["status"] = [[None]]
spell["targetattribute"] = [[Luck]]
spell["numericalvalue"] = 100
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open])
end

return spell
