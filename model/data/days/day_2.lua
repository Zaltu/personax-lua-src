local daystates = require('data/days/daystates')
local day = {}

day[1] = {state=daystates.morning, actions=nil, env="home", context="freeroam"}
day[2] = {state=daystates.evening, actions=nil, env="home", context="freeroam"}

return day