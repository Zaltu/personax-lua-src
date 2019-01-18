local converter = require('jsontolua')
local json = require("json_reader_util")

spells = json.read("../json_data/spells.json")
print(spells)
for spellname, spell in pairs(spells) do
	converter.convertSpell(spell, "spells/"..spellname..".lua")
end

--[[
for key, value in pairs(spells) do
	func = "local spell = {}\n"
	if value.element=='Fire' then
		if type(value.numericalvalue)=='number' and type(value.cost)=='number' then
			for att, atval in pairs(value) do
				func=func.."spell."..att.." = "..atval.."\n"
			end
			func=func.."function spell.activate()\n"
			func=func.."    state.battle.checkres()\n"
			func=func.."    state.battle.cost(\""..value.costtype.."\","..value.cost..")\n"
			func=func.."    state.battle.attack("..value.numericalvalue..",\""..value.targetattribute.."\","..value.numericaltype..","..value.numberofhits..")\n"
			func=func.."end\n\n"
			func=func.."spell."
		end
		--for a, b in pairs(value) do print(a, b) end
		local file = io.open(key..".lua", 'w')
		if not file then
			error("Can't write to "..key..".lua")
		end
		file:write(func)
		file:close()
	end
end]]