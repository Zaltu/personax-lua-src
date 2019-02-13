local spell = {}
spell = {}
spell["element"] = [[Support]]
spell["desc"] = [[All allies enter battle with heightened defences]]
spell["passive"] = true
spell["name"] = [[Auto-Marakukaja]]

function spell.activate()
    require("data/spells/Marakukaja").activate(true)
end

return spell
