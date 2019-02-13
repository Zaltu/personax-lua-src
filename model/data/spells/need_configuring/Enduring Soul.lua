local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Support]]
--a function: cost
spell["desc"] = [[Survive a lethal blow and heal all HP once per battle]]
--a function: numberofhits
spell["conditional"] = [[if attack.damage IS LETHAL AND spell.used IS FALSE THEN self.hp=self.HP]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = true
--a function: statuschance
spell["name"] = [[Enduring Soul]]
--a function: status
spell["targetattribute"] = [[HP]]
--a function: numericalvalue
--a function: costtype
return spell
