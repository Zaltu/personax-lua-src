local spell = {}
spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Pierce]]
spell["cost"] = 13
spell["desc"] = [[Major pierce damage to one foe with chance to poison]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 95
spell["target"] = [[One Enemy]]
spell["passive"] = false
spell["statuschance"] = 10
spell["name"] = [[Poison Arrow]]
spell["status"] = [[Poison]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 300
spell["costtype"] = [[HP (%)]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open])
end

return spell
