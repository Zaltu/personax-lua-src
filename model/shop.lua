local json = require ('json_reader')
local shop = {}
local current


local function _load(shopinquestion)
	shop.menu = require("data/shops"..shopinquestion)
end


function shop.refresh()
	state.update = current
end


function shop.processinput()
	current = shop.menu[current[state.context.shopindex]]
	shop.refresh()
end

function shop.loadcontext(shopinquestion)
	_load(shopinquestion)
	current = shop.menu.top
	shop.refresh()
end


return shop