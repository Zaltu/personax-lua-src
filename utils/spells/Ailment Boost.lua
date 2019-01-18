local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Status]]
--a function: cost
spell["desc"] = [[Raises chance to inflict statuses on the enemy]]
--a function: numberofhits
spell["conditional"] = [[if attack.status IS NOT null THEN BOOST chance]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
spell["statuschance"] = 25
spell["name"] = [[Ailment Boost]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
return spell
