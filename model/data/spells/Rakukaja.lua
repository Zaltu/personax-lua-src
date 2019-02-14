local spell = {}
spell = {}
spell["element"] = [[Support]]
spell["cost"] = 6
spell["desc"] = [[Raises defence of one ally]]
spell["target"] = [[One Ally]]
spell["name"] = [[Rakukaja]]
spell["costtype"] = [[SP]]
spell["numericalvalue"] = 0.5
spell["blurb"] = [['s defenses have increased!]]

function spell.activate(free)
    if not free then
        state.context.cost(spell.costtype, spell.cost)
    end
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 3, "defendstatus")
end

function spell.process(uspell, damage)
    invalid = {Dark=true, Light=true, Support=true}
    if invalid[uspell.element] then return damage end
    return damage * spell.numericalvalue
end

return spell
