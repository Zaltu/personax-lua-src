local spell = {}
spell["element"] = [[Support]]
spell["desc"] = [[Start the battle with heightened attack power]]
spell["passive"] = true
spell["name"] = [[Auto-Tarukaja]]

function spell.activate()
    require("data/spells/Tarukaja").activate(true)
end

return spell
