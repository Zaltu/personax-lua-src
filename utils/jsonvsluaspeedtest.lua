local json = require("json_reader")

local clock = os.clock
local start = clock()
for i=1,10000 do
    recieved = json.read({file="Aeon_link.json"})
end
jsontime = clock() - start

start = clock()
for i=1,10000 do
    recieved = require("data/Aeon_link")
end
luatime = clock() - start


print("JSON time: "..jsontime)
print("LUA time: "..luatime)
