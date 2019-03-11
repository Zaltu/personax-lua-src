local ELEMENT_LOOKUP = {
    Slash=1,
    Strike=2,
    Pierce=3,
    Fire=4,
    Ice=5,
    Elec=6,
    Wind=7,
    Light=8,
    Dark=9
}
local RES_MULTIPLIER_LOOKUP = {
    Normal=1,
    Weak=2,
    Null=0,
    Drain=-1,
    Strong=0.5
}

local function parseResistance(element, caster)
    resint = state.battle.participants[state.battle.target].persona.resistance[ELEMENT_LOOKUP[element]]
    if resint == "Weak" then
        if not state.battle.participants[state.battle.target].down then
            caster.oncemore = true
        end
        state.battle.participants[state.battle.target].down = true
    end
    return RES_MULTIPLIER_LOOKUP[resint]
end

local function calculateAttackBonus(damage, spell, caster)
    for passivename, _ in pairs(caster.attackstatus) do
        damage = require("data/spells/"..passivename).process(spell, damage)
    end
    return damage
end

local function calculateDefenseBonus(damage, spell, caster)
    for passivename, _ in pairs(state.battle.participants[state.battle.target].defendstatus) do
        damage = require("data/spells/"..passivename).process(spell, damage)
    end
    if damage > 0 then
        damage = damage * parseResistance(spell.element, caster)
    end
    return damage
end

local function calculateEvasionBonus(spell, basehitchance, caster)
    hitchance = basehitchance
    for passivename, _ in pairs(state.battle.participants[state.battle.target].dodgestatus) do
        hitchance = hitchance + require("data/spells/"..passivename).process(spell, basehitchance, true)
    end
    for passivename, _ in pairs(caster.dodgestatus) do
        hitchance = hitchance + require("data/spells/"..passivename).process(spell, basehitchance)
    end
    return hitchance
end

local function hitchance(spell, caster)
    statdodge = state.battle.participants[state.battle.target].persona.stats[4] / 10
    realhitchance = calculateEvasionBonus(spell, spell.hitchance, caster)
    finalhitchance = realhitchance - statdodge
    --print("agility="..target.persona.stats[4].."\nstatdodge="..statdodge.."\nspellhitchance="..spell.hitchance.."\nrealhitchance="..realhitchance.."\nfinalhitchance="..finalhitchance)
    if math.random(1, 100) < finalhitchance then return true else return false end
end

local function damageValue(spell, caster)
    if spell.numericaltype == "Percentage" then
        damage = state.battle.participants[state.battle.target].hp*damage/100
    else
        randomfactor = math.random(1, 15)
        if not state.battle.participants[state.battle.target].down then
            resistance = state.battle.participants[state.battle.target].persona.stats[3]
        end
        local phys = {Slash=true, Strike=true, Pierce=true}
        if phys[spell.element] then
            --print("Physical damage detected")
            attackup = caster.persona.stats[1]
        else
            --print("Magical damage detected")
            attackup = caster.persona.stats[2]
        end
        alteration = attackup - resistance
        --print("Alteration value: "..alteration)
        --print("Random value: "..randomfactor)
        damage = spell.numericalvalue + randomfactor + spell.numericalvalue * alteration / 100
    end
    damage = calculateAttackBonus(damage, spell, caster)
    damage = calculateDefenseBonus(damage, spell, caster)
    return damage
end


local function damageHP(spell, caster)
    damagetakentotal = 0
    damangeTable = {}
    for hit=1, spell.numberofhits do
        damage = damageValue(spell, caster)
        damagetakentotal = damagetakentotal+damage
        table.insert(damangeTable, damage)
    end
    --print(caster.name.." hits "..target.name.." for "..damagetakentotal.." damage!")
    state.battle.participants[state.battle.target].hp = state.battle.participants[state.battle.target].hp-damagetakentotal
    return {
        caster=caster.name,
        target=state.battle.participants[state.battle.target].name,
        damage=damangeTable,
        dmgType="HP",
        down=state.battle.participants[state.battle.target].down,
        element=spell.element
    }
end


local function damageSP(spell, caster)
    spdamagetakentotal = damagetaken*spell.numberofhits
    --print(caster.name.." hits "..target.name.." for "..damagetakentotal.." SP damage!")
    if spell.numericaltype == "Absolute Value" then
        state.battle.participants[state.battle.target].sp = state.battle.participants[state.battle.target].sp-damagetakentotal
    else
        state.battle.participants[state.battle.target].sp = state.battle.participants[state.battle.target].sp-state.battle.participants[state.battle.target].sp*damagetakentotal/100
    end
    return {
        caster=caster.name,
        target=state.battle.participants[state.battle.target].name,
        damage=damagetakentotal,
        dmgType="SP"
    }
end

local function attacks(spell, caster)
    targeter = {HP=damageHP, SP=damageSP}
    if state.battle.participants[state.battle.target].down or hitchance(spell, caster) then
        return targeter[spell.targetattribute](spell, caster)
    else
        return {
            target=state.battle.participants[state.battle.target].name,
            caster=caster.name,
            miss=true
        }
    end
end


function attack(spell, caster)
    if state.battle.target then
        --Attack on single participant
        table.insert(state.battle.turns, {attacks(spell, caster)})
    else
        --Attack on multiple participants
        if state.party[caster.name] then --By a party member
            targettable = state.battle.ienemy
        else -- By an enemy
            targettable = state.battle.iparty
        end
        totalturns = {}
        for i, pindex in pairs(targettable) do
            --For generic case handling in following functionality
            state.battle.target = pindex
            table.insert(totalturns, attacks(spell, caster))
        end
        table.insert(state.battle.turns, totalturns)
    end
end
