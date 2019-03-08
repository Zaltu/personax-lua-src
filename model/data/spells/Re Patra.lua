local spell = {}
spell["element"] = [[Support]]
spell["cost"] = 3
spell["desc"] = [[Brings one ally to their feet]]
spell["target"] = [[One Ally]]
spell["name"] = [[Re Patra]]
spell["costtype"] = [[SP]]
spell["blurb"] = " has gotten up!"

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    if state.battle.participants[state.battle.target].down then
        state.battle.participants[state.battle.target].down = nil
        table.insert(state.battle.turns, {{
            target=state.battle.participants[state.battle.target].name,
            caster=state.battle.participants[state.battle.open].name,
            status=spell.name,
            blurb=state.battle.participants[state.battle.target].name..spell.blurb}})
    else
        table.insert(state.battle.turns, {{
            target=state.battle.participants[state.battle.target].name,
            caster=state.battle.participants[state.battle.open].name,
            miss=true}})
    end
end

return spell
