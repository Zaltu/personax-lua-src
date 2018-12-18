local calendar = {}

calendar.day = require("data/days/day_"..state.date.day)
calendar.time = 0
calendar.now = nil

function calendar.passTime()
	calendar.time = calendar.time + 1
	calendar.now = calendar.day[calendar.time]
	if not calendar.now then
		return calendar.passDay()
	end
	if calendar.now.actions then
		return calendar.now.actions()
	end
	--Inform UI
	state.update = {"It is now "..calendar.now.state.name}
	state.loadenv("data/envs/"..calendar.now.env)
	state.changecontext(calendar.now.context)
end

function calendar.passDay()
	state.date.day = state.date.day + 1
	--Inform UI
	calendar.time = 0
	calendar.day = require("data/days/day_"..state.date.day)
	state.changecontext("calendar")
end

function calendar.loadcontext(hardset)
	state.lock()
	if not hardset then calendar.passTime() state.unlock() return end
	state.date.day = hardset - 1
	calendar.passDay()
	state.unlock()
end

return calendar


--Caldendar contexts are somewhat unique in that they can call other contexts during their context load
--This is intended to have as result that the "sub"-context is loaded while the UI is showing the calendar
--context load screen.
--
--The calendar contexts DO NOT HAVE REFRESH FUNCTIONS. This means that if the state is saved during a calendar
--context, the game will not be able to continue on loadstate, as the state.event call will be locked and
--won't accept processinput commands