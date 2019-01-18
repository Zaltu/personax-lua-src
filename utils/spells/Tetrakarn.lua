local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Support]]
spell["cost"] = 55
spell["desc"] = [[Repels the next physical attack back towards the enemy]]
spell["numberofhits"] = 1
spell["conditional"] = [[if attack.element IN physical THEN Repel]]
spell["hitchance"] = 100
spell["target"] = [[Self]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Tetrakarn]]
spell["status"] = [[None]]
spell["targetattribute"] = [[Resistance]]
--a function: numericalvalue
spell["costtype"] = [[SP]]
return spell
