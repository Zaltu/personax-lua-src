local spell = {}
spell["element"] = [[Support]]
spell["desc"] = [[All foes enter battle with lowered Hit/Evasion]]
spell["passive"] = true
spell["name"] = [[Auto-Masukunda]]

function spell.activate()
    require("data/spells/Masukunda").activate(true)
end

return spell
