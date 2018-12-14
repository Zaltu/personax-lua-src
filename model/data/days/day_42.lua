local daystates = require('data/days/daystates')
local day = {}

day[1] = {state=daystates.daytime, actions=nil, start=nil}
day[2] = {state=daystates.latenight, actions=nil, start=nil}

return day