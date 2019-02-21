local spell = {}
spell["element"] = [[Support]]
spell["cost"] = 4
spell["desc"] = [[Small heal on one ally]]
spell["target"] = [[One Ally]]
spell["name"] = [[Dia]]
spell["numericalvalue"] = 60
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    randomfactor = math.random(1, 15)
    heals = spell.numericalvalue + randomfactor
    state.battle.participants[state.battle.target].hp = state.battle.participants[state.battle.target].hp + heals
    -- Overheal is definitely not a thing
    if state.battle.participants[state.battle.target].hp > state.battle.participants[state.battle.target].maxhp then
        heals = state.battle.participants[state.battle.target].maxhp - (state.battle.participants[state.battle.target].hp - heals)
        state.battle.participants[state.battle.target].hp = state.battle.participants[state.battle.target].maxhp
    end
    table.insert(state.battle.turns, {{
        caster=state.battle.participants[state.battle.open].name,
        target=state.battle.participants[state.battle.target].name,
        heals=heals,
        dmgType="HP",
        element=spell.element
    }})
end

return spell
