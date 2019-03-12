local spell = {}
spell["element"] = [[Status]]
spell["cost"] = 5
spell["desc"] = [[Chance to poison one foe]]
spell["target"] = [[One Enemy]]
spell["statuschance"] = 25
spell["name"] = [[Poisma]]
spell["status"] = [[Poison]]
spell["costtype"] = [[SP]]
spell["blurb"] = " has been poisoned!"

function spell.activate(alteredchance)
    if alteredchance then
        hitchance = alteredchance
    else
        state.context.cost(spell.costtype, spell.cost)
        hitchance = spell.statuschance
    end
    state.context.cost(spell.costtype, spell.cost)
    require("util/battle/battlealter")
    --Checking for hit
    finalhitchance = calculateEvasionBonus(spell, hitchance, state.battle.participants[state.battle.open]))
    if math.random(1, 100) > finalhitchance then
        table.insert(state.battle.turns, {{target=state.battle.participants[state.battle.target].name, caster=state.battle.participants[state.battle.open].name, miss=true}})
        return
    end

    --Add to status table (also appends to turns)
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 3, "turnstatus")

    --Set participant turn status value
    state.battle.participants[state.battle.target].status = spell.status
end

return spell
