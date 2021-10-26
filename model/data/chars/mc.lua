local mc = {}

mc.name="Minato"
mc.lastname="Arisatou"
mc.personadeck = {
    ["Mara"]=dofile(DATAPATH.."pers/Mara.lua"),
    ["Lamia"]=dofile(DATAPATH.."pers/Lamia.lua"),
    ["Jack Frost"]=dofile(DATAPATH.."pers/Jack Frost.lua")
}
mc.persona=mc.personadeck.Mara
mc.maxhp = 100
mc.hp = 100
mc.maxsp = 50
mc.sp = 50


return mc