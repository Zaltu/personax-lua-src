local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
--a function: cost
spell["desc"] = [[Greatly increase effectiveness of heal spells]]
--a function: numberofhits
spell["conditional"] = [[if attack.element IS support and target IS IN friends and target_attribute IS HP]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Divine Grace]]
--a function: status
spell["targetattribute"] = [[Attack]]
spell["numericalvalue"] = 100
--a function: costtype
return spell
