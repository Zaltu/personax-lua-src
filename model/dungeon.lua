local dungeon = {}

function dungeon.refresh()
	state.update = json.encode({key="USER FREE ROAM"})
end

function dungeon.processinput(powerlevel)
	if powerlevel then
		--Battle start
		state.changecontext("battle", powerlevel)
		return
	end
	freeroam.refresh()
end

function dungeon.loadcontext()
	print("Loaded into "..state.env.name)
	freeroam.refresh()
end

return dungeon