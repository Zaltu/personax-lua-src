local spell = {}
spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Almighty]]
spell["cost"] = 99
spell["desc"] = [[I'll show you my true power!

Empties HP and SP to near-null but deals massive damage to the enemy *CHAOS ONLY*]]
spell["numberofhits"] = 5
spell["conditional"] = [[if battle.end REMOVE Chaos FROM party]]
spell["hitchance"] = 100
spell["target"] = [[All Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Chaos!]]
--a function: status
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 9999999
spell["costtype"] = [[HP/SP(%)]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, nil, state.battle.participants[state.battle.open])
end

return spell
