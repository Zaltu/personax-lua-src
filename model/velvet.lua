local velvet = {}
local current

velvet.exit         = function () state.changecontext("freeroam") end
velvet.top          = {[0]="exit", "Fusion", "Compendium", "Quests", "Help", "Leave"}
velvet.Fusion       = {[0]="top", "Standard Fusion", "Three-way Fusion", "Special Fusion"}
velvet.Compendium   = {[0]="top", "Unimplemented"}
velvet.Quests       = {[0]="top", "Unimplemented"}
velvet.Leave        = trainer.exit


local function _load(shopinquestion)
	shop.menu = require("data/shops/"..shopinquestion)
end

function velvet.refresh()
	state.update = json.encode(current)
end

function velvet.processinput()
	current = shop.menu[current[state.context.shopindex]]
	--Handle exit nodes
	if type(current) == "function" then current() return end
	velvet.refresh()
end

function velvet.loadcontext(shopinquestion)
	_load(shopinquestion)
	current = shop.menu.top
	velvet.refresh()
end

return velvet