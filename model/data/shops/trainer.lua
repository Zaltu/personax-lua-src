local trainer = {}
trainer.exit = function () state.changecontext("freeroam") end
trainer.top				= {[0]="exit", "Buy Gear", "Sell Gear", "Talk", "Exit Shop"}
trainer["Buy Gear"]		= {[0]="top", "Headgear", "Armour", "Shoes"}
trainer["Sell Gear"]	= {[0]="top", "Unimplemented"}
trainer.Talk			= {[0]="top", "Inline CS"}
trainer["Exit Shop"]	= trainer.exit
return trainer