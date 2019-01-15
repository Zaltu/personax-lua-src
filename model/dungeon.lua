local dungeon = {}

function dungeon.refresh()
	state.update = json.encode({key="USER FREE ROAM"})
end

function dungeon.processinput()
	print("Ignore input, user in free-roam")
	freeroam.refresh()
end

function dungeon.loadcontext()
	print("Loaded into "..state.env.name)
	freeroam.refresh()
end

return dungeon