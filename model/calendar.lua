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
	print("It is now "..calendar.now.state.name)
	state.loadenv(calendar.now.env)
	state.changecontext(calendar.now.context)
end

function calendar.passDay()
	state.date.day = state.date.day + 1
	calendar.time = 0
	calendar.day = require("data/days/day_"..state.date.day)
	--Inform UI
	print("The date is now "..state.day.date[1].." "..state.day.date[2])
	state.changecontext("calendar")
end

function calendar.loadcontext(hardset)
	state.lock()
	if not hardset then calendar.passTime() state.unlock() return end
	--We increment state.date.day later...
	state.date.day = hardset - 1
	calendar.passDay()
	state.unlock()
end

return calendar
