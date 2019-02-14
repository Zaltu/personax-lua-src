local spell = {}
spell = {}
spell["element"] = [[Dark]]
spell["desc"] = [[Survive Dark attacks with 1 HP]]
spell["passive"] = true
spell["name"] = [[Endure Dark]]
spell["blurb"] = [[ survived with 1HP!]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 99, "defendstatus")
end

function spell.process(uspell, damage)
    if uspell.element == spell.element then
        return damage - 1
    end
    return damage
end

return spell
