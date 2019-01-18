local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Elec]]
--a function: cost
spell["desc"] = [[Greatly raises damage of all electric attacks]]
--a function: numberofhits
spell["conditional"] = [[if attack.element IS elec]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Elec Amp]]
--a function: status
spell["targetattribute"] = [[Attack]]
spell["numericalvalue"] = 50
--a function: costtype
return spell
