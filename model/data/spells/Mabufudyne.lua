local spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Ice]]
spell["cost"] = 32
spell["desc"] = [[Major ice damage to all foes]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 90
spell["target"] = [[All Enemy]]
spell["passive"] = false
spell["statuschance"] = 10
spell["name"] = [[Mabufudyne]]
spell["status"] = [[Freeze]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 320
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, nil, state.battle.participants[state.battle.open])
end

return spell
