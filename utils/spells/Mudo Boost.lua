local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Dark]]
--a function: cost
spell["desc"] = [[Raises damage of all darkness attacks]]
--a function: numberofhits
spell["conditional"] = [[if attack.element IS dark]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Mudo Boost]]
--a function: status
spell["targetattribute"] = [[Attack]]
spell["numericalvalue"] = 25
--a function: costtype
return spell
