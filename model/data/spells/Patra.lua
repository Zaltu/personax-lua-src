local spell = {}
spell["element"] = [[Support]]
spell["cost"] = 3
spell["desc"] = [[Cures panic, fear and distress in one ally]]
spell["target"] = [[One Ally]]
spell["name"] = [[Patra]]
spell["costtype"] = [[SP]]
spell["blurb"] = [[ has been cured!]]

function spell.activate()
    validStatuses = {"Distress", "Panic", "Fear"}
    if validStatuses[state.battle.participants[state.battle.target].status] then
        state.battle.participants[state.battle.target].status = nil
        table.insert(state.battle.turns, {{
            target=state.battle.participants[state.battle.target].name,
            caster=state.battle.participants[state.battle.open].name,
            status=spell.name,
            blurb=state.battle.participants[state.battle.target].name..spell.blurb
        }})
    else
        table.insert(state.battle.turns, {{target=state.battle.participants[state.battle.target].name, caster=state.battle.participants[state.battle.open].name, miss=true}})
    end
end

return spell
