local spell = {}
spell["element"] = [[Support]]
spell["cost"] = 25
spell["desc"] = [[Cures all statuses on all allies]]
spell["target"] = [[All Ally]]
spell["name"] = [[Amrita]]
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    if state.party[state.battle.participants[state.battle.open].name] then
        targets = state.battle.iparty
    else
        targets = state.battle.ienemy
    end
    for _, index in pairs(targets) do
        if state.battle.participants[index].status then
            state.battle.participants[index].status = nil
            table.insert(state.battle.turns, {{
                target=state.battle.participants[index].name,
                caster=state.battle.participants[state.battle.open].name,
                status=spell.name,
                blurb=state.battle.participants[index].name..spell.blurb
            }})
        end
    end
end

return spell
