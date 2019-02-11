local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Support]]
spell["cost"] = 25
spell["desc"] = [[Chance to escape the battle unscathed]]
spell["numberofhits"] = 1
spell["conditional"] = [[if attack.hit IS TRUE THEN ESCAPE]]
spell["hitchance"] = 70
spell["target"] = [[All]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Fast Retreat]]
spell["status"] = [[None]]
--a function: targetattribute
--a function: numericalvalue
spell["costtype"] = [[SP]]
return spell
