local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Status]]
spell["cost"] = 15
spell["desc"] = [[Raises chance of inflicting status ailments on everyone]]
--a function: numberofhits
spell["conditional"] = [[FOR ALL IN status RAISE status_chance]]
--a function: hitchance
spell["target"] = [[All]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Foul Breath]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
spell["costtype"] = [[SP]]
return spell
