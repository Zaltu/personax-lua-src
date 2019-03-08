local spell = {}
spell["element"] = [[Strike]]
spell["desc"] = [[Large evasion boost against strike attacks]]
spell["passive"] = true
spell["name"] = [[Evade Strike]]
spell["numericalvalue"] = 0.25

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.passive(spell, state.battle.participants[state.battle.target], state.battle.participants[state.battle.open], 99, "dodgestatus")
end

function spell.process(uspell, basehitchance, istarget)
    if not spell.element==uspell.element or not istarget then return 0 end
    if istarget then
        --if effect is on spell target, hitchance goes down
        return -(basehitchance * spell.numericalvalue)
    end
    --if effect is on spell caster, hitchance is not affected
    return 0
end

return spell
