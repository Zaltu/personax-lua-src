local cutscene = {}

local function showSpeak(caller)
	local choices = {}
	if #state.cut.open > 2 then
		for i=2, #state.cut.open do
			choices[#choices+1]=state.cut.items[state.cut.open[i]+1][1].text
			--Get the item at the NON-LUA index specified in the current action's nexts from the cutscene's registry
			--And append that item's text to the possible choices in the dialog box
		end --Won't show anything for physical action based choices
	end
	return {
		key=caller..".show.speak",
		text=state.cut.open[1].text,
		speaker=state.cut.open[1].speaker,
		emotion=state.cut.open[1].emotion,
		options=choices
	}
end

local function showMove(caller)
	return {
		key=caller..".show.move",
		subject=state.cut.open[1].subject,
		animation=state.cut.open[1].animation,
		destination=state.cut.open[1].destination
	}
end

--local function showInfo() end Ignore Info actions. These should never show up in the game

local function showCam(caller)
	if state.cut.open[1].place=="Loading" then if not state.isloading then state.loading(true) else state.isloading(false) end end
	return {
		key=caller..".show.camera",
		place=state.cut.open[1].place,
		cameraPosition=state.cut.open[1].cameraPosition,
		lookAt=state.cut.open[1].lookAt
	}
end

local function _load(cutname)
	loadedinline = require("data/cutscenes/"..cutname)
	state.cut = loadedinline
	state.cut.open = loadedinline.items[1]
	state.cut.index = 2
end

function cutscene.processinput()
	if state.context.index then
		state.cut.index = state.context.index+2
		state.context.index=nil
	end
	if state.cut.open[state.cut.index] then
		state.cut.open = state.cut.items[state.cut.open[state.cut.index]+1]
		setShowType("cutscene")
	else
		state.changecontext("calendar")
	end
	refresh()
end

function cutscene.loadcontext(inlinename)
	_load(inlinename)
	setShowType("cutscene")
	refresh()
end

--This is a public static function so inline and link can use it without changing contexts.
function setShowType(caller)
	if state.cut.open[1].points then
		state.cut.open.show=showSpeak(caller)
	elseif state.cut.open[1].place then
		state.cut.open.show=showCam(caller)
	elseif state.cut.open[1].animation then
		state.cut.open.show=showMove(caller)
	end
end

--This is a PUBLIC STATIC UPDATE FUNCTION so inline and link can use it without changing contexts
function refresh()
	if state.cut.open.show then
		state.update = json.encode(state.cut.open.show)
	elseif state.cut.open[1].text then--TODO: For testing only
		state.update = json.encode({
			key="cutscene.show.info",
			text=state.cut.open[1].text,
		})
	end
end

return cutscene


--HARD-CODED THINGS:
--"Loading" place (local showCam())