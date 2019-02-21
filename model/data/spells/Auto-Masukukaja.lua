local spell = {}
spell["element"] = [[Support]]
spell["desc"] = [[All allies enter battle with heightened Hit/Evasion]]
spell["passive"] = true
spell["name"] = [[Auto-Masukukaja]]

function spell.activate()
    require("data/spells/Masukukaja").activate(true)
end

return spell
