require('util/battle/battleturn')
--The poisonProcessed logic is to avoid double poisoning when requiring that the player pick an option
poisonProcessed = false
function turn(open)
    --Poison damage = 15% of current HP (you can't die from it)
    if not poisonProcessed then
        state.battle.participants[state.battle.open].hp = state.battle.participants[state.battle.open].hp - state.battle.participants[state.battle.open].hp * 0.15
        table.insert(state.battle.turns, {{
            target=state.battle.participants[state.battle.open].name,
            caster=nil,
            damage=10,
            dmgType="HP",
            element="Poison"
        }})
        poisonProcessed = true
    end
    --Proceed as usual
    code = normalturn()
    if code == 1 then return 1 end
    poisonProcessed = false
    return 0
end
