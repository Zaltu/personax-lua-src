local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Support]]
spell["cost"] = 25
spell["desc"] = [[Escape from battle (some battle must be fought to the end!)]]
spell["numberofhits"] = 1
spell["conditional"] = [[if battle.boss IS NOT TRUE]]
spell["hitchance"] = 100
--a function: target
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Trafuri]]
spell["status"] = [[None]]
--a function: targetattribute
--a function: numericalvalue
spell["costtype"] = [[SP]]
return spell
