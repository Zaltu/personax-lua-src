local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Support]]
--a function: cost
spell["desc"] = [[Survive a lethal blow with 1 HP once per battle]]
--a function: numberofhits
spell["conditional"] = [[if attack.damage IS LETHAL AND spell.used IS FALSE THEN self.hp=1]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Endure]]
--a function: status
spell["targetattribute"] = [[HP]]
--a function: numericalvalue
--a function: costtype
return spell
