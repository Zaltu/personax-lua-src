local sister = {}

sister.name="Onee"
sister.lastname="Chan"
sister.personadeck = {["Jack Frost"]=dofile(DATAPATH.."pers/Jack Frost.lua")}
sister.persona=sister.personadeck["Jack Frost"]
sister.maxhp = 100
sister.hp = 100
sister.maxsp = 50
sister.sp = 50

return sister