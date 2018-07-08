function read()
	local json = require('cjson')
	local file = io.open('spells.json')
	if not file then
		error("This file does not exist.")
	end
	local todecode = file:read "*a"
	file:close()
	return json.decode(todecode)
end

spells=read()

for key, value in pairs(spells) do
	func = "local state = require('state')\n"
	if value.element=='Fire' then
		if type(value.numericalvalue)=='number' and type(value.cost)=='number' then
			print(key, value.cost)
			if value.target=='One Enemy' then func=func.."state.battle.choosetarget('ene')\n"
			else func=func.."if state.battle.party[state.battle.participants[state.battle.open].name] then state.battle.target=state.battle.ene else state.battle.target=state.battle.party\n" end
			func=func.."state.battle.checkres()\n"
			func=func.."state.battle.participants[state.battle.open].evolve("..value.costtype..","..value.cost..")\n"
			func=func.."for i=1, #state.battle.target do state.battle.participants[state.abttle.target[i]].evolve("..value.numericalvalue..","..value.targetattribute..","..value.numericaltype..","..value.numberofhits..")\n"
		end
		--for a, b in pairs(value) do print(a, b) end
		local file = io.open(key..".lua", 'w')
		if not file then
			error("Can't write to "..key..".lua")
		end
		file:write(func)
		file:close()
	end
end