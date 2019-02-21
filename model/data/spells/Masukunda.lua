local spell = {}
spell["element"] = [[Support]]
spell["cost"] = 12
spell["desc"] = [[Lowers Hit/Evasion of all foes]]
spell["target"] = [[All Enemy]]
spell["name"] = [[Masukunda]]
spell["costtype"] = [[SP]]

function spell.activate(free)
    if not free then
        state.context.cost(spell.costtype, spell.cost)
    end
    if state.battle.iparty[state.battle.open] then
        for _, index in pairs(state.battle.ienemy) do
            state.context.passive("Sukunda", state.battle.participants[index], state.battle.participants[state.battle.open], 3, "dodgestatus")
        end
    else
        for _, index in pairs(state.battle.iparty) do
            state.context.passive("Sukunda", state.battle.participants[index], state.battle.participants[state.battle.open], 3, "dodgestatus")
        end
    end
end

return spell
