local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Elec]]
--a function: cost
spell["desc"] = [[Raises damage of all electric attacks]]
--a function: numberofhits
spell["conditional"] = [[if attack.element IS elec]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Elec Boost]]
--a function: status
spell["targetattribute"] = [[Attack]]
spell["numericalvalue"] = 25
--a function: costtype
return spell
