local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
--a function: cost
spell["desc"] = [[Heals a bit of SP after each turn]]
--a function: numberofhits
spell["conditional"] = [[if battle.turn.end]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Invigorate 2]]
--a function: status
spell["targetattribute"] = [[SP]]
spell["numericalvalue"] = 10
--a function: costtype
return spell
