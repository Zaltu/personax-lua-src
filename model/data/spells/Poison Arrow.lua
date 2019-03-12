local spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Pierce]]
spell["cost"] = 13
spell["desc"] = [[Major pierce damage to one foe with chance to poison]]
spell["numberofhits"] = 1
spell["hitchance"] = 95
spell["target"] = [[One Enemy]]
spell["statuschance"] = 10
spell["name"] = [[Poison Arrow]]
spell["status"] = [[Poisma]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 300
spell["costtype"] = [[HP (%)]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open])
    --Process poison chance separatly
    require("data/spells/"..spell.status).activate(spell.statuschance)
end

return spell
