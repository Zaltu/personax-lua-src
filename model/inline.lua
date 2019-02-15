local inline = {}

local function _load(inlinename)
	loadedinline = require("data/inline/"..inlinename)
	state.cut = loadedinline
	state.cut.open = loadedinline.items[1]
	state.cut.index = 2
end

local function showSpeak()
	local choices = {}
	if #state.cut.open > 2 then
		for i=2, #state.cut.open do
			choices[#choices+1]=state.cut.items[state.cut.open[i]+1][1].text
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

function inline.refresh()--Send update to graphic view
	if state.cut.open.show then
		state.update = json.encode(state.cut.open.show)
	elseif state.cut.open[1].text then--For testing only
		state.update = json.encode({
			key="link.show.info",
			text=state.cut.open[1].text,
		})
	end
end

local function setShowType()
	if state.cut.open[1].points then
		state.cut.open.show=showSpeak()
	elseif state.cut.open[1].place then
		state.cut.open.show=showCam()
	elseif state.cut.open[1].animation then
		state.cut.open.show=showMove()
	end
end

function inline.processinput()
	if state.context.index then
		state.cut.index = state.context.index+2
		state.context.index=nil
	end
	if state.cut.open[state.cut.index] then
		state.cut.open = state.cut.items[state.cut.open[state.cut.index]+1]
		setShowType()
	else-- inline cutscene over
		state.changecontext("freeroam")
	end
	inline.refresh()
end

function inline.loadcontext(inlinename)
	_load(inlinename)
	setShowType()
	inline.refresh()
end

--HARD-CODED THINGS:
--"Loading" place (local showCam())
return inline