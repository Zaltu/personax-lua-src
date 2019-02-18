--need setShowType and refresh
require("cutscene")
local inline = {}

local function _load(inlinename)
	loadedinline = require("data/inline/"..inlinename)
	state.cut = loadedinline
	state.cut.open = loadedinline.items[1]
	state.cut.index = 2
end

function processinput()
	if state.context.index then
		state.cut.index = state.context.index+2
		state.context.index=nil
	end
	if state.cut.open[state.cut.index] then
		state.cut.open = state.cut.items[state.cut.open[state.cut.index]+1]
		setShowType("inline")
	else
		state.context.processinput = inline.hijacked
		state.context.processinput()
		return
	end
	refresh()
end

function loadinline(inlinename)
	inline.hijacked = state.context.processinput
	state.context.processinput = processinput
	_load(inlinename)
	setShowType("inline")
	refresh()
end
