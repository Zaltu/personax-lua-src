require("util/battle/battlealter")

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
        casterparticipantindex=state.battle.open,
        target=state.battle.participants[state.battle.target].name,
        targetparticipantindex=state.battle.target,
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
        casterparticipantindex=state.battle.open,
        target=state.battle.participants[state.battle.target].name,
        targetparticipantindex=state.battle.target,
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
            targetparticipantindex=state.battle.target,
            caster=caster.name,
            casterparticipantindex=state.battle.open,
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
