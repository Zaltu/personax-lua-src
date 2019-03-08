local spell = {}
spell["element"] = [[Support]]
spell["cost"] = 5
spell["desc"] = [[Cures charm in one ally]]
spell["target"] = [[One Ally]]
spell["name"] = [[Charmdi]]
spell["costtype"] = [[SP]]
spell["blurb"] = " is no longer charmed!"

function spell.activate()
    if state.battle.participants[state.battle.open].status == "Charm" then
        state.battle.participants[state.battle.open].status = nil
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
