local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
--a function: cost
spell["desc"] = [[Reduce HP cost of spells by half]]
--a function: numberofhits
spell["conditional"] = [[if attack.cost_type IS HP OR HP% THEN REDUCE]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Arms Master]]
--a function: status
--a function: targetattribute
spell["numericalvalue"] = 50
--a function: costtype
return spell
