local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Status]]
spell["cost"] = 10
spell["desc"] = [[Chance to poison all foes]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
spell["target"] = [[All Enemy]]
spell["passive"] = false
spell["statuschance"] = 25
spell["name"] = [[Poison Mist]]
spell["status"] = [[Poison]]
--a function: targetattribute
--a function: numericalvalue
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, nil, state.battle.participants[state.battle.open])
end

return spell
