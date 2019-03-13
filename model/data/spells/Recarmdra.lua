local spell = {}
spell["element"] = [[Almighty]]
spell["desc"] = [[Revives all allies with all HP at the cost of yours]]
spell["target"] = [[All Ally]]
spell["name"] = [[Recarmdra]]

function spell.activate()
    --Spell only available to party, not that it's ever used lol
    for name, person in pairs(state.party) do
        found = false
        for index, participant in pairs(state.battle.participant) do
            if participant.name == person.name then
                found = true
                state.battle.target = index
            end
        end
        if not found then
            state.battle.target = person.name
            require("data/spells/Samarecarm").activate(true)
        else
            require("data/spells/Diarahan").activate(true)
        end
    end
    table.insert(state.battle.turns, {{
        target=state.battle.participants[state.battle.open].name,
        caster=state.battle.participants[state.battle.open].name,
        damage=state.battle.participants[state.battle.open].hp-1,
        dmgType="HP"
        element=spell.element
    }})
end

return spell
