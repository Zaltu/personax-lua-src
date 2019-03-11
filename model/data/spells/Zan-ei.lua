local spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Slash]]
spell["cost"] = 10
spell["desc"] = [[Light slash damage to one foe. Gets more powerful as the moon waxes]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 80
spell["target"] = [[One Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Zan-ei]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 120
spell["costtype"] = [[HP (%)]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.open])
end

return spell
