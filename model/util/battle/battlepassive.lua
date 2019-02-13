function passive(spellname, target, caster, turns, statustype)
    if target[statustype][spellname] then
        target.[statustype][spellname].turns = target.[statustype][spellname].turns + (turns-1)
        return
    end
    target.[statustype][spellname] = turns
    --TODO add state.battle.turns info
end