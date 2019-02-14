function passive(spell, target, caster, turns, statustype)
    if target[statustype][spell.name] then
        target[statustype][spell.name].turns = target[statustype][spell.name].turns + (turns-1)
        return
    end
    target[statustype][spell.name] = turns
    table.insert(state.battle.turns, {{target=target.name, caster=caster.name, status=spellname, blurb=target.name..spell.blurb}})
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