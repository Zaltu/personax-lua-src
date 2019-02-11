local spell = {}
spell = {}
spell["numericaltype"] = [[Absolute Value]]
spell["element"] = [[Almighty]]
--a function: cost
spell["desc"] = [[Take a small amount of SP from the enemy]]
spell["numberofhits"] = 1
spell["conditional"] = [[self.sp.add(attack.damage)]]
spell["hitchance"] = 100
spell["target"] = [[One Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Spirit Drain]]
--a function: status
spell["targetattribute"] = [[SP]]
spell["numericalvalue"] = 20
--a function: costtype
return spell
