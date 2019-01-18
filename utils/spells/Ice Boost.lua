local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Ice]]
--a function: cost
spell["desc"] = [[Raises damage of all ice attacks]]
--a function: numberofhits
spell["conditional"] = [[if attack.element IS ice]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Ice Boost]]
--a function: status
spell["targetattribute"] = [[Attack]]
spell["numericalvalue"] = 25
--a function: costtype
return spell
