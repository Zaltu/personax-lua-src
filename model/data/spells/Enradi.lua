local spell = {}
spell["element"] = [[Support]]
spell["cost"] = 5
spell["desc"] = [[Cures rage on one ally]]
spell["target"] = [[One Ally]]
spell["name"] = [[Enradi]]
spell["status"] = [[Rage]]
spell["costtype"] = [[SP]]
spell["blurb"] = " is no longer enraged!"

function spell.activate()
    if state.battle.participants[state.battle.target].status == spell.status then
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
