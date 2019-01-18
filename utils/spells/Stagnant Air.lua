local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Status]]
spell["cost"] = 15
spell["desc"] = [[Raises chance to inflict statuses on the enemy]]
--a function: numberofhits
spell["conditional"] = [[if attack.status THEN BOOST chance]]
--a function: hitchance
spell["target"] = [[All]]
spell["passive"] = false
spell["statuschance"] = 100
spell["name"] = [[Stagnant Air]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
spell["costtype"] = [[SP]]
return spell
