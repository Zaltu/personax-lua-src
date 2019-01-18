local spell = {}
spell = {}
spell["numericaltype"] = [[Percentage]]
spell["element"] = [[Support]]
--a function: cost
spell["desc"] = [[Raises damage done with two-handed swords]]
--a function: numberofhits
spell["conditional"] = [[if self.weapon.type IS HHSWD]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[2h Swd Master]]
--a function: status
spell["targetattribute"] = [[Attack]]
spell["numericalvalue"] = 100
--a function: costtype
return spell
