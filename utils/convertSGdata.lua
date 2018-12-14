local lfs = require "lfs"
local conv = require "jsontolua"

local function listfiles(path)
	jsons = {}
	for file in lfs.dir(path) do
		if string.find(file, ".json") then
			print(file)
			jsons[#jsons+1] = file
		end
	end
	return jsons
end

local function convertlist(files, inpath, outpath)
	for index, file in pairs(files) do
		print("Converting "..file)
		conv.convertFile(inpath..file, outpath..string.gsub(file, ".json", ".lua"))
	end
end

local ins = require "inspect"

jsonfiles = listfiles([[/mnt/users/swaugh/Desktop/examples/personax-lua-src/json_data/]])
print(ins(jsonfiles))
convertlist(jsonfiles, [[/mnt/users/swaugh/Desktop/examples/personax-lua-src/json_data/]], [[/mnt/users/swaugh/Desktop/examples/personax-lua-src/model/data/]])
