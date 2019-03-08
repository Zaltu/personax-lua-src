local spell = {}
spell["element"] = [[Support]]
spell["cost"] = 6
spell["desc"] = [[Lowers Hit/Evasion of one foe]]
spell["target"] = [[One Enemy]]
spell["name"] = [[Sukunda]]
spell["costtype"] = [[SP]]
spell["numericalvalue"] = 0.15
spell["blurb"] = [['s Hit/Evasion rate has decreased!]]

function spell.activate(free)
    if not free then
        state.context.cost(spell.costtype, spell.cost)
    end
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 3, "dodgestatus")
end

function spell.process(uspell, basehitchance, istarget)
    invalid = {Light=true, Dark=true}
    if invalid[spell.element] then return 0 end
    if istarget then
        --if effect is on spell target, hitchance goes up
        return basehitchance * spell.numericalvalue)
    else
        --if effect is on spell caster, hitchance goes down
        return -(basehitchance * spell.numericalvalue)
end

return spell
