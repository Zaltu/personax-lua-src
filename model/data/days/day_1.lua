local daystates = require('data/days/daystates')
local day = {}

day[1] = {state=daystates.morning, actions=nil, start=nil}
day[2] = {state=daystates.evening, actions=nil, start=nil}

return day