local spell = {}
spell["element"] = [[Almighty]]
spell["cost"] = 15
spell["desc"] = [[Instantly kill anyone inflicted with fear]]
spell["target"] = [[All]]
spell["name"] = [[Ghastly Wail]]
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    turntable = {}
    for name, participant in pairs(state.battle.participants) do
        if participant.status == "Fear" then
            damage = participant.hp
            participant.hp = 0
            table.insert(turntable, {
                target=name,
                caster=state.battle.participants[state.battle.open],
                damage=damage,
                dmgType="HP"
            })
    if #turntable > 0 then table.insert(state.battle.turns, turntable) end
end

return spell
