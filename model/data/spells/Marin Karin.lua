local spell = {}
spell["element"] = [[Status]]
spell["cost"] = 5
spell["desc"] = [[Chance to charm one foe]]
spell["target"] = [[One Enemy]]
spell["statuschance"] = 25
spell["name"] = [[Marin Karin]]
spell["status"] = [[Charm]]
spell["costtype"] = [[SP]]
spell["blurb"] = " has been charmed!"

local function calculateEvasionBonus()
    hitchance = spell.hitchance
    for passivename, _ in pairs(state.battle.participants[state.battle.target].dodgestatus) do
        hitchance = hitchance + require("data/spells/"..passivename).process(spell, spell.hitchance, true)
    end
    for passivename, _ in pairs(state.battle.participants[state.battle.open].dodgestatus) do
        hitchance = hitchance + require("data/spells/"..passivename).process(spell, spell.hitchance)
    end
    return hitchance
end

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    --Checking for hit
    finalhitchance = calculateEvasionBonus(require("data/spells/"..uspellname))
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
