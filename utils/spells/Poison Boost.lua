local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Status]]
--a function: cost
spell["desc"] = [[Raises chance to poison to the enemy]]
--a function: numberofhits
spell["conditional"] = [[if attack.status IS poison THEN BOOST chance]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
spell["statuschance"] = 25
spell["name"] = [[Poison Boost]]
spell["status"] = [[Poison]]
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
return spell
