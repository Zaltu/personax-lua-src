local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Ice]]
--a function: cost
spell["desc"] = [[Raise resistance against ice attacks to 'Drain']]
--a function: numberofhits
spell["conditional"] = [[DRAIN]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Drain Ice]]
--a function: status
spell["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
return spell
