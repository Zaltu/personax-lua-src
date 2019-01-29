--DUNGEON
local bar = {}

bar.name="Barbariccia"

--In dungeon 1, first half:
--1 = [{small small small}] (same weaknesses)
--2 = [{big}]
--3 = [{small small}] (different weaknesses)
--In dungeon 1, second half with levels ++:
--4 = [{small small small}] (same weaknesses)
--5 = [{big}]
--6 = [{small small}] (different weaknesses)
--etc...
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