local spell = {}
spell["element"] = [[Support]]
spell["cost"] = 6
spell["desc"] = [[Cures panic, fear and distress in all allies]]
spell["target"] = [[All Ally]]
spell["name"] = [[Me Patra]]
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    if state.party[state.battle.participants[state.battle.open].name] then
        targets = state.battle.iparty
    else
        targets = state.battle.ienemy
    end
    validStatuses = {"Distress", "Panic", "Fear"}
    for _, index in pairs(targets) do
        if validStatuses[state.battle.participants[index].status] then
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
