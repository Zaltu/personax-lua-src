--DUNGEON
local bar = {}

bar.name="Barbariccia"
bar.enemies = {
    [1]={
        {
            {name="Cherub", hp=100, sp=100},
            {name="Dominion", hp=100, sp=100},
            {name="Seraph", hp=100, sp=100}
        }
    },
    [2]={
        {
            {name="Cherub", hp=100, sp=100},
            {name="Dominion", hp=100, sp=100},
            {name="Seraph", hp=100, sp=100}
        }
    },
    [3]={
        {
            {name="Cherub", hp=100, sp=100},
            {name="Dominion", hp=100, sp=100},
            {name="Seraph", hp=100, sp=100}
        }
    }
}
--Probably unnecessary
bar.levelcaps = {1, 3}

return bar