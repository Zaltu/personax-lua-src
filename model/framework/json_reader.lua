local json = {}

function json.read(datapath)
	local json = require('cjson')
	local file = io.open(datapath.file)
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

function json.write(data)
	local json = require('cjson')
	local file = io.open(data.path, 'w')
	if not file then
		error("Can't write to "..data.path)
	end
	file:write(json.encode(data.data))
	file:close()
	return true
end

return json
	
--print(get({file='data.json', path='test'}))
--print(write({data={some='Some', random='Random', text='Text'}, path='afile.json'}))