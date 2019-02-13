local spell = {}
spell = {}
spell["element"] = [[Support]]
spell["desc"] = [[All allies enter battle with heightened attack power]]
spell["passive"] = true
spell["name"] = [[Auto-Matarukaja]]

function spell.activate()
    require("data/spells/Matarukaja").activate(true)
end

return spell
