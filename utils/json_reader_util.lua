local json = require("json")

local lfs = require("lfs")--LuaFileSystem

function json.read(datapath)
	local json = require('json')
	local file = io.open(datapath)
	if not file then
		error("This file does not exist.")
	end
	local todecode = file:read "*a"
	file:close()
	local decoded = json.decode(todecode)
	if datapath.path then
		return (decoded[datapath.path])
	end
	return decoded
end

function json.write(data, uniqueDirPath)
	local json = require('json')
	print((uniqueDirPath or DEFAULT_RES_DIR)..data.path)
	local file = io.open((uniqueDirPath or DEFAULT_RES_DIR)..data.path, 'w')
	if not file then
		error("Can't write to "..data.path)
	end
	file:write(json.encode(data.data))
	file:close()
	return true
end

return json
