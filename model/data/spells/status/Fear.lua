require('util/battle/battleturn')
--The fearProcessed logic is to avoid double poisoning when requiring that the player pick an option
fearProcessed = false
function turn(open)
    --Fear means a 75% chance the participant will be paralyzed from fear
    if not fearProcessed then
        if math.random(1, 100) < 75 then
            table.insert(state.battle.turns, {{
                target=state.battle.participants[state.battle.open].name,
                caster=nil,
                status="Fear",
                blurb=state.battle.participants[state.battle.open].name.." is paralyzed in fear!"
            }})
            return 0
        end
        fearProcessed = true
    end
    --Proceed as usual
    code = normalturn()
    if code == 1 then return 1 end
    fearProcessed = false
    return 0
end
