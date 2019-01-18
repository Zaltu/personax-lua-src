local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
--a function: cost
spell["desc"] = [[Heals a small amount of HP and SP after each battle]]
--a function: numberofhits
spell["conditional"] = [[if battle.end]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Cool Breeze]]
--a function: status
spell["targetattribute"] = [[HP/SP]]
spell["numericalvalue"] = 8
--a function: costtype
return spell
