local spell = {}
spell["element"] = [[Almighty]]
spell["desc"] = [[Take a small amount of HP from the enemy]]
spell["target"] = [[One Enemy]]
spell["name"] = [[Life Drain]]
spell["numericalvalue"] = 35

function spell.activate()
    state.battle.participants[state.battle.target].hp = state.battle.participants[state.battle.target].hp - spell.numericalvalue
    state.battle.participants[state.battle.open].hp = state.battle.participants[state.battle.open].hp + spell.numericalvalue

    --No Overheal
    if state.battle.participants[state.battle.open].hp > state.battle.participants[state.battle.open].maxhp then
        state.battle.participants[state.battle.open].hp = state.battle.participants[state.battle.open].maxhp
    end

    table.insert(state.battle.turns, {
        {
            target=state.battle.participants[state.battle.target].name,
            caster=state.battle.participants[state.battle.open].name,
            damage=spell.numericalvalue,
            dmgType="HP",
            element=spell.element
        },
        {
            target=state.battle.participants[state.battle.openn].name,
            caster=state.battle.participants[state.battle.open].name,
            damage=-spell.numericalvalue,
            dmgType="HP",
            element=spell.element
        }
    })
end

return spell
