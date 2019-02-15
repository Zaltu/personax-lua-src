local spell = {}
spell = {}
spell["element"] = [[Support]]
spell["cost"] = 15
spell["desc"] = [[Greatly boost damage of magic attack on next turn]]
spell["target"] = [[One Ally]]
spell["name"] = [[Mind Charge]]
spell["numericalvalue"] = 2.5
spell["costtype"] = [[SP]]
spell["blurb"] = [['s magical attack power has greatly increased!]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 1, "attackstatus")
end

function spell.process(uspell, damage)
    phys = {Fire=true, Ice=true, Elec=true, Wind=true}
    if phys[uspell.element] then
        return damage * spell.numericalvalue
    end
    return damage
end

return spell
