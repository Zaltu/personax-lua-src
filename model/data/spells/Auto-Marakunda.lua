local spell = {}
spell["element"] = [[Support]]
spell["desc"] = [[All foes enter battle with lowered defences]]
spell["passive"] = true
spell["name"] = [[Auto-Marakunda]]

function spell.activate()
    require("data/spells/Marakunda").activate(true)
end

return spell
