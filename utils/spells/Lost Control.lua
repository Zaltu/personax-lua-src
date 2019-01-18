local spell = {}
spell = {}
--a function: numericaltype
--a function: element
--a function: cost
spell["desc"] = [[I can't... I... I've lost control!

Player can no longer control the character and he no longer distinguishes friend from foe *CHAOS ONLY*]]
--a function: numberofhits
spell["conditional"] = [[if chaos IN party THEN REMOVE FINALLY newparty.add(Chaos)]]
--a function: hitchance
spell["target"] = [[Self]]
spell["passive"] = false
--a function: statuschance
spell["name"] = [[Lost Control]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
return spell
