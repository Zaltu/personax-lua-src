local function HPcost(cost)
    --HP Costs are always given in %
    state.battle.participants[state.battle.open].hp = state.battle.participants[state.battle.open].hp-state.battle.participants[state.battle.open].hp*cost/100
end
local function SPcost(cost)
    --SP Costs are always given as absolute values
    state.battle.participants[state.battle.open].sp = state.battle.participants[state.battle.open].sp-cost
end

function cost(costtype, cost)
    repoman = {["HP (%)"]=HPcost, SP=SPcost}
    repoman[costtype](cost)
end