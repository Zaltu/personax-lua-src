local freeroam = {}

function freeroam.refresh()
	--[[
	Freeroam context does not cause a view update
	]]--
	state.update = json.encode({key="USER FREE ROAM"})
end

function freeroam.processinput()
	--[[
	Freeroam context has no valid inputs that need processing
	]]--
	print("Ignore input, user in free-roam")
	freeroam.refresh()
end

function freeroam.loadcontext()
	--[[
	Load the "context" freeroam. Since this is mostly a user movement mode, there is nearly nothing to keep track of.
	The ENV is used to determine what UE level to use, and UE objects will hold the state.env functions to call, so this context clears the state.
	]]--
	print("Loaded into "..state.env.name)
	state.context = {}
	freeroam.refresh()
end

return freeroam