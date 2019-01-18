local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Support]]
spell["cost"] = 55
spell["desc"] = [[Repels the next magical attack back towards the enemy]]
spell["numberofhits"] = 1
spell["conditional"] = [[if attack.element IN magical THEN Repel]]
spell["hitchance"] = 100
spell["target"] = [[Self]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Makarakarn]]
spell["status"] = [[None]]
spell["targetattribute"] = [[Resistance]]
--a function: numericalvalue
spell["costtype"] = [[SP]]
return spell
