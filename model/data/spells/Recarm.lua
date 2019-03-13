local spell = {}
spell["element"] = [[Support]]
spell["cost"] = 20
spell["desc"] = [[Revives one ally with half their HP]]
spell["target"] = [[Dead]]
spell["name"] = [[Recarm]]
spell["costtype"] = [[SP]]
spell["blurb"] = [[ has been revived!]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    --Assumes targetindex was passed as a str in this case
    person = state.party[state.battle.target]
    state.battle.participants[#state.battle.participants+1] = {
        persona=person.persona,
        name=person.name,
        hp=person.maxhp/2,
        maxhp=person.maxhp,
        sp=person.sp,
        maxsp=person.maxsp,
        turnstatus={},
        attackstatus={},
        defendstatus={},
        dodgestatus={},
        endstatus={}
    }
    table.insert(state.battle.turns, {{
        target=person.name,
        caster=state.battle.participants[state.battle.open],
        status=spell.name,
        blurb=person.name..spell.blurb
    }})
end

return spell
