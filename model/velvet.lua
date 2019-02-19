local velvet = {}
local current

velvet.exit         = function () state.changecontext("freeroam") end
velvet.top          = {[0]="exit", "Fusion", "Compendium", "Quests", "Help", "Leave"}
velvet.Fusion       = {[0]="top", "Standard Fusion", "Three-way Fusion", "Special Fusion"}
velvet.Compendium   = {[0]="top", "Unimplemented"}
velvet.Quests       = {[0]="top", "Unimplemented"}
velvet.Leave        = trainer.exit


function velvet.refresh()
	state.update = json.encode(current)
end

function velvet.processinput()
	current = shop.menu[current[state.context.shopindex]]
	--Handle function nodes
	if type(current) == "function" then current() return end
	velvet.refresh()
end

function velvet.loadcontext()
	current = velvet.top
	velvet.refresh()
end

return velvet