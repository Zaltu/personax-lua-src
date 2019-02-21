local spell = {}
spell["element"] = [[Support]]
spell["cost"] = 15
spell["desc"] = [[Removes all stat buffs from all foes]]
spell["target"] = [[All Enemy]]
spell["name"] = [[Dekaja]]
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    if state.battle.iparty[state.battle.open] then affected = state.battle.ienemy else affected = state.battle.iparty end
    totalturns = {}
    for _, index in affected do
        state.battle.participants[index].attackstatus.Tarukaja=nil
        state.battle.participants[index].attackstatus["Mind Charge"]=nil
        state.battle.participants[index].attackstatus["Power Charge"]=nil
        state.battle.participants[index].defendstatus.Rakukaja=nil
        state.battle.participants[index].dodgestatus.Sukukaja=nil
        table.insert(totalturns, {target=state.battle.participants[index].name, caster=caster.name, status=spell.name})
    end
    table.insert(state.battle.turns, totalturns)
end

return spell
