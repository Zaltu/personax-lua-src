local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Fire]]
--a function: cost
spell["desc"] = [[Greatly raises damage of all fire attacks]]
--a function: numberofhits
spell["conditional"] = [[if attack.element IS fire]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Fire Amp]]
--a function: status
spell["targetattribute"] = [[Attack]]
spell["numericalvalue"] = 50
--a function: costtype
return spell
