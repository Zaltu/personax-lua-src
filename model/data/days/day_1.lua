local daystates = require('data/days/daystates')
local day = {}

day.date = {"January", "1", "2020"}

day[1] = {state=daystates.morning, actions=nil, env="home", context="freeroam"}
day[2] = {state=daystates.evening, actions=nil, env="home", context="freeroam"}

return day