local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
spell["cost"] = 12
spell["desc"] = [[Raises Hit/Evasion of all allies]]
spell["numberofhits"] = 1
--a function: conditional
spell["hitchance"] = 100
spell["target"] = [[All Ally]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Masukukaja]]
spell["status"] = [[None]]
spell["targetattribute"] = [[Agility]]
spell["numericalvalue"] = 50
spell["costtype"] = [[SP]]

function spell.activate()
    state.context.cost(spell.costtype, spell.cost)
    state.context.attack(spell.numericalvalue, spell.targetattribute, spell.numericaltype, spell.numberofhits)
end

return spell
