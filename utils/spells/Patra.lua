local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Support]]
spell["cost"] = 3
spell["desc"] = [[Cures panic, fear and distress in one ally]]
--a function: numberofhits
spell["conditional"] = [[panic OR fear OR distress]]
--a function: hitchance
spell["target"] = [[One Ally]]
spell["passive"] = false
spell["statuschance"] = 100
spell["name"] = [[Patra]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
spell["costtype"] = [[SP]]
return spell
