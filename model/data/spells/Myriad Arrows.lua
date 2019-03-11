local spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Pierce]]
spell["cost"] = 24
spell["desc"] = [[Three major pierce attacks to all foes with chance to cause fear]]
spell["numberofhits"] = 3
--a function: conditional
spell["hitchance"] = 90
spell["target"] = [[All Enemy]]
spell["passive"] = false
spell["statuschance"] = 10
spell["name"] = [[Myriad Arrows]]
spell["status"] = [[Fear]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 320
spell["costtype"] = [[HP (%)]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.open])
end

return spell
