local spell = {}
spell["element"] = [[Almighty]]
spell["desc"] = [[Take a small amount of SP from the enemy]]
spell["target"] = [[One Enemy]]
spell["name"] = [[Spirit Drain]]
spell["numericalvalue"] = 20

function spell.activate()
    state.battle.participants[state.battle.target].sp = state.battle.participants[state.battle.target].sp - spell.numericalvalue
    state.battle.participants[state.battle.open].sp = state.battle.participants[state.battle.open].sp + spell.numericalvalue

    --No Overheal
    if state.battle.participants[state.battle.open].sp > state.battle.participants[state.battle.open].maxsp then
        state.battle.participants[state.battle.open].sp = state.battle.participants[state.battle.open].maxsp
    end

    table.insert(state.battle.turns, {
        {
            target=state.battle.participants[state.battle.target].name,
            caster=state.battle.participants[state.battle.open].name,
            damage=spell.numericalvalue,
            dmgType="SP",
            element=spell.element
        },
        {
            target=state.battle.participants[state.battle.openn].name,
            caster=state.battle.participants[state.battle.open].name,
            damage=-spell.numericalvalue,
            dmgType="SP",
            element=spell.element
        }
    })
end

return spell
