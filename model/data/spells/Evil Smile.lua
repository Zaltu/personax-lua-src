local spell = {}
spell["element"] = [[Status]]
spell["cost"] = 10
spell["desc"] = [[Chance to instill fear in all foes]]
spell["target"] = [[All Enemy]]
spell["statuschance"] = 25
spell["name"] = [[Evil Smile]]
spell["status"] = [[Fear]]
spell["costtype"] = [[SP]]

--alteredchance is for when normal attacks have a chance (generally lessered) to cause a status
function spell.activate(alteredchance)
    if alteredchance then
        hitchance = alteredchance
    else
        state.context.cost(spell.costtype, spell.cost)
        hitchance = spell.statuschance
    end
    if state.battle.iparty[state.battle.open] then targets = state.battle.iparty else targets = state.battle.ienemy end
    require("util/battle/battlealter")
    for _, index in targets do
        --Checking for hit
        finalhitchance = calculateEvasionBonus(spell, hitchance, state.battle.participants[state.battle.open])
        if math.random(1, 100) > finalhitchance then
            table.insert(state.battle.turns, {{target=state.battle.participants[index].name, caster=state.battle.participants[state.battle.open].name, miss=true}})
        else
            --Add to status table (also appends to turns)
            state.context.passive(spell, state.battle.participants[index], state.battle.participants[state.battle.open], 3, "turnstatus")

            --Set participant turn status value
            state.battle.participants[index].status = spell.status
        end
    end
end

return spell
