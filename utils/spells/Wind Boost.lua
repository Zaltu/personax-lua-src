local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Wind]]
--a function: cost
spell["desc"] = [[Raises damage of all wind attacks]]
--a function: numberofhits
spell["conditional"] = [[if attack.element IS wind]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Wind Boost]]
--a function: status
spell["targetattribute"] = [[Attack]]
spell["numericalvalue"] = 25
--a function: costtype
return spell
