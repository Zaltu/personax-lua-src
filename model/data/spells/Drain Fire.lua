local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Fire]]
--a function: cost
spell["desc"] = [[Raise resistance against fire attacks to 'Drain']]
--a function: numberofhits
spell["conditional"] = [[DRAIN]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Drain Fire]]
--a function: status
spell["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
return spell
