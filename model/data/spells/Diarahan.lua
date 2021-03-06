local spell = {}
spell["element"] = [[Heal]]
spell["cost"] = 20
spell["desc"] = [[Full heal for one ally]]
spell["target"] = [[One Ally]]
spell["status"] = [[None]]
spell["numericalvalue"] = 100
spell["costtype"] = [[SP]]

function spell.activate(free)
    if not free then state.context.cost(spell.costtype, spell.cost) end

    -- Overheal is definitely not a thing
    heals = state.battle.participants[state.battle.target].maxhp - state.battle.participants[state.battle.target].hp
    state.battle.participants[state.battle.target].hp = state.battle.participants[state.battle.target].maxhp
    table.insert(state.battle.turns, {{
        caster=state.battle.participants[state.battle.open].name,
        target=state.battle.participants[state.battle.target].name,
        damage=-heals,
        dmgType="HP",
        element=spell.element
    }})
end

return spell
