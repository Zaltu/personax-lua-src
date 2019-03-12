local spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Almighty]]
spell["cost"] = 40
spell["desc"] = [[Almighty damage to all foes with chance to poison]]
spell["numberofhits"] = 1
spell["hitchance"] = 80
spell["target"] = [[All Enemy]]
spell["statuschance"] = 25
spell["name"] = [[Virus Breath]]
spell["status"] = [[Poison Mist]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 230
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open])
    --Process poison chance separatly
    require("data/spells/"..spell.status).activate(spell.statuschance)
end

return spell
