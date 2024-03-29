function passive(spell, target, caster, turns, statustype)
    print(target)
    print(statustype)
    print(spell.name)
    if target[statustype][spell.name] then
        target[statustype][spell.name].turns = target[statustype][spell.name].turns + (turns-1)
        return
    end
    target[statustype][spell.name] = turns
    if not spell.blurb then spell.blurb = "" end
    table.insert(state.battle.turns, {{target=target.name, caster=caster.name, status=spell.name, blurb=target.name..spell.blurb}})
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
    state.battle.turns = {}
end


function countdownpassives()
    countablepassives = {"attackstatus", "defendstatus", "dodgestatus", "turnstatus"}
    for _, passivetype in pairs(countablepassives) do
        for statname, turnsleft in pairs(state.battle.participants[state.battle.open][passivetype]) do
            if turnsleft then
                if turnsleft-1 < 0 then
                    state.battle.participants[state.battle.open][passivetype][statname] = nil
                    if passivetype == "turnstatus" then state.battle.participants[state.battle.open].status = nil end
                else state.battle.participants[state.battle.open][passivetype][statname] = turnsleft-1 end
            end
        end
    end
    for spellname, _ in pairs(state.battle.participants[state.battle.open]["turnstatus"]) do
        spell = require("data/spells/"..spellname)
        if spell.process then spell.process() end
    end
end
