local shop = {}
local current

local function _load(shopinquestion)
	shop.menu = require("data/shops/"..shopinquestion)
end

function shop.refresh()
	state.update = current
end

function shop.processinput()
	current = shop.menu[current[state.context.shopindex]]
	--Handle exit nodes
	if type(current) == "function" then current(shop.location) return end
	shop.refresh()
end

function shop.loadcontext(shopinquestion, location)
	_load(shopinquestion)
	shop.location = location
	current = shop.menu.top
	shop.refresh()
end

return shop