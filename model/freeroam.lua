local freeroam = {}

function freeroam.refresh()
	--[[
	Freeroam context does not cause a view update
	]]--
	state.update = json.encode({key="USER FREE ROAM"})
end

function freeroam.processinput()
	--[[
	]]--
	print("Searching for valid actor reference")
	state.env[state.context.actor]()
	freeroam.refresh()
end

function freeroam.loadcontext()
	--[[
	Load the "context" freeroam. Since this is mostly a
	user movement mode, there is nearly nothing to keep
	track of.
	]]--
	print("Loaded into "..state.env.name)
	freeroam.refresh()
end

return freeroam