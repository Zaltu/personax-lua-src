local link = {}

local function _load(arcana)
	local level = state.slglobal[arcana].level
	local angle = state.slglobal[arcana].angle
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
		if (string.find(key, level..'_') and loopangle<=angle and ( (ladder and loopangle>ladder) or not angleladder.angle)) then
			angleladder.cutscene=value
			angleladder.angle=key
		end
		if string.find(key, level..'_') and (ladderdown==nil or loopangle>ladderdown) then ladderdown=loopangle end
		if string.find(key, level..'_') and (ladderup==nil or loopangle<ladderup) then ladderup=loopangle end
	end
	if angleladder.angle==nil then
		if angle>ladderdown then
			angleladder.angle=level..'_'..ladderdown
			angleladder.cutscene=link.cutscenes[level..'_'..ladderdown]
		else
			angleladder.angle=level..'_'..ladderup
			angleladder.cutscene=link.cutscenes[level..'_'..ladderup]
		end
	end
	state.cut = angleladder
	state.cut.open = angleladder.cutscene.items[1]
	state.cut.index = 2
end

local function showSpeak()
	local choices = {}
	if #state.cut.open > 2 then
		for i=2, #state.cut.open do
			choices[#choices+1]=state.cut.cutscene.items[state.cut.open[i]+1][1].text
			--Get the item at the NON-LUA index specified in the current action's nexts from the cutscene's registry
			--And append that item's text to the possible choices in the dialog box
		end --Won't show anything for physical action based choices
	end
	return {
		key="link.show.speak",
		text=state.cut.open[1].text,
		speaker="sprite_"..state.cut.open[1].speaker.."_emotion",
		options=choices
		--Need emotion (domo arigatou, Mr. Roboto)
	}
end

local function showMove()
	return {
		key="link.show.move",
		subject=state.cut.open[1].subject,
		animation=state.cut.open[1].animation,
		destination=state.cut.open[1].destination
	}
end

--local function showInfo() end Ignore Info actions. These should never show up in the game

local function showCam()
	if state.cut.open[1].place=="Loading" then if not state.isloading then state.loading(true) else state.isloading(false) end end
	return {
		key="link.show.camera",
		place=state.cut.open[1].place,
		cameraPosition=state.cut.open[1].cameraPosition,
		lookAt=state.cut.open[1].lookAt
	}
end

function link.refresh()--Send update to graphic view
	if state.cut.open.show then
		--print("\nAction:\n"..state.cut.open[1].text.."\n")--For testing only.
		state.update = json.encode(state.cut.open.show)
	elseif state.cut.open[1].text then--For testing only
		state.update = json.encode({
			key="link.show.info",
			text=state.cut.open[1].text,
		})
	end
end

local function setShowType(state)
	if state.cut.open[1].points then
		state.cut.open.show=showSpeak()
	elseif state.cut.open[1].place then
		state.cut.open.show=showCam()
	elseif state.cut.open[1].animation then
		state.cut.open.show=showMove()
	end
end

function link.processinput()
	state.cut.index=2
	if state.context.index then
		state.cut.index = state.context.index+2
		state.context.index=nil
	end
	if state.cut.open[state.cut.index] then
		state.cut.open = state.cut.cutscene.items[state.cut.open[state.cut.index]+1]
		setShowType(state)
	else-- SL Cutscene over
		state.changecontext("calendar")
		return
	end
	link.refresh()
end

function link.loadcontext(arcana)
	_load(arcana)
	setShowType(state)
	link.refresh()
end

return link


--HARD-CODED THINGS:
--"Loading" place (local showCam())