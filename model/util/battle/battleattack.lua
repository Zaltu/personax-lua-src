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

local function hitchance(spell, target)
    statdodge = target.persona.stats[4] / 10
    finalhitchance = spell.hitchance - statdodge
    if math.random(1, 100) < finalhitchance then return true else return false end
end

local function parseResistance(element, caster, target)
    resint = target.persona.resistance[ELEMENT_LOOKUP[element]]
    if resint == "Weak" then if not target.down then caster.oncemore = true end target.down = true end
    return RES_MULTIPLIER_LOOKUP[resint]
end

local function damageValue(spell, target, caster)
    randomfactor = math.random(1, 15)
    if not target.down then
        resistance = target.persona.stats[3]
    end
    local phys = {"Slash", "Strike", "Pierce"}
    if phys[spell.element] then
        attackup = caster.persona.stats[1]
    else
        attackup = caster.persona.stats[2]
    end
    alteration = attackup - resistance
    --print("Alteration value: "..alteration)
    --print("Random value: "..randomfactor)
    damage = spell.numericalvalue + randomfactor + spell.numericalvalue * alteration / 100
    return damage * parseResistance(spell.element, caster, target)
end


local function damageHP(spell, target, caster)
    damagetakentotal = 0
    damangeTable = {}
    for hit=1, spell.numberofhits do
        damage = damageValue(spell, target, caster)
        damagetakentotal = damagetakentotal+damage
        table.insert(damangeTable, damage)
    end
    --print(caster.name.." hits "..target.name.." for "..damagetakentotal.." damage!")
    if spell.numericaltype == "Absolute Value" then
        target.hp = target.hp-damagetakentotal
    else
        target.hp = target.hp-target.hp*damagetakentotal/100
    end
    return {caster=caster.name, target=target.name, damage=damangeTable, dmgType=spell.targetattribute, down=target.down}
end


local function damageSP(spell, target, caster)
    spdamagetakentotal = damagetaken*spell.numberofhits
    --print(caster.name.." hits "..target.name.." for "..damagetakentotal.." SP damage!")
    if spell.numericaltype == "Absolute Value" then
        target.sp = target.sp-damagetakentotal
    else
        target.sp = target.sp-target.sp*damagetakentotal/100
    end
    return {caster=caster.name, target=target.name, damage=damagetakentotal, dmgType=spell.targetattribute}
end

local function attacks(spell, target, caster)
    targeter = {HP=damageHP, SP=damageSP}
    if hitchance(spell, target) then
        return targeter[spell.targetattribute](spell, target, caster)
    else
        return {target=target.name, caster=caster.name, miss=true}
    end
end


function attack(spell, target, caster)
    if target then
        --Attack on single participant
        table.insert(state.battle.turns, {attacks(spell, target, caster)})
    else
        --Attack on multiple participants
        if state.party[caster.name] then --By a party member
            targettable = state.battle.ienemy
        else -- By an enemy
            targettable = state.battle.iparty
        end
        totalturns = {}
        for i, pindex in pairs(targettable) do
            table.insert(totalturns, attacks(spell, state.battle.participants[pindex], caster))
        end
        table.insert(state.battle.turns, totalturns)
    end
end
