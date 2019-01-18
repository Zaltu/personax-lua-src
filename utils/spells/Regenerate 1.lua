local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
--a function: cost
spell["desc"] = [[Heals a small amount of HP after each turn]]
--a function: numberofhits
spell["conditional"] = [[if battle.turn.end]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Regenerate 1]]
--a function: status
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 5
--a function: costtype
return spell
