local spell = {}
spell["element"] = [[Support]]
spell["desc"] = [[Start the battle with heightened defences]]
spell["passive"] = true
spell["name"] = [[Auto-Rakukaja]]

function spell.activate()
    require("data/spells/Rakukaja").activate(true)
end

return spell
