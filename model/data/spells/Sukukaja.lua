local spell = {}
spell = {}
spell["element"] = [[Support]]
spell["cost"] = 6
spell["desc"] = [[Raises Hit/Evasion of one ally]]
spell["target"] = [[One Ally]]
spell["name"] = [[Sukukaja]]
spell["costtype"] = [[SP]]
spell["numericalvalue"] = 0.15
spell["blurb"] = [['s Hit/Evasion rate has increased!]]

function spell.activate(free)
    if not free then
        state.context.cost(spell.costtype, spell.cost)
    end
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 3, "dodgestatus")
end

function spell.process(uspell, basehitchance, istarget)
    invalid = {Light=true, Dark=true}
    if invalid[spell.element] then return basehitchance end
    if istarget then
        --if effect is on spell target, hitchance goes down
        return basehitchance * (1 - spell.numericalvalue)
    else
        --if effect is on spell caster, hitchance goes up
        return basehitchance * (1 + spell.numericalvalue)
end

return spell
