local freeroam = {}

function freeroam.refresh()
	state.update = json.encode({key="USER FREE ROAM"})
end

function freeroam.processinput()
	print("Ignore input, user in free-roam")
	freeroam.refresh()
end

function freeroam.loadcontext()
	print("Loaded into "..state.env.name)
	freeroam.refresh()
end

return freeroam