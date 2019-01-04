local freeroam = {}

function freeroam.refresh()
	state.update = json.encode({key="USER FREE ROAM"})
end

function freeroam.processinput()
end

function freeroam.loadcontext()
	print("Loaded into "..state.env.name)
	freeroam.refresh()
end

return freeroam