local calendar = {}

calendar.day = require("data/days/day_"..state.date.day)
calendar.time = 0
calendar.now = nil

function calendar.passTime()
	--[[
	Advance the timeslot to the next available one in the current day.
	If no more timeslots exist within the day, advance to the next existing day.
	]]--
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
	--[[
	Advance to the next day and process it.
	]]--
	state.date.day = state.date.day + 1
	calendar.time = 0
	calendar.day = require("data/days/day_"..state.date.day)
	--Inform UI
	print("The date is now "..state.day.date[1].." "..state.day.date[2])
	state.changecontext("calendar")
end

function calendar.loadcontext(hardset)
	--[[
	Lock the state and prepare the context switch towards the one that will be defined in the next valid day.
	If the hardset parameter is set, change directly to the specified day regardless of current timeslot or day.

	:param int hardset: day index value to GOTO
	]]--
	state.lock()
	if not hardset then calendar.passTime() state.unlock() return end
	--We increment state.date.day later...
	state.date.day = hardset - 1
	calendar.passDay()
	state.unlock()
end

return calendar
