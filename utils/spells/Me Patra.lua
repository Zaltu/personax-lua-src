local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Support]]
spell["cost"] = 6
spell["desc"] = [[Cures panic, fear and distress in all allies]]
--a function: numberofhits
spell["conditional"] = [[panic OR fear OR distress]]
--a function: hitchance
spell["target"] = [[All Ally]]
spell["passive"] = false
spell["statuschance"] = 100
spell["name"] = [[Me Patra]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
spell["costtype"] = [[SP]]
return spell
