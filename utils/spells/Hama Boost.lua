local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Light]]
--a function: cost
spell["desc"] = [[Raises damage of all light attacks]]
--a function: numberofhits
spell["conditional"] = [[if attack.element IS light]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Hama Boost]]
--a function: status
spell["targetattribute"] = [[Attack]]
spell["numericalvalue"] = 25
--a function: costtype
return spell
