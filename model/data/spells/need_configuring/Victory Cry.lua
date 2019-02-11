local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
--a function: cost
spell["desc"] = [[Fully heals HP and SP after a battle]]
--a function: numberofhits
spell["conditional"] = [[if battle.end]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Victory Cry]]
--a function: status
spell["targetattribute"] = [[HP/SP]]
spell["numericalvalue"] = 100
--a function: costtype
return spell
