local spell = {}
spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Almighty]]
--a function: cost
spell["desc"] = [[Take a small amount of HP from the enemy]]
spell["numberofhits"] = 1
spell["conditional"] = [[self.hp.add(attack.damage)]]
spell["hitchance"] = 100
spell["target"] = [[One Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Life Drain]]
--a function: status
spell["targetattribute"] = [[HP]]
spell["numericalvalue"] = 35
--a function: costtype
return spell
