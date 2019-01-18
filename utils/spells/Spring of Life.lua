local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
--a function: cost
spell["desc"] = [[Heals HP after each turn]]
--a function: numberofhits
spell["conditional"] = [[if battle.turn.end]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Spring of Life]]
--a function: status
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 30
--a function: costtype
return spell
