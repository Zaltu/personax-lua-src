local spell = {}
spell["element"] = [[Support]]
spell["desc"] = [[Start the battle with heightened Hit/Evasion]]
spell["passive"] = true
spell["name"] = [[Auto-Sukukaja]]

function spell.activate()
    require("data/spells/Sukukaja").activate(true)
end

return spell
