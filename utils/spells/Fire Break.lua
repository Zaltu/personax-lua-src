local spell = {}
spell = {}
--a function: numericaltype
spell["element"] = [[Fire]]
spell["cost"] = 40
spell["desc"] = [[Reduces fire resistance of one foe to 'Normal']]
spell["numberofhits"] = 1
spell["conditional"] = [[NORMAL]]
spell["hitchance"] = 100
spell["target"] = [[One Enemy]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Fire Break]]
spell["status"] = [[None]]
spell["targetattribute"] = [[Resistance]]
--a function: numericalvalue
spell["costtype"] = [[SP]]
return spell
