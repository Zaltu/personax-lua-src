local converter = {}

local luastr

local processed_keystrs = {}


function write(filepath)
	local file = io.open(filepath, 'w')
	if not file then
		error("Can't write to "..filepath)
	end
	file:write(luastr)
	file:close()
end

local function fileprep()
	luastr = "local entity = {}\n"
end

local function filefinish()
	luastr = luastr.."return entity\n"
end

local function ty(key)
	if type(key) == type("string") then	return "\"" end
	return ""
end

local function convert(tab, keystr)
	if not keystr then keystr = "entity" end
	if not processed_keystrs[keystr] then
		luastr = luastr..keystr.." = {}\n"
		processed_keystrs[keystr] = true
	end
	for key, value in pairs(tab) do
		if type(value) == type({}) then
			convert(value, keystr.."["..ty(key)..key..ty(key).."]")
		elseif type(value) == type(function () end) then
			luastr = luastr.."--a function: "..key.."\n"
		elseif type(value) == type("string") then
			luastr = luastr..keystr.."["..ty(key)..key..ty(key).."] = [["..value.."]]\n"
		elseif type(value) == type(42) then
			luastr = luastr..keystr.."["..ty(key)..key..ty(key).."] = "..value.."\n"
		elseif type(value) == type(true) then
			if value then insert="true" else insert="false" end
			luastr = luastr..keystr.."["..ty(key)..key..ty(key).."] = "..insert.."\n"
		else
			luastr = luastr.."--unsupported type for:   "..value.."\n"
		end
	end
end

function converter.convert(table, outpath)
	fileprep()
	convert(table)
	filefinish()
	write(outpath)
	processed_keystrs = {}
end

return converter