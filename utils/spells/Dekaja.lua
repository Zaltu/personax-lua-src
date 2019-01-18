local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Support]]
spell["cost"] = 15
spell["desc"] = [[Removes all stat buffs from all foes]]
spell["numberofhits"] = 1
spell["conditional"] = [[if enemy.statqueue CONTAINS buff THEN REMOVE]]
spell["hitchance"] = 100
spell["target"] = [[All Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Dekaja]]
spell["status"] = [[None]]
--a function: targetattribute
--a function: numericalvalue
spell["costtype"] = [[SP]]
return spell
