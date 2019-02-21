local spell = {}
spell["element"] = [[Support]]
spell["cost"] = 8
spell["desc"] = [[Small heal for all allies]]
spell["target"] = [[All Ally]]
spell["name"] = [[Media]]
spell["numericalvalue"] = 60
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    turntable = {}
    if state.battle.iparty[state.battle.open] then
        targets = state.battle.iparty
    else
        targets = state.battle.ienemy
    end
    for _, index in pairs(targets) do
        randomfactor = math.random(1, 15)
        heals = spell.numericalvalue + randomfactor
        state.battle.participants[index].hp = state.battle.participants[index].hp + heals
        -- Overheal is definitely not a thing
        if state.battle.participants[index].hp > state.battle.participants[index].maxhp then
            heals = state.battle.participants[index].maxhp - (state.battle.participants[index].hp - heals)
            state.battle.participants[index].hp = state.battle.participants[index].maxhp
        end
        table.insert(turntable, {
            caster=state.battle.participants[state.battle.open].name,
            target=state.battle.participants[index].name,
            heals=heals,
            dmgType="HP",
            element=spell.element
        })
    end
    table.insert(state.battle.turns, turntable)
end

return spell
