local daystates = require('data/days/daystates')
local day = {}

day.date = {"February", "11", "2020"}

day[1] = {state=daystates.daytime, actions=nil, env="home", context="freeroam"}
day[2] = {state=daystates.latenight, actions=nil, env="home", context="freeroam"}

return day