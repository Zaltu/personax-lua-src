local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
spell["cost"] = 6
spell["desc"] = [[Lowers defence of one foe]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 100
spell["target"] = [[One Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Rakunda]]
spell["status"] = [[None]]
spell["targetattribute"] = [[Defence]]
spell["numericalvalue"] = -50
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open])
end

return spell
