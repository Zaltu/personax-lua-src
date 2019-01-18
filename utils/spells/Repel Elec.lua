local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Elec]]
--a function: cost
spell["desc"] = [[Raise resistance against electric attacks to 'Repel']]
--a function: numberofhits
spell["conditional"] = [[REPEL]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Repel Elec]]
--a function: status
spell["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
return spell
