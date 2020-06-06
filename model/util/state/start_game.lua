--Initial state setup when game blank save is loaded.
state.flags = {}
state.Version = "0.0.0.0.5"
state.date = {day=1, time=0}
state.slglobal = dofile(DATAPATH.."slglobal.lua")
state.mc = dofile(DATAPATH.."chars/mc.lua")
state.sister = dofile(DATAPATH.."chars/sister.lua")
state.availablechars = {[state.mc.name]=state.mc, [state.sister.name]=state.sister}
state.party = {[state.mc.name]=state.mc, [state.sister.name]=state.sister}
--Not actually necessary because Lua, but a reminder.
state.env = nil
state.context = nil
state.cut = nil

--state.changecontext("calendar")
state.changecontext('cutscene', 'velvet_demo')
