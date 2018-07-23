--These are tests written to confirm the proper functionality of the logic model. Run in command line
--to view comprehensive analysis of what the model is providing.
--All calls to the model should respect the formats shown here.
require('state')
local json = require('json_reader')
local pprint = function (value) local inspect = require("inspect") print(inspect(value)) end

function setState()
	state.evolve('Version', '0.0.0.0.5')
	state.evolve('mc', {['name']='Chaos'})
	state.evolve('slglobal', {['Aeon']={level=1, angle=0}})
	state.savestate(nil)
end


function shop()
	state.changecontext('shop', 'trainer')
	-- Select Buy Item
	state.event(json.encode({shopindex=1}))
	-- Select Back
	state.event(json.encode({shopindex=0}))
	-- Select Sell Item
	state.event(json.encode({shopindex=2}))
	-- Select Back
	state.event(json.encode({shopindex=0}))
end

function link()
	state.changecontext('link', {arcana='Aeon'})

	state.event(json.encode({key="link.action", index=0}))
	state.event(json.encode({key="link.action", index=0}))
	state.event(json.encode({key="link.action", index=0}))
	state.event(json.encode({key="link.action", index=0}))
	state.event(json.encode({key="link.action", index=0}))
	state.event(json.encode({key="link.action", index=1}))
end

function battle()
	--LEGACY/PROOF OF CONCEPT
	--Based on receiving individual inputs
	shadowep=json.read({file='Seraph.json'})
	aigis=json.read({file='Cherub.json'})
	mc=json.read({file='Dominion.json'})

	state.changecontext('battle', {['party']={{['name']='Aigis', ['persona']=aigis}, {['name']='MC', ['persona']=mc}}, ['ene']={{['name']='Shadow', ['persona']=shadowep}}})

	state.input('select')
	state.input('select')
	state.input('select')

	state.savestate(nil)
end

function link_legacy()
	state.changecontext('link', {arcana='Aeon', level='1', angle='0'})

	state.input('select')
	state.input('select')
	state.input('select')
	state.input('select')
	state.input('select')
	state.input('up')
	state.input('select')
	state.input('select')
end

function test(feature)
	setState()
	feature()
	print("\nState")
	--pprint(state)
	for key, value in pairs(state) do print(key, value) end
	print("\nContext")
	--pprint(state.context)
	for key, value in pairs(state.context) do print(key, value) end
	print("\nRefresh")
	pprint(json.decode(state.update))
	--for key, value in pairs(json.decode(state.update)) do print(key, value) end
	--print(#state.update.options.." options")
end

--test(battle)
--test(link)
test(link)
