local sister = {}

sister.name="Onee"
sister.lastname="Chan"
sister.personadeck = {["Alice"]=dofile(DATAPATH.."pers/Alice.lua")}
sister.persona=sister.personadeck.Alice
sister.maxhp = 100
sister.hp = 100
sister.maxsp = 50
sister.sp = 50

return sister