local spell = {}
spell["element"] = [[Support]]
spell["cost"] = 40
spell["desc"] = [[Full heal for all allies]]
spell["target"] = [[All Ally]]
spell["name"] = [[Mediarahan]]
spell["numericalvalue"] = 100
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
        heals = state.battle.participants[index].maxhp - state.battle.participants[index].hp
        state.battle.participants[index].hp = state.battle.participants[index].maxhp
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
