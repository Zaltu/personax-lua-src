--need setShowType and refresh
require("cutscene")
local inline = {}

local function _load(inlinename)
	loadedinline = dofile(DATAPATH.."inline/"..inlinename..".lua")
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
		--Inline done. Revert and continue previous action
		state.context.processinput = inline.jackedprocessinput
		state.context.index = inline.jackedindex
		state.cut = inline.jackedcut
		state.context.processinput()
		return
	end
	refresh()
end

function loadinline(inlinename)
	inline.jackedprocessinput = state.context.processinput
	inline.jackedindex = state.context.index
	inline.jackedcut = state.cut
	state.context.processinput = processinput
	_load(inlinename)
	setShowType("inline")
	refresh()
end
