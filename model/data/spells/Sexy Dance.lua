local spell = {}
spell["element"] = [[Status]]
spell["cost"] = 10
spell["desc"] = [[Chance to charm all foes]]
spell["target"] = [[All Enemy]]
spell["statuschance"] = 25
spell["name"] = [[Sexy Dance]]
spell["status"] = [[Charm]]
spell["costtype"] = [[SP]]
spell["blurb"] = " has been charmed!"

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    if state.battle.iparty[state.battle.open] then targets = state.battle.iparty else targets = state.battle.ienemy end
    require("util/battle/battlealter")
    for _, index in targets do
        --Checking for hit
        finalhitchance = calculateEvasionBonus(spell, spell.statuschance, state.battle.participants[state.battle.open])
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
