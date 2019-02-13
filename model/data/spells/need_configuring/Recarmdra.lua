local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Almighty]]
spell["cost"] = 99
spell["desc"] = [[Revives all allies with all HP at the cost of yours]]
spell["numberofhits"] = 1
spell["conditional"] = [[if friend.down THEN PASS]]
spell["hitchance"] = 100
spell["target"] = [[All Ally]]
spell["passive"] = false
spell["statuschance"] = 100
spell["name"] = [[Recarmdra]]
spell["status"] = [[Down]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 100
spell["costtype"] = [[HP (%)]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, nil, state.battle.participants[state.battle.open])
end

return spell
