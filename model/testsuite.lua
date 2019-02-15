--These are tests written to confirm the proper functionality of the logic model. Run in command line
--to view comprehensive analysis of what the model is providing.
--All calls to the model should respect the formats shown here.

-- FOR WINDOWS TESTING
package.path= package.path..";C:/LUA/lua/?.lua"
package.cpath= package.cpath..";C:/LUA/lua/lib/lua/5.1/?.dll"


--Set ./modal/ to the lua path for testing
package.path = package.path..";./model/?.lua;"
require('state')
local json = require('json_reader')
local pprint = function (value) local inspect = require("inspect") print(inspect(value)) end

function setState()
	state.evolve('Version', '0.0.0.0.5')
	state.evolve('mc', {name='Chaos'})
	state.evolve('date', {day=1, time=0})
	state.savestate(nil)
end


function shop()
	state.changecontext('shop', 'trainer', 'home')
	-- Select Buy Item
	state.event(json.encode({shopindex=1}))
	-- Select Back
	state.event(json.encode({shopindex=0}))
	-- Select Sell Item
	state.event(json.encode({shopindex=2}))
	-- Select Back
	state.event(json.encode({shopindex=0}))
	--Select Exit and pass time
	state.event(json.encode({shopindex=0}))
end

function link()
	state.changecontext('link', 'Aeon')

	state.event(json.encode({key="link.action", index=0}))
	state.event(json.encode({key="link.action", index=0}))
	state.event(json.encode({key="link.action", index=0}))
	state.event(json.encode({key="link.action", index=0}))
	state.event(json.encode({key="link.action", index=0}))
	state.event(json.encode({key="link.action", index=1}))

	state.changecontext("calendar")
end

function battle()
	state.loadenv("barbariccia")
	state.changecontext('battle', 1)

	state.event(json.encode({key="battle.userinput", targetindex=5, spellindex=1}))
end

function dayChange()
	state.changecontext("calendar")
	state.changecontext("calendar", 42)
end


function test(feature)
	setState()
	state.changecontext("calendar")
	feature()
	print("\nState")
	--pprint(state)
	for key, value in pairs(state) do print(key, value) end
	print("\nContext")
	--pprint(state.context)
	for key, value in pairs(state.context) do print(key, value) end
	print("\nBattle")
	pprint(state.battle)
	print("\nRefresh")
	pprint(state.update)
end

test(battle)
--test(link)
--test(dayChange)
--test(shop)