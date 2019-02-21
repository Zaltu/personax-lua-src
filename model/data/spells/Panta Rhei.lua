local spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Wind]]
spell["cost"] = 30
spell["desc"] = [[Huge wind damage to one foe]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 99
spell["target"] = [[One Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Panta Rhei]]
spell["status"] = [[None]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 650
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open])
end

return spell
