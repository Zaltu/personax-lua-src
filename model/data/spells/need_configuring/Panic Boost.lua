local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Status]]
--a function: cost
spell["desc"] = [[Raises chance to panic to the enemy]]
--a function: numberofhits
spell["conditional"] = [[if attack.status IS panic THEN BOOST chance]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
spell["statuschance"] = 25
spell["name"] = [[Panic Boost]]
spell["status"] = [[Panic]]
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
return spell
