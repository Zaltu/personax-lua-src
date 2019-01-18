local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Fire]]
--a function: cost
spell["desc"] = [[Raise resistance against fire attacks to 'Repel']]
--a function: numberofhits
spell["conditional"] = [[REPEL]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Repel Fire]]
--a function: status
spell["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
return spell
