local spell = {}
spell["element"] = [[Support]]
spell["desc"] = [[Heals a bit of SP after each turn]]
spell["passive"] = true
spell["name"] = [[Invigorate 2]]
spell["numericalvalue"] = 0.1

function spell.activate()
    state.context.passive(spell, state.battle.participants[state.battle.open], state.battle.participants[state.battle.open], 99, "turnstatus")
end

function spell.process()
    boostedby = state.battle.participants[state.battle.open].maxsp * spell.numericalvalue
    state.battle.participants[state.battle.open].sp = state.battle.participants[state.battle.open].sp + boostedby
    if state.battle.participants[state.battle.open].sp > state.battle.participants[state.battle.open].maxsp then
        state.battle.participants[state.battle.open].sp = state.battle.participants[state.battle.open].maxsp
    end
    table.insert(state.battle.turns, {{
        target=state.battle.participants[state.battle.open].name,
        caster=state.battle.participants[state.battle.open].name,
        damage=-boostedby,
        dmgType="SP",
        element=spell.element
    }})
end

return spell
