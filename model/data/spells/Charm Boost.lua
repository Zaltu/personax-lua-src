local spell = {}
spell["element"] = [[Status]]
spell["desc"] = [[Raises chance to charm to the enemy]]
spell["conditional"] = [[if attack.status IS charm THEN BOOST chance]]
spell["target"] = [[Self]]
spell["passive"] = true
spell["numericalvalue"] = 25
spell["name"] = [[Charm Boost]]

function spell.activate()
    state.context.passive(spell, state.battle.participants[state.battle.open], state.battle.participants[state.battle.open], 99, "dodgestatus")
end

function spell.process(uspell, basehitchance, istarget)
    if uspell.status ~= "Charm" then return 0 end
    if istarget then
        return 0
    end
    return basehitchance * spell.numericalvalue
end

return spell
