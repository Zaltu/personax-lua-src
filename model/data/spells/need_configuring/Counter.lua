local spell = {}
spell = {}
--a function: numericaltype
--a function: element
--a function: cost
spell["desc"] = [[Small chance to counter physical attacks]]
--a function: numberofhits
spell["conditional"] = [[if attack.element IN physical]]
spell["hitchance"] = 15
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Counter]]
--a function: status
spell["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
return spell
