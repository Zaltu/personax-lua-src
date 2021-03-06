local spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Strike]]
spell["cost"] = 19
spell["desc"] = [[Two major strike attacks to all foes]]
spell["numberofhits"] = 2
--a function: conditional
spell["hitchance"] = 85
spell["target"] = [[All Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Akasha Arts]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 350
spell["costtype"] = [[HP (%)]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.open])
end

return spell
