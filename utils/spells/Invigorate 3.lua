local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
--a function: cost
spell["desc"] = [[Heals some SP after each turn]]
--a function: numberofhits
spell["conditional"] = [[if battle.turn.end]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Invigorate 3]]
--a function: status
spell["targetattribute"] = [[SP]]
spell["numericalvalue"] = 15
--a function: costtype
return spell
