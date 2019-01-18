local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Wind]]
--a function: cost
spell["desc"] = [[Greatly raises damage of all wind attacks]]
--a function: numberofhits
spell["conditional"] = [[if attack.element IS wind]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Wind Amp]]
--a function: status
spell["targetattribute"] = [[Attack]]
spell["numericalvalue"] = 50
--a function: costtype
return spell
