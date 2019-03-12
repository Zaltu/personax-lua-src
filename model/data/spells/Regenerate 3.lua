local spell = {}
spell["element"] = [[Support]]
spell["desc"] = [[Heals some HP after each turn]]
spell["passive"] = true
spell["name"] = [[Regenerate 3]]
spell["numericalvalue"] = 0.15

function spell.activate()
    state.context.passive(spell, state.battle.participants[state.battle.open], state.battle.participants[state.battle.open], 99, "turnstatus")
end

function spell.process()
    boostedby = state.battle.participants[state.battle.open].maxhp * spell.numericalvalue
    state.battle.participants[state.battle.open].hp = state.battle.participants[state.battle.open].hp + boostedby
    if state.battle.participants[state.battle.open].hp > state.battle.participants[state.battle.open].maxhp then
        state.battle.participants[state.battle.open].hp = state.battle.participants[state.battle.open].maxhp
    end
    table.insert(state.battle.turns, {{
        target=state.battle.participants[state.battle.open].name,
        caster=state.battle.participants[state.battle.open].name,
        damage=-boostedby,
        dmgType="HP",
        element=spell.element
    }})
end


return spell
