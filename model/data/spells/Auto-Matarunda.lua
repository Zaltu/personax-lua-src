local spell = {}
spell = {}
spell["element"] = [[Support]]
spell["desc"] = [[All foes enter battle with lowered attack power]]
spell["passive"] = true
spell["name"] = [[Auto-Matarunda]]

function spell.activate()
    require("data/spells/Matarunda").activate(true)
end

return spell
