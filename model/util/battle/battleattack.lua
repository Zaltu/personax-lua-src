local function damageHP(damagetaken, hits, damagenumbertype)
    damagetakentotal = damagetaken*hits--TODO Randomize
    if damagenumbertype == "Absolute Value" then
        state.battle.participants[state.battle.target].hp = state.battle.participants[state.battle.target].hp-damagetakentotal
    else
        state.battle.participants[state.battle.target].hp = state.battle.participants[state.battle.target].hp-state.battle.participants[state.battle.target].hp*damagetakentotal/100
    end
end

local function damageSP(damagetaken, hits, damagenumbertype)
    spdamagetakentotal = damagetaken*hits--TODO Randomize
    if damagenumbertype == "Absolute Value" then
        state.battle.participants[state.battle.target].sp = state.battle.participants[state.battle.target].sp-damagetakentotal
    else
        state.battle.participants[state.battle.target].sp = state.battle.participants[state.battle.target].sp-state.battle.participants[state.battle.target].sp*damagetakentotal/100
    end
end

function attack(damage, targetattribute, damagenumbertype, numberofhits)
    targeter = {HP=damageHP, SP=damageSP}
    targeter[targetattribute](damage, numberofhits, damagenumbertype)
end