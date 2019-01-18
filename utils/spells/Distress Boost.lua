local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Status]]
--a function: cost
spell["desc"] = [[Raises chance to distress the enemy]]
--a function: numberofhits
spell["conditional"] = [[if attack.status IS distress THEN BOOST chance]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
spell["statuschance"] = 25
spell["name"] = [[Distress Boost]]
spell["status"] = [[Distress]]
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
return spell
