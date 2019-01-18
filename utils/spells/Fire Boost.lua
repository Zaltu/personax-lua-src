local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Fire]]
--a function: cost
spell["desc"] = [[Raises damage of all fire attacks]]
--a function: numberofhits
spell["conditional"] = [[if attack.element IS fire]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Fire Boost]]
--a function: status
spell["targetattribute"] = [[Attack]]
spell["numericalvalue"] = 25
--a function: costtype
return spell
