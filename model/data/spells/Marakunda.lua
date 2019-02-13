local spell = {}
spell = {}
spell["element"] = [[Support]]
spell["cost"] = 12
spell["desc"] = [[Lowers defence of all foes]]
spell["target"] = [[All Enemy]]
spell["name"] = [[Marakunda]]
spell["costtype"] = [[SP]]

function spell.activate(free)
    if not free then
        state.context.cost(spell.costtype, spell.cost)
    end
    if state.battle.iparty[state.battle.open] then
        for _, index in pairs(state.battle.ienemy) do
            state.context.passive("Rakunda", state.battle.participants[index], state.battle.participants[state.battle.open], 3, "defendstatus")
        end
    else
        for _, index in pairs(state.battle.iparty) do
            state.context.passive("Rakunda", state.battle.participants[index], state.battle.participants[state.battle.open], 3, "defendstatus")
        end
    end
end

return spell
