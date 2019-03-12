local spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Pierce]]
spell["cost"] = 9
spell["desc"] = [[Light pierce damage to one foe with chance to charm]]
spell["numberofhits"] = 1
spell["hitchance"] = 90
spell["target"] = [[One Enemy]]
spell["statuschance"] = 10
spell["name"] = [[Holy Arrow]]
spell["status"] = [[Marin Karin]]
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 60
spell["costtype"] = [[HP (%)]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell, state.battle.participants[state.battle.open])
    --Process charm chance separatly
    require("data/spells/"..spell.status).activate(spell.statuschance)
end

return spell
