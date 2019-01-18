local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Support]]
spell["cost"] = 15
spell["desc"] = [[Removes all stat debuffs from all allies]]
spell["numberofhits"] = 1
spell["conditional"] = [[if friend.statqueue CONTAINS debuff then REMOVE]]
spell["hitchance"] = 100
spell["target"] = [[All Ally]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Dekunda]]
spell["status"] = [[None]]
--a function: targetattribute
--a function: numericalvalue
spell["costtype"] = [[SP]]
return spell
