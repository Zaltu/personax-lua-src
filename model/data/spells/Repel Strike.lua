local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Strike]]
--a function: cost
spell["desc"] = [[Raise resistance against strike attacks to 'Repel']]
--a function: numberofhits
spell["conditional"] = [[REPEL]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Repel Strike]]
--a function: status
spell["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
return spell
