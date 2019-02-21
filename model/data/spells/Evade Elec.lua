local spell = {}
spell["element"] = [[Elec]]
spell["desc"] = [[Large evasion boost against electric attacks]]
spell["passive"] = true
spell["name"] = [[Evade Elec]]
spell["numericalvalue"] = 0.25

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 99, "dodgestatus")
end

function spell.process(uspell, basehitchance, istarget)
    if not spell.element==uspell.element or not istarget then return basehitchance end
    if istarget then
        --if effect is on spell target, hitchance goes down
        return basehitchance * (1 - spell.numericalvalue)
    end
    --if effect is on spell caster, hitchance is not affected
    return basehitchance
end

return spell
