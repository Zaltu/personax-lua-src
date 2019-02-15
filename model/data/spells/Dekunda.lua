local spell = {}
spell = {}
spell["element"] = [[Support]]
spell["cost"] = 15
spell["desc"] = [[Removes all stat debuffs from all allies]]
spell["target"] = [[All Ally]]
spell["name"] = [[Dekunda]]
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    if state.battle.iparty[state.battle.open] then affected = state.battle.iparty else affected = state.battle.ienemy end
    totalturns = {}
    for _, index in affected do
        state.battle.participants[index].attackstatus.Tarunda=nil
        state.battle.participants[index].defendstatus.Rakunda=nil
        state.battle.participants[index].dodgestatus.Sukunda=nil
        table.insert(totalturns, {target=state.battle.participants[index].name, caster=caster.name, status=spell.name})
    end
    table.insert(state.battle.turns, totalturns)
end

return spell
