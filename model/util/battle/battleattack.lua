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

local function parseResistance(element, target)
    return RES_MULTIPLIER_LOOKUP[target.persona.resistance[ELEMENT_LOOKUP[element]]]
end

local function damageValue(spell, target, caster)
    randomfactor = math.random(1, 15)
    resistance = target.persona.stats[3]
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
    return damage * parseResistance(spell.element, target)
end


local function damageHP(spell, target, caster)
    damagetakentotal = damageValue(spell, target, caster)*spell.numberofhits
    --print(caster.name.." hits "..target.name.." for "..damagetakentotal.." damage!")
    table.insert(state.battle.turns, {caster=caster.name, target=target.name, damage=damagetakentotal, dmgType=spell.targetattribute})
    if spell.numericaltype == "Absolute Value" then
        target.hp = target.hp-damagetakentotal
    else
        target.hp = target.hp-target.hp*damagetakentotal/100
    end
end


local function damageSP(spell, target, caster)
    spdamagetakentotal = damagetaken*spell.numberofhits
    --print(caster.name.." hits "..target.name.." for "..damagetakentotal.." SP damage!")
    table.insert(state.battle.turns, {caster=caster.name, target=target.name, damage=damagetakentotal, dmgType=spell.targetattribute})
    if spell.numericaltype == "Absolute Value" then
        target.sp = target.sp-damagetakentotal
    else
        target.sp = target.sp-target.sp*damagetakentotal/100
    end
end


function attack(spell, target, caster)
    targeter = {HP=damageHP, SP=damageSP}
    if hitchance(spell, target) then
        targeter[spell.targetattribute](spell, target, caster)
    else
        table.insert(state.battle.turns, {target=target.name, caster=caster.name, miss=true})
    end
end