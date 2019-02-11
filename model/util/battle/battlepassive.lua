function passive(spell, target, caster, turns)
    if target.attackstatus[spell.name] then
        target.attackstatus[spell.name].turns = target.attackstatus[spell.name].turns + 2
        return
    end
    target.attackstatus[spell.name] = 3
    --TODO add state.battle.turns info
end