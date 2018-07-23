local json = require("json_reader")

local converter = {}

local jsonstr
local luastr

local processed_keystrs = {}

function read(filepath)
	jsonstr = json.read({file=filepath})
end

function write(filepath)
	local file = io.open(filepath, 'w')
	if not file then
		error("Can't write to "..data.path)
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
	for key, value in pairs(tab or jsonstr) do
		if type(value) == type({}) then
			convert(value, keystr.."["..ty(key)..key..ty(key).."]")
		elseif type(value) == type(function () end) then
			luastr = luastr.."--a function: "..key.."\n"
		elseif type(value) == type("string") then
			luastr = luastr..keystr.."["..ty(key)..key..ty(key).."] = [["..value.."]]\n"
		elseif type(value) == type(42) then
			luastr = luastr..keystr.."["..ty(key)..key..ty(key).."] = "..value.."\n"
		else
			luastr = luastr.."--unsupported type for:   "..value.."\n"
		end
	end
end

function converter.convert(file)
	read(file)
	fileprep()
	convert()
	filefinish()
	write(string.gsub(file, ".json", ".lua"))
end

return converter