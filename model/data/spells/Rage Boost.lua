local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Status]]
--a function: cost
spell["desc"] = [[Raises chance to instill rage in the enemy]]
--a function: numberofhits
spell["conditional"] = [[if attack.status IS rage THEN BOOST chance]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
spell["statuschance"] = 25
spell["name"] = [[Rage Boost]]
spell["status"] = [[Rage]]
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
return spell
