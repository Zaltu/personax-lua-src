local spell = {}
spell["element"] = [[Status]]
spell["desc"] = [[Prevents the status 'Charm']]
spell["target"] = [[Self]]
spell["passive"] = true
spell["name"] = [[Null Charm]]
spell["status"] = [[Charm]]

function spell.activate()
    state.context.passive(spell, state.battle.participants[state.battle.open], state.battle.participants[state.battle.open], 99, "dodgestatus")
end

function spell.process(uspell, basehitchance, istarget)
    if uspell.status ~= "Charm" then return 0 end
    if istarget then
        --Cmon no one's ever going to reach that
        return -99999
    end
    return 0
end

return spell
