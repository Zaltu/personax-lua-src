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

function parseResistance(element, caster)
    resint = state.battle.participants[state.battle.target].persona.resistance[ELEMENT_LOOKUP[element]]
    if resint == "Weak" then
        if not state.battle.participants[state.battle.target].down then
            caster.oncemore = true
        end
        state.battle.participants[state.battle.target].down = true
    end
    return RES_MULTIPLIER_LOOKUP[resint]
end

function calculateAttackBonus(damage, spell, caster)
    for passivename, _ in pairs(caster.attackstatus) do
        damage = require("data/spells/"..passivename).process(spell, damage)
    end
    return damage
end

function calculateDefenseBonus(damage, spell, caster)
    for passivename, _ in pairs(state.battle.participants[state.battle.target].defendstatus) do
        damage = require("data/spells/"..passivename).process(spell, damage)
    end
    if damage > 0 then
        damage = damage * parseResistance(spell.element, caster)
    end
    return damage
end

function calculateEvasionBonus(spell, basehitchance, caster)
    hitchance = basehitchance
    for passivename, _ in pairs(state.battle.participants[state.battle.target].dodgestatus) do
        hitchance = hitchance + require("data/spells/"..passivename).process(spell, basehitchance, true)
    end
    for passivename, _ in pairs(caster.dodgestatus) do
        hitchance = hitchance + require("data/spells/"..passivename).process(spell, basehitchance)
    end
    return hitchance
end