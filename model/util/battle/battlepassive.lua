function passive(spellname, target, caster, turns, statustype)
    if target[statustype][spellname] then
        target[statustype][spellname].turns = target[statustype][spellname].turns + (turns-1)
        return
    end
    target[statustype][spellname] = turns
    --TODO add state.battle.turns info
end


function battlepassives()
    repeat
        for _, spell in pairs(state.battle.participants[state.battle.open].persona.spellDeck) do
            if spell ~= "" then
                lspell = require("data/spells/"..spell)
                if lspell.passive then
                    lspell.activate()
                end
            end
        end
        state.battle.open = state.battle.open + 1
    until
        state.battle.open > #state.battle.participants
    state.battle.open = 1
end