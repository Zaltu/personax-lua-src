local freeroam = require("freeroam")
local dungeon = {}

function dungeon.processinput()
	--[[
	Process an input recieved while in the dungeon context.
	Most inputs do nothing, and are therefore off-handled
	to the pre-existing freeroam refresh. If there is a
	powerlevel provided though, we assume that the player
	has encountered an enemy and we must enter the battle
	context.
	]]--
	if state.powerlevel then
		--Battle start
		state.changecontext("battle", state.powerlevel)
		state.powerlevel = nil
		return
	end
	freeroam.refresh()
end

function dungeon.loadcontext()
	--[[
	Very basic process of loading the dungeon context.
	Offloaded to freeroam.
	]]--
	print("Loaded into "..state.env.name)
	freeroam.refresh()
end

return dungeon