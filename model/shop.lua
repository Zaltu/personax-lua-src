local shop = {}
local current

local function _load(shopinquestion)
	shop.menu = require("data/shops/"..shopinquestion)
end

function shop.refresh()
	state.update = json.encode(current)
end

function shop.processinput()
	current = shop.menu[current[state.context.shopindex]]
	--Handle exit nodes
	if type(current) == "function" then current() return end
	shop.refresh()
end

function shop.loadcontext(shopinquestion)
	_load(shopinquestion)
	current = shop.menu.top
	shop.refresh()
end

return shop