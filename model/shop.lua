local json = require ('json_reader')
local shop = {}
local current


local function _load(shopinquestion)
	shop.menu=json.read({file='shopex.json'})[shopinquestion]
end


function shop.refresh()
	local state = require('state')
	local json = require("json_reader")
	state.update = json.encode(current)
end


function shop.processinput()
	local state = require("state")
	current = shop.menu[current[state.context.shopindex]]
	shop.refresh()
end

function shop.loadcontext(shopinquestion)
	local state = require('state')
	state.context=shop
	_load(shopinquestion)
	current = shop.menu.top
	local inspect = require "inspect"
	print(inspect(shop))
	shop.refresh()
end


return shop