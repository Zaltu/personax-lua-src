--need setShowType and refresh
require("cutscene")
rankup = require('util/link/rankup')
local link = {}

local function _load(arcana)
	state.context.arcana = arcana
	state.context.level = state.slglobal[arcana].level
	state.context.angle = state.slglobal[arcana].angle
	local link = require("data/links/"..arcana.."_link")
	local angleladder = {angle=nil}
	local ladderdown = nil
	local ladderup = nil
	for key, value in pairs(link.cutscenes) do
		local loopangle = tonumber(string.sub(key, string.find(key, '_')+1, -1))
		local ladder = nil
		if angleladder.angle then
			ladder = tonumber(string.sub(angleladder.angle, string.find(angleladder.angle, '_')+1, -1))
		end
		if (string.find(key, state.context.level..'_') and loopangle<=state.context.angle and ( (ladder and loopangle>ladder) or not angleladder.angle)) then
			angleladder.cutscene=value
			angleladder.angle=key
		end
		if string.find(key, state.context.level..'_') and (ladderdown==nil or loopangle>ladderdown) then ladderdown=loopangle end
		if string.find(key, state.context.level..'_') and (ladderup==nil or loopangle<ladderup) then ladderup=loopangle end
	end
	state.cut.cutangle = state.context.angle
	if angleladder.angle==nil then
		if state.context.angle>ladderdown then
			angleladder.angle=state.context.level..'_'..ladderdown
			angleladder.cutscene=link.cutscenes[state.context.level..'_'..ladderdown]
			state.cut.cutangle = ladderdown
		else
			angleladder.angle=state.context.level..'_'..ladderup
			angleladder.cutscene=link.cutscenes[state.context.level..'_'..ladderup]
			state.cut.cutangle = ladderup
		end
	end
	state.cut = angleladder.cutscene
	state.cut.open = angleladder.cutscene.items[1]
	state.cut.index = 2
end

function link.processinput()
	--TODO change this pls only exists to check if SL is starting
	state.cut.index=2
	if state.context.index then
		state.cut.index = state.context.index+2
		state.context.index=nil
	end
	if state.cut.open[state.cut.index] then
		state.cut.open = state.cut.items[state.cut.open[state.cut.index]+1]
		if state.cut.open.rankup then
			rankup.hijack()
			link.rankedup = true
		else
			setShowType("link")
		end
	else--SL Cutscene over
		if not link.rankedup then rankup.hijack() link.rankedup = true return end
		--We don't dofile link, so reset for next time
		link.rankedup = false
		--SLs force calendar change
		state.changecontext("calendar")
		return
	end
	refresh()
end

function link.loadcontext(arcana)
	_load(arcana)
	state.cut.name = arcana..state.slglobal[arcana].level..state.cut.cutangle
	setShowType("link")
	refresh()
end

return link
