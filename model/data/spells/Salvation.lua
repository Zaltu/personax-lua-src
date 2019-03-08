local spell = {}
spell = {}
spell["element"] = [[Support]]
spell["cost"] = 60
spell["desc"] = [[Full heal for all party members and cures all status ailments]]
spell["target"] = [[All Ally]]
spell["name"] = [[Salvation]]
spell["costtype"] = [[SP]]
spell["blurb"] = "'s ailment has been cured!"

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
        if state.battle.participants[index].status then
            state.battle.participants[index].status = nil
            table.insert(turntable, {
                target=state.battle.participants[index].name,
                caster=state.battle.participants[state.battle.open].name,
                status=spell.name,
                blurb=state.battle.participants[index].name..spell.blurb
            })
        end
    end
    table.insert(state.battle.turns, turntable)
end

return spell
