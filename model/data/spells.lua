local entity = {}
entity = {}
entity["Arms Master"] = {}
entity["Arms Master"]["numericaltype"] = [[Percentage]]
entity["Arms Master"]["element"] = [[Support]]
--a function: cost
entity["Arms Master"]["desc"] = [[Reduce HP cost of spells by half]]
--a function: numberofhits
entity["Arms Master"]["conditional"] = [[if attack.cost_type IS HP OR HP% THEN REDUCE]]
--a function: hitchance
entity["Arms Master"]["target"] = [[Self]]
entity["Arms Master"]["passive"] = true
--a function: statuschance
entity["Arms Master"]["name"] = [[Arms Master]]
--a function: status
--a function: targetattribute
entity["Arms Master"]["numericalvalue"] = 50
--a function: costtype
entity["Null Strike"] = {}
--a function: numericaltype
entity["Null Strike"]["element"] = [[Strike]]
--a function: cost
entity["Null Strike"]["desc"] = [[Raise resistance to strike damage to Null]]
--a function: numberofhits
entity["Null Strike"]["conditional"] = [[NULL]]
--a function: hitchance
entity["Null Strike"]["target"] = [[Self]]
entity["Null Strike"]["passive"] = true
--a function: statuschance
entity["Null Strike"]["name"] = [[Null Strike]]
--a function: status
entity["Null Strike"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Samsara"] = {}
entity["Samsara"]["numericaltype"] = [[Percentage]]
entity["Samsara"]["element"] = [[Light]]
entity["Samsara"]["cost"] = 35
entity["Samsara"]["desc"] = [[High chance to instant-kill all foes with light damage]]
entity["Samsara"]["numberofhits"] = 1
--a function: conditional
entity["Samsara"]["hitchance"] = 80
entity["Samsara"]["target"] = [[All Enemy]]
entity["Samsara"]["passive"] = false
--a function: statuschance
entity["Samsara"]["name"] = [[Samsara]]
entity["Samsara"]["status"] = [[None]]
entity["Samsara"]["targetattribute"] = [[HP]]
entity["Samsara"]["numericalvalue"] = 100
entity["Samsara"]["costtype"] = [[SP]]
entity["Auto-Matarukaja"] = {}
entity["Auto-Matarukaja"]["numericaltype"] = [[Percentage]]
entity["Auto-Matarukaja"]["element"] = [[Support]]
--a function: cost
entity["Auto-Matarukaja"]["desc"] = [[All allies enter battle with heightened attack power]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Auto-Matarukaja"]["target"] = [[All Ally]]
entity["Auto-Matarukaja"]["passive"] = true
--a function: statuschance
entity["Auto-Matarukaja"]["name"] = [[Auto-Matarukaja]]
--a function: status
entity["Auto-Matarukaja"]["targetattribute"] = [[Attack]]
entity["Auto-Matarukaja"]["numericalvalue"] = 50
--a function: costtype
entity["Vorpal Blade"] = {}
entity["Vorpal Blade"]["numericaltype"] = [[Absolute Value]]
entity["Vorpal Blade"]["element"] = [[Slash]]
entity["Vorpal Blade"]["cost"] = 21
entity["Vorpal Blade"]["desc"] = [[Huge slash damage to all foes]]
entity["Vorpal Blade"]["numberofhits"] = 1
--a function: conditional
entity["Vorpal Blade"]["hitchance"] = 99
entity["Vorpal Blade"]["target"] = [[All Enemy]]
entity["Vorpal Blade"]["passive"] = false
--a function: statuschance
entity["Vorpal Blade"]["name"] = [[Vorpal Blade]]
entity["Vorpal Blade"]["status"] = [[None]]
entity["Vorpal Blade"]["targetattribute"] = [[HP]]
entity["Vorpal Blade"]["numericalvalue"] = 500
entity["Vorpal Blade"]["costtype"] = [[HP (%)]]
entity["Wind Boost"] = {}
entity["Wind Boost"]["numericaltype"] = [[Percentage]]
entity["Wind Boost"]["element"] = [[Wind]]
--a function: cost
entity["Wind Boost"]["desc"] = [[Raises damage of all wind attacks]]
--a function: numberofhits
entity["Wind Boost"]["conditional"] = [[if attack.element IS wind]]
--a function: hitchance
entity["Wind Boost"]["target"] = [[Self]]
entity["Wind Boost"]["passive"] = true
--a function: statuschance
entity["Wind Boost"]["name"] = [[Wind Boost]]
--a function: status
entity["Wind Boost"]["targetattribute"] = [[Attack]]
entity["Wind Boost"]["numericalvalue"] = 25
--a function: costtype
entity["Assault Dive"] = {}
entity["Assault Dive"]["numericaltype"] = [[Absolute Value]]
entity["Assault Dive"]["element"] = [[Strike]]
entity["Assault Dive"]["cost"] = 9
entity["Assault Dive"]["desc"] = [[Small strike damage to one foe]]
entity["Assault Dive"]["numberofhits"] = 1
--a function: conditional
entity["Assault Dive"]["hitchance"] = 90
entity["Assault Dive"]["target"] = [[One Enemy]]
entity["Assault Dive"]["passive"] = false
--a function: statuschance
entity["Assault Dive"]["name"] = [[Assault Dive]]
entity["Assault Dive"]["status"] = [[None]]
entity["Assault Dive"]["targetattribute"] = [[HP]]
entity["Assault Dive"]["numericalvalue"] = 98
entity["Assault Dive"]["costtype"] = [[HP (%)]]
entity["Charm Boost"] = {}
--a function: numericaltype
entity["Charm Boost"]["element"] = [[Status]]
--a function: cost
entity["Charm Boost"]["desc"] = [[Raises chance to charm to the enemy]]
--a function: numberofhits
entity["Charm Boost"]["conditional"] = [[if attack.status IS charm THEN BOOST chance]]
--a function: hitchance
entity["Charm Boost"]["target"] = [[Self]]
entity["Charm Boost"]["passive"] = true
entity["Charm Boost"]["statuschance"] = 25
entity["Charm Boost"]["name"] = [[Charm Boost]]
entity["Charm Boost"]["status"] = [[Charm]]
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Evil Touch"] = {}
--a function: numericaltype
entity["Evil Touch"]["element"] = [[Status]]
entity["Evil Touch"]["cost"] = 5
entity["Evil Touch"]["desc"] = [[Chance to instill fear in one foe]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Evil Touch"]["target"] = [[One Enemy]]
entity["Evil Touch"]["passive"] = false
entity["Evil Touch"]["statuschance"] = 25
entity["Evil Touch"]["name"] = [[Evil Touch]]
entity["Evil Touch"]["status"] = [[Fear]]
--a function: targetattribute
--a function: numericalvalue
entity["Evil Touch"]["costtype"] = [[SP]]
entity["Divine Grace"] = {}
entity["Divine Grace"]["numericaltype"] = [[Percentage]]
entity["Divine Grace"]["element"] = [[Support]]
--a function: cost
entity["Divine Grace"]["desc"] = [[Greatly increase effectiveness of heal spells]]
--a function: numberofhits
entity["Divine Grace"]["conditional"] = [[if attack.element IS support and target IS IN friends and target_attribute IS HP]]
--a function: hitchance
entity["Divine Grace"]["target"] = [[Self]]
entity["Divine Grace"]["passive"] = true
--a function: statuschance
entity["Divine Grace"]["name"] = [[Divine Grace]]
--a function: status
entity["Divine Grace"]["targetattribute"] = [[Attack]]
entity["Divine Grace"]["numericalvalue"] = 100
--a function: costtype
entity["Mazionga"] = {}
entity["Mazionga"]["numericaltype"] = [[Absolute Value]]
entity["Mazionga"]["element"] = [[Elec]]
entity["Mazionga"]["cost"] = 16
entity["Mazionga"]["desc"] = [[Moderate electric damage to all foes]]
entity["Mazionga"]["numberofhits"] = 1
--a function: conditional
entity["Mazionga"]["hitchance"] = 90
entity["Mazionga"]["target"] = [[All Enemy]]
entity["Mazionga"]["passive"] = false
entity["Mazionga"]["statuschance"] = 10
entity["Mazionga"]["name"] = [[Mazionga]]
entity["Mazionga"]["status"] = [[Shock]]
entity["Mazionga"]["targetattribute"] = [[HP]]
entity["Mazionga"]["numericalvalue"] = 100
entity["Mazionga"]["costtype"] = [[SP]]
entity["Niflheim"] = {}
entity["Niflheim"]["numericaltype"] = [[Absolute Value]]
entity["Niflheim"]["element"] = [[Ice]]
entity["Niflheim"]["cost"] = 32
entity["Niflheim"]["desc"] = [[Huge ice damage to one foe]]
entity["Niflheim"]["numberofhits"] = 1
--a function: conditional
entity["Niflheim"]["hitchance"] = 99
entity["Niflheim"]["target"] = [[One Enemy]]
entity["Niflheim"]["passive"] = false
entity["Niflheim"]["statuschance"] = 100
entity["Niflheim"]["name"] = [[Niflheim]]
entity["Niflheim"]["status"] = [[Freeze]]
entity["Niflheim"]["targetattribute"] = [[HP]]
entity["Niflheim"]["numericalvalue"] = 650
entity["Niflheim"]["costtype"] = [[SP]]
entity["Repel Pierce"] = {}
--a function: numericaltype
entity["Repel Pierce"]["element"] = [[Pierce]]
--a function: cost
entity["Repel Pierce"]["desc"] = [[Raise resistance against pierce attacks to 'Repel']]
--a function: numberofhits
entity["Repel Pierce"]["conditional"] = [[REPEL]]
--a function: hitchance
entity["Repel Pierce"]["target"] = [[Self]]
entity["Repel Pierce"]["passive"] = true
--a function: statuschance
entity["Repel Pierce"]["name"] = [[Repel Pierce]]
--a function: status
entity["Repel Pierce"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Repel Light"] = {}
--a function: numericaltype
entity["Repel Light"]["element"] = [[Light]]
--a function: cost
entity["Repel Light"]["desc"] = [[Raise resistance against light attacks to 'Repel']]
--a function: numberofhits
entity["Repel Light"]["conditional"] = [[REPEL]]
--a function: hitchance
entity["Repel Light"]["target"] = [[Self]]
entity["Repel Light"]["passive"] = true
--a function: statuschance
entity["Repel Light"]["name"] = [[Repel Light]]
--a function: status
entity["Repel Light"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Regenerate 2"] = {}
entity["Regenerate 2"]["numericaltype"] = [[Percentage]]
entity["Regenerate 2"]["element"] = [[Support]]
--a function: cost
entity["Regenerate 2"]["desc"] = [[Heals a bit of HP after each turn]]
--a function: numberofhits
entity["Regenerate 2"]["conditional"] = [[if battle.turn.end]]
--a function: hitchance
entity["Regenerate 2"]["target"] = [[Self]]
entity["Regenerate 2"]["passive"] = true
--a function: statuschance
entity["Regenerate 2"]["name"] = [[Regenerate 2]]
--a function: status
entity["Regenerate 2"]["targetattribute"] = [[HP]]
entity["Regenerate 2"]["numericalvalue"] = 10
--a function: costtype
entity["Null Wind"] = {}
--a function: numericaltype
entity["Null Wind"]["element"] = [[Wind]]
--a function: cost
entity["Null Wind"]["desc"] = [[Raise resistance to wind damage to Null]]
--a function: numberofhits
entity["Null Wind"]["conditional"] = [[NULL]]
--a function: hitchance
entity["Null Wind"]["target"] = [[Self]]
entity["Null Wind"]["passive"] = true
--a function: statuschance
entity["Null Wind"]["name"] = [[Null Wind]]
--a function: status
entity["Null Wind"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Repel Elec"] = {}
--a function: numericaltype
entity["Repel Elec"]["element"] = [[Elec]]
--a function: cost
entity["Repel Elec"]["desc"] = [[Raise resistance against electric attacks to 'Repel']]
--a function: numberofhits
entity["Repel Elec"]["conditional"] = [[REPEL]]
--a function: hitchance
entity["Repel Elec"]["target"] = [[Self]]
entity["Repel Elec"]["passive"] = true
--a function: statuschance
entity["Repel Elec"]["name"] = [[Repel Elec]]
--a function: status
entity["Repel Elec"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Gigantic Fist"] = {}
entity["Gigantic Fist"]["numericaltype"] = [[Absolute Value]]
entity["Gigantic Fist"]["element"] = [[Strike]]
entity["Gigantic Fist"]["cost"] = 12
entity["Gigantic Fist"]["desc"] = [[Major strike damage to one foe]]
entity["Gigantic Fist"]["numberofhits"] = 1
--a function: conditional
entity["Gigantic Fist"]["hitchance"] = 85
entity["Gigantic Fist"]["target"] = [[One Enemy]]
entity["Gigantic Fist"]["passive"] = false
--a function: statuschance
entity["Gigantic Fist"]["name"] = [[Gigantic Fist]]
entity["Gigantic Fist"]["status"] = [[None]]
entity["Gigantic Fist"]["targetattribute"] = [[HP]]
entity["Gigantic Fist"]["numericalvalue"] = 311
entity["Gigantic Fist"]["costtype"] = [[HP (%)]]
entity["Sonic Punch"] = {}
entity["Sonic Punch"]["numericaltype"] = [[Absolute Value]]
entity["Sonic Punch"]["element"] = [[Strike]]
entity["Sonic Punch"]["cost"] = 9
entity["Sonic Punch"]["desc"] = [[Small strike damage to one foe]]
entity["Sonic Punch"]["numberofhits"] = 1
--a function: conditional
entity["Sonic Punch"]["hitchance"] = 95
entity["Sonic Punch"]["target"] = [[One Enemy]]
entity["Sonic Punch"]["passive"] = false
--a function: statuschance
entity["Sonic Punch"]["name"] = [[Sonic Punch]]
entity["Sonic Punch"]["status"] = [[None]]
entity["Sonic Punch"]["targetattribute"] = [[HP]]
entity["Sonic Punch"]["numericalvalue"] = 70
entity["Sonic Punch"]["costtype"] = [[HP (%)]]
entity["Wind Amp"] = {}
entity["Wind Amp"]["numericaltype"] = [[Percentage]]
entity["Wind Amp"]["element"] = [[Wind]]
--a function: cost
entity["Wind Amp"]["desc"] = [[Greatly raises damage of all wind attacks]]
--a function: numberofhits
entity["Wind Amp"]["conditional"] = [[if attack.element IS wind]]
--a function: hitchance
entity["Wind Amp"]["target"] = [[Self]]
entity["Wind Amp"]["passive"] = true
--a function: statuschance
entity["Wind Amp"]["name"] = [[Wind Amp]]
--a function: status
entity["Wind Amp"]["targetattribute"] = [[Attack]]
entity["Wind Amp"]["numericalvalue"] = 50
--a function: costtype
entity["Growth 3"] = {}
entity["Growth 3"]["numericaltype"] = [[Percentage]]
entity["Growth 3"]["element"] = [[Support]]
--a function: cost
entity["Growth 3"]["desc"] = [[Gain a moderate amount of extra experience at the end of each battle]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Growth 3"]["target"] = [[Self]]
entity["Growth 3"]["passive"] = true
--a function: statuschance
entity["Growth 3"]["name"] = [[Growth 3]]
--a function: status
entity["Growth 3"]["targetattribute"] = [[EXP]]
entity["Growth 3"]["numericalvalue"] = 100
--a function: costtype
entity["Sprint 02"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 02"]["desc"] = [[pass 2 on frameworks for AI, particles and interaction]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 02"]["passive"] = false
--a function: statuschance
entity["Sprint 02"]["name"] = [[Sprint 02]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Mabufu"] = {}
entity["Mabufu"]["numericaltype"] = [[Absolute Value]]
entity["Mabufu"]["element"] = [[Ice]]
entity["Mabufu"]["cost"] = 8
entity["Mabufu"]["desc"] = [[Small ice damage to all foes]]
entity["Mabufu"]["numberofhits"] = 1
--a function: conditional
entity["Mabufu"]["hitchance"] = 90
entity["Mabufu"]["target"] = [[All Enemy]]
entity["Mabufu"]["passive"] = false
entity["Mabufu"]["statuschance"] = 10
entity["Mabufu"]["name"] = [[Mabufu]]
entity["Mabufu"]["status"] = [[Freeze]]
entity["Mabufu"]["targetattribute"] = [[HP]]
entity["Mabufu"]["numericalvalue"] = 50
entity["Mabufu"]["costtype"] = [[SP]]
entity["Panic Boost"] = {}
--a function: numericaltype
entity["Panic Boost"]["element"] = [[Status]]
--a function: cost
entity["Panic Boost"]["desc"] = [[Raises chance to panic to the enemy]]
--a function: numberofhits
entity["Panic Boost"]["conditional"] = [[if attack.status IS panic THEN BOOST chance]]
--a function: hitchance
entity["Panic Boost"]["target"] = [[Self]]
entity["Panic Boost"]["passive"] = true
entity["Panic Boost"]["statuschance"] = 25
entity["Panic Boost"]["name"] = [[Panic Boost]]
entity["Panic Boost"]["status"] = [[Panic]]
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Marin Karin"] = {}
--a function: numericaltype
entity["Marin Karin"]["element"] = [[Status]]
entity["Marin Karin"]["cost"] = 5
entity["Marin Karin"]["desc"] = [[Chance to charm one foe]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Marin Karin"]["target"] = [[One Enemy]]
entity["Marin Karin"]["passive"] = false
entity["Marin Karin"]["statuschance"] = 24
entity["Marin Karin"]["name"] = [[Marin Karin]]
entity["Marin Karin"]["status"] = [[Charm]]
--a function: targetattribute
--a function: numericalvalue
entity["Marin Karin"]["costtype"] = [[SP]]
entity["Endure Dark"] = {}
--a function: numericaltype
entity["Endure Dark"]["element"] = [[Dark]]
--a function: cost
entity["Endure Dark"]["desc"] = [[Survive dark attacks with 1 HP]]
--a function: numberofhits
entity["Endure Dark"]["conditional"] = [[ENDURE]]
--a function: hitchance
entity["Endure Dark"]["target"] = [[Self]]
entity["Endure Dark"]["passive"] = true
--a function: statuschance
entity["Endure Dark"]["name"] = [[Endure Dark]]
--a function: status
entity["Endure Dark"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Media"] = {}
entity["Media"]["numericaltype"] = [[Absolute Value]]
entity["Media"]["element"] = [[Support]]
entity["Media"]["cost"] = 8
entity["Media"]["desc"] = [[Small heal for all allies]]
entity["Media"]["numberofhits"] = 1
--a function: conditional
entity["Media"]["hitchance"] = 100
entity["Media"]["target"] = [[All Ally]]
entity["Media"]["passive"] = false
--a function: statuschance
entity["Media"]["name"] = [[Media]]
entity["Media"]["status"] = [[None]]
entity["Media"]["targetattribute"] = [[HP]]
entity["Media"]["numericalvalue"] = 60
entity["Media"]["costtype"] = [[SP]]
entity["Heavy Master"] = {}
entity["Heavy Master"]["numericaltype"] = [[Percentage]]
entity["Heavy Master"]["element"] = [[Support]]
--a function: cost
entity["Heavy Master"]["desc"] = [[Raises damage done with heavy weapons]]
--a function: numberofhits
entity["Heavy Master"]["conditional"] = [[if self.weapon.type IS MACE]]
--a function: hitchance
entity["Heavy Master"]["target"] = [[Self]]
entity["Heavy Master"]["passive"] = true
--a function: statuschance
entity["Heavy Master"]["name"] = [[Heavy Master]]
--a function: status
entity["Heavy Master"]["targetattribute"] = [[Attack]]
entity["Heavy Master"]["numericalvalue"] = 100
--a function: costtype
entity["Hamaon"] = {}
entity["Hamaon"]["numericaltype"] = [[Percentage]]
entity["Hamaon"]["element"] = [[Light]]
entity["Hamaon"]["cost"] = 12
entity["Hamaon"]["desc"] = [[Moderate chance to instant-kill one foe with light damage.]]
entity["Hamaon"]["numberofhits"] = 1
--a function: conditional
entity["Hamaon"]["hitchance"] = 50
entity["Hamaon"]["target"] = [[One Enemy]]
entity["Hamaon"]["passive"] = false
--a function: statuschance
entity["Hamaon"]["name"] = [[Hamaon]]
entity["Hamaon"]["status"] = [[None]]
entity["Hamaon"]["targetattribute"] = [[HP]]
entity["Hamaon"]["numericalvalue"] = 100
entity["Hamaon"]["costtype"] = [[SP]]
entity["Spear Master"] = {}
entity["Spear Master"]["numericaltype"] = [[Percentage]]
entity["Spear Master"]["element"] = [[Support]]
--a function: cost
entity["Spear Master"]["desc"] = [[Raises damage done with spears]]
--a function: numberofhits
entity["Spear Master"]["conditional"] = [[if self.weapon.type IS SPEAR]]
--a function: hitchance
entity["Spear Master"]["target"] = [[Self]]
entity["Spear Master"]["passive"] = true
--a function: statuschance
entity["Spear Master"]["name"] = [[Spear Master]]
--a function: status
entity["Spear Master"]["targetattribute"] = [[Attack]]
entity["Spear Master"]["numericalvalue"] = 100
--a function: costtype
entity["Auto-Masukukaja"] = {}
entity["Auto-Masukukaja"]["numericaltype"] = [[Percentage]]
entity["Auto-Masukukaja"]["element"] = [[Support]]
--a function: cost
entity["Auto-Masukukaja"]["desc"] = [[All allies enter battle with heightened Hit/Evasion]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Auto-Masukukaja"]["target"] = [[All Ally]]
entity["Auto-Masukukaja"]["passive"] = true
--a function: statuschance
entity["Auto-Masukukaja"]["name"] = [[Auto-Masukukaja]]
--a function: status
entity["Auto-Masukukaja"]["targetattribute"] = [[Agility]]
entity["Auto-Masukukaja"]["numericalvalue"] = 50
--a function: costtype
entity["Dodge Elec"] = {}
--a function: numericaltype
entity["Dodge Elec"]["element"] = [[Elec]]
--a function: cost
entity["Dodge Elec"]["desc"] = [[Improves evasion against electric attacks]]
--a function: numberofhits
entity["Dodge Elec"]["conditional"] = [[DODGE]]
--a function: hitchance
entity["Dodge Elec"]["target"] = [[Self]]
entity["Dodge Elec"]["passive"] = true
--a function: statuschance
entity["Dodge Elec"]["name"] = [[Dodge Elec]]
--a function: status
entity["Dodge Elec"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["High Counter"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["High Counter"]["desc"] = [[High chance to counter physical attacks]]
--a function: numberofhits
entity["High Counter"]["conditional"] = [[if attack.element IN physical]]
entity["High Counter"]["hitchance"] = 50
entity["High Counter"]["target"] = [[Self]]
entity["High Counter"]["passive"] = true
--a function: statuschance
entity["High Counter"]["name"] = [[High Counter]]
--a function: status
entity["High Counter"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["God's Hand"] = {}
entity["God's Hand"]["numericaltype"] = [[Absolute Value]]
entity["God's Hand"]["element"] = [[Strike]]
entity["God's Hand"]["cost"] = 14
entity["God's Hand"]["desc"] = [[Huge strike damage to one foe]]
entity["God's Hand"]["numberofhits"] = 1
--a function: conditional
entity["God's Hand"]["hitchance"] = 90
entity["God's Hand"]["target"] = [[One Enemy]]
entity["God's Hand"]["passive"] = false
--a function: statuschance
entity["God's Hand"]["name"] = [[God's Hand]]
entity["God's Hand"]["status"] = [[None]]
entity["God's Hand"]["targetattribute"] = [[HP]]
entity["God's Hand"]["numericalvalue"] = 600
entity["God's Hand"]["costtype"] = [[HP (%)]]
entity["Matarunda"] = {}
entity["Matarunda"]["numericaltype"] = [[Percentage]]
entity["Matarunda"]["element"] = [[Support]]
entity["Matarunda"]["cost"] = 12
entity["Matarunda"]["desc"] = [[Lowers attack power of all enemies]]
entity["Matarunda"]["numberofhits"] = 1
--a function: conditional
entity["Matarunda"]["hitchance"] = 100
entity["Matarunda"]["target"] = [[All Enemy]]
entity["Matarunda"]["passive"] = false
--a function: statuschance
entity["Matarunda"]["name"] = [[Matarunda]]
entity["Matarunda"]["status"] = [[None]]
entity["Matarunda"]["targetattribute"] = [[Attack]]
entity["Matarunda"]["numericalvalue"] = -50
entity["Matarunda"]["costtype"] = [[SP]]
entity["Poison Arrow"] = {}
entity["Poison Arrow"]["numericaltype"] = [[Absolute Value]]
entity["Poison Arrow"]["element"] = [[Pierce]]
entity["Poison Arrow"]["cost"] = 13
entity["Poison Arrow"]["desc"] = [[Major pierce damage to one foe with chance to poison]]
entity["Poison Arrow"]["numberofhits"] = 1
--a function: conditional
entity["Poison Arrow"]["hitchance"] = 95
entity["Poison Arrow"]["target"] = [[One Enemy]]
entity["Poison Arrow"]["passive"] = false
entity["Poison Arrow"]["statuschance"] = 10
entity["Poison Arrow"]["name"] = [[Poison Arrow]]
entity["Poison Arrow"]["status"] = [[Poison]]
entity["Poison Arrow"]["targetattribute"] = [[HP]]
entity["Poison Arrow"]["numericalvalue"] = 300
entity["Poison Arrow"]["costtype"] = [[HP (%)]]
entity["Null Ice"] = {}
--a function: numericaltype
entity["Null Ice"]["element"] = [[Ice]]
--a function: cost
entity["Null Ice"]["desc"] = [[Raise resistance to ice damage to Null]]
--a function: numberofhits
entity["Null Ice"]["conditional"] = [[NULL]]
--a function: hitchance
entity["Null Ice"]["target"] = [[Self]]
entity["Null Ice"]["passive"] = true
--a function: statuschance
entity["Null Ice"]["name"] = [[Null Ice]]
--a function: status
entity["Null Ice"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Evade Elec"] = {}
--a function: numericaltype
entity["Evade Elec"]["element"] = [[Elec]]
--a function: cost
entity["Evade Elec"]["desc"] = [[Large evasion boost against electric attacks]]
--a function: numberofhits
entity["Evade Elec"]["conditional"] = [[EVADE]]
--a function: hitchance
entity["Evade Elec"]["target"] = [[Self]]
entity["Evade Elec"]["passive"] = true
--a function: statuschance
entity["Evade Elec"]["name"] = [[Evade Elec]]
--a function: status
entity["Evade Elec"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Provoke"] = {}
--a function: numericaltype
entity["Provoke"]["element"] = [[Status]]
entity["Provoke"]["cost"] = 5
entity["Provoke"]["desc"] = [[Chance to instill rage in one foe]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Provoke"]["target"] = [[One Enemy]]
entity["Provoke"]["passive"] = false
entity["Provoke"]["statuschance"] = 25
entity["Provoke"]["name"] = [[Provoke]]
entity["Provoke"]["status"] = [[Rage]]
--a function: targetattribute
--a function: numericalvalue
entity["Provoke"]["costtype"] = [[SP]]
entity["Heat Wave"] = {}
entity["Heat Wave"]["numericaltype"] = [[Absolute Value]]
entity["Heat Wave"]["element"] = [[Strike]]
entity["Heat Wave"]["cost"] = 16
entity["Heat Wave"]["desc"] = [[Moderate strike damage to all foes]]
entity["Heat Wave"]["numberofhits"] = 1
--a function: conditional
entity["Heat Wave"]["hitchance"] = 90
entity["Heat Wave"]["target"] = [[All Enemy]]
entity["Heat Wave"]["passive"] = false
--a function: statuschance
entity["Heat Wave"]["name"] = [[Heat Wave]]
entity["Heat Wave"]["status"] = [[None]]
entity["Heat Wave"]["targetattribute"] = [[HP]]
entity["Heat Wave"]["numericalvalue"] = 280
entity["Heat Wave"]["costtype"] = [[HP (%)]]
entity["Rakukaja"] = {}
entity["Rakukaja"]["numericaltype"] = [[Percentage]]
entity["Rakukaja"]["element"] = [[Support]]
entity["Rakukaja"]["cost"] = 6
entity["Rakukaja"]["desc"] = [[Raises defence of one ally]]
entity["Rakukaja"]["numberofhits"] = 1
--a function: conditional
entity["Rakukaja"]["hitchance"] = 100
entity["Rakukaja"]["target"] = [[One Ally]]
entity["Rakukaja"]["passive"] = false
--a function: statuschance
entity["Rakukaja"]["name"] = [[Rakukaja]]
entity["Rakukaja"]["status"] = [[None]]
entity["Rakukaja"]["targetattribute"] = [[Defence]]
entity["Rakukaja"]["numericalvalue"] = 50
entity["Rakukaja"]["costtype"] = [[SP]]
entity["Evade Ice"] = {}
--a function: numericaltype
entity["Evade Ice"]["element"] = [[Ice]]
--a function: cost
entity["Evade Ice"]["desc"] = [[Large evasion boost against ice attacks]]
--a function: numberofhits
entity["Evade Ice"]["conditional"] = [[EVADE]]
--a function: hitchance
entity["Evade Ice"]["target"] = [[Self]]
entity["Evade Ice"]["passive"] = true
--a function: statuschance
entity["Evade Ice"]["name"] = [[Evade Ice]]
--a function: status
entity["Evade Ice"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Heaven's Blade"] = {}
entity["Heaven's Blade"]["numericaltype"] = [[Absolute Value]]
entity["Heaven's Blade"]["element"] = [[Slash]]
entity["Heaven's Blade"]["cost"] = 13
entity["Heaven's Blade"]["desc"] = [[Huge slash damage to one foe]]
entity["Heaven's Blade"]["numberofhits"] = 1
--a function: conditional
entity["Heaven's Blade"]["hitchance"] = 95
entity["Heaven's Blade"]["target"] = [[One Enemy]]
entity["Heaven's Blade"]["passive"] = false
--a function: statuschance
entity["Heaven's Blade"]["name"] = [[Heaven's Blade]]
entity["Heaven's Blade"]["status"] = [[None]]
entity["Heaven's Blade"]["targetattribute"] = [[HP]]
entity["Heaven's Blade"]["numericalvalue"] = 500
entity["Heaven's Blade"]["costtype"] = [[HP (%)]]
entity["Fire Break"] = {}
--a function: numericaltype
entity["Fire Break"]["element"] = [[Fire]]
entity["Fire Break"]["cost"] = 40
entity["Fire Break"]["desc"] = [[Reduces fire resistance of one foe to 'Normal']]
entity["Fire Break"]["numberofhits"] = 1
entity["Fire Break"]["conditional"] = [[NORMAL]]
entity["Fire Break"]["hitchance"] = 100
entity["Fire Break"]["target"] = [[One Enemy]]
entity["Fire Break"]["passive"] = false
--a function: statuschance
entity["Fire Break"]["name"] = [[Fire Break]]
entity["Fire Break"]["status"] = [[None]]
entity["Fire Break"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
entity["Fire Break"]["costtype"] = [[SP]]
entity["Ailment Boost"] = {}
--a function: numericaltype
entity["Ailment Boost"]["element"] = [[Status]]
--a function: cost
entity["Ailment Boost"]["desc"] = [[Raises chance to inflict statuses on the enemy]]
--a function: numberofhits
entity["Ailment Boost"]["conditional"] = [[if attack.status IS NOT null THEN BOOST chance]]
--a function: hitchance
entity["Ailment Boost"]["target"] = [[Self]]
entity["Ailment Boost"]["passive"] = true
entity["Ailment Boost"]["statuschance"] = 25
entity["Ailment Boost"]["name"] = [[Ailment Boost]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Sprint 18"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 18"]["desc"] = [[More custom features for spectator mode and cheat codes, fix more P1 bugs and pusho the testing framework]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 18"]["passive"] = false
--a function: statuschance
entity["Sprint 18"]["name"] = [[Sprint 18]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Evade Wind"] = {}
--a function: numericaltype
entity["Evade Wind"]["element"] = [[Wind]]
--a function: cost
entity["Evade Wind"]["desc"] = [[Large evasion boost against wind attacks]]
--a function: numberofhits
entity["Evade Wind"]["conditional"] = [[EVADE]]
--a function: hitchance
entity["Evade Wind"]["target"] = [[Self]]
entity["Evade Wind"]["passive"] = true
--a function: statuschance
entity["Evade Wind"]["name"] = [[Evade Wind]]
--a function: status
entity["Evade Wind"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Repel Ice"] = {}
--a function: numericaltype
entity["Repel Ice"]["element"] = [[Ice]]
--a function: cost
entity["Repel Ice"]["desc"] = [[Raise resistance against ice attacks to 'Repel']]
--a function: numberofhits
entity["Repel Ice"]["conditional"] = [[REPEL]]
--a function: hitchance
entity["Repel Ice"]["target"] = [[Self]]
entity["Repel Ice"]["passive"] = true
--a function: statuschance
entity["Repel Ice"]["name"] = [[Repel Ice]]
--a function: status
entity["Repel Ice"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Sprint 10"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 10"]["desc"] = [[prepare basic frameworks and outlines]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 10"]["passive"] = false
--a function: statuschance
entity["Sprint 10"]["name"] = [[Sprint 10]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Masukunda"] = {}
entity["Masukunda"]["numericaltype"] = [[Percentage]]
entity["Masukunda"]["element"] = [[Support]]
entity["Masukunda"]["cost"] = 12
entity["Masukunda"]["desc"] = [[Lowers Hit/Evasion of all foes]]
entity["Masukunda"]["numberofhits"] = 1
--a function: conditional
entity["Masukunda"]["hitchance"] = 100
entity["Masukunda"]["target"] = [[All Enemy]]
entity["Masukunda"]["passive"] = false
--a function: statuschance
entity["Masukunda"]["name"] = [[Masukunda]]
entity["Masukunda"]["status"] = [[None]]
entity["Masukunda"]["targetattribute"] = [[Agility]]
entity["Masukunda"]["numericalvalue"] = -50
entity["Masukunda"]["costtype"] = [[SP]]
entity["Drain Elec"] = {}
--a function: numericaltype
entity["Drain Elec"]["element"] = [[Elec]]
--a function: cost
entity["Drain Elec"]["desc"] = [[Raise resistance against electric attacks to 'Drain']]
--a function: numberofhits
entity["Drain Elec"]["conditional"] = [[DRAIN]]
--a function: hitchance
entity["Drain Elec"]["target"] = [[Self]]
entity["Drain Elec"]["passive"] = true
--a function: statuschance
entity["Drain Elec"]["name"] = [[Drain Elec]]
--a function: status
entity["Drain Elec"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Maragidyne"] = {}
entity["Maragidyne"]["numericaltype"] = [[Absolute Value]]
entity["Maragidyne"]["element"] = [[Fire]]
entity["Maragidyne"]["cost"] = 24
entity["Maragidyne"]["desc"] = [[Major fire damage to all foes]]
entity["Maragidyne"]["numberofhits"] = 1
--a function: conditional
entity["Maragidyne"]["hitchance"] = 90
entity["Maragidyne"]["target"] = [[All Enemy]]
entity["Maragidyne"]["passive"] = false
--a function: statuschance
entity["Maragidyne"]["name"] = [[Maragidyne]]
entity["Maragidyne"]["status"] = [[None]]
entity["Maragidyne"]["targetattribute"] = [[HP]]
entity["Maragidyne"]["numericalvalue"] = 320
entity["Maragidyne"]["costtype"] = [[SP]]
entity["Fast Retreat"] = {}
--a function: numericaltype
entity["Fast Retreat"]["element"] = [[Support]]
entity["Fast Retreat"]["cost"] = 25
entity["Fast Retreat"]["desc"] = [[Chance to escape the battle unscathed]]
entity["Fast Retreat"]["numberofhits"] = 1
entity["Fast Retreat"]["conditional"] = [[if attack.hit IS TRUE THEN ESCAPE]]
entity["Fast Retreat"]["hitchance"] = 70
entity["Fast Retreat"]["target"] = [[All]]
entity["Fast Retreat"]["passive"] = false
--a function: statuschance
entity["Fast Retreat"]["name"] = [[Fast Retreat]]
entity["Fast Retreat"]["status"] = [[None]]
--a function: targetattribute
--a function: numericalvalue
entity["Fast Retreat"]["costtype"] = [[SP]]
entity["Spell Master"] = {}
entity["Spell Master"]["numericaltype"] = [[Percentage]]
entity["Spell Master"]["element"] = [[Support]]
--a function: cost
entity["Spell Master"]["desc"] = [[Reduce SP cost of spells by half]]
--a function: numberofhits
entity["Spell Master"]["conditional"] = [[if attack.cost_type IS SP OR SP% THEN REDUCE]]
--a function: hitchance
entity["Spell Master"]["target"] = [[Self]]
entity["Spell Master"]["passive"] = true
--a function: statuschance
entity["Spell Master"]["name"] = [[Spell Master]]
--a function: status
--a function: targetattribute
entity["Spell Master"]["numericalvalue"] = 50
--a function: costtype
entity["Sprint 13"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 13"]["desc"] = [[pass 3 on AI, more particles and enhancements to dynamics and interaction]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 13"]["passive"] = false
--a function: statuschance
entity["Sprint 13"]["name"] = [[Sprint 13]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Invigorate 1"] = {}
entity["Invigorate 1"]["numericaltype"] = [[Percentage]]
entity["Invigorate 1"]["element"] = [[Support]]
--a function: cost
entity["Invigorate 1"]["desc"] = [[Heals a small amount of SP after each turn]]
--a function: numberofhits
entity["Invigorate 1"]["conditional"] = [[if battle.turn.end]]
--a function: hitchance
entity["Invigorate 1"]["target"] = [[Self]]
entity["Invigorate 1"]["passive"] = true
--a function: statuschance
entity["Invigorate 1"]["name"] = [[Invigorate 1]]
--a function: status
entity["Invigorate 1"]["targetattribute"] = [[SP]]
entity["Invigorate 1"]["numericalvalue"] = 5
--a function: costtype
entity["Repel Wind"] = {}
--a function: numericaltype
entity["Repel Wind"]["element"] = [[Wind]]
--a function: cost
entity["Repel Wind"]["desc"] = [[Raise resistance against wind attacks to 'Repel']]
--a function: numberofhits
entity["Repel Wind"]["conditional"] = [[REPEL]]
--a function: hitchance
entity["Repel Wind"]["target"] = [[Self]]
entity["Repel Wind"]["passive"] = true
--a function: statuschance
entity["Repel Wind"]["name"] = [[Repel Wind]]
--a function: status
entity["Repel Wind"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Magarudyne"] = {}
entity["Magarudyne"]["numericaltype"] = [[Absolute Value]]
entity["Magarudyne"]["element"] = [[Wind]]
entity["Magarudyne"]["cost"] = 24
entity["Magarudyne"]["desc"] = [[Major wind damage to all foes]]
entity["Magarudyne"]["numberofhits"] = 1
--a function: conditional
entity["Magarudyne"]["hitchance"] = 90
entity["Magarudyne"]["target"] = [[All Enemy]]
entity["Magarudyne"]["passive"] = false
--a function: statuschance
entity["Magarudyne"]["name"] = [[Magarudyne]]
entity["Magarudyne"]["status"] = [[None]]
entity["Magarudyne"]["targetattribute"] = [[HP]]
entity["Magarudyne"]["numericalvalue"] = 320
entity["Magarudyne"]["costtype"] = [[SP]]
entity["Sprint 14"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 14"]["desc"] = [[AI extensions, fusion API wrappers, fixes to particles]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 14"]["passive"] = false
--a function: statuschance
entity["Sprint 14"]["name"] = [[Sprint 14]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Drain Slash"] = {}
--a function: numericaltype
entity["Drain Slash"]["element"] = [[Slash]]
--a function: cost
entity["Drain Slash"]["desc"] = [[Raise resistance against slash attacks to 'Drain']]
--a function: numberofhits
entity["Drain Slash"]["conditional"] = [[DRAIN]]
--a function: hitchance
entity["Drain Slash"]["target"] = [[Self]]
entity["Drain Slash"]["passive"] = true
--a function: statuschance
entity["Drain Slash"]["name"] = [[Drain Slash]]
--a function: status
entity["Drain Slash"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Null Poison"] = {}
--a function: numericaltype
entity["Null Poison"]["element"] = [[Status]]
--a function: cost
entity["Null Poison"]["desc"] = [[Prevents the status 'Poison']]
--a function: numberofhits
entity["Null Poison"]["conditional"] = [[STATUS]]
--a function: hitchance
entity["Null Poison"]["target"] = [[Self]]
entity["Null Poison"]["passive"] = true
--a function: statuschance
entity["Null Poison"]["name"] = [[Null Poison]]
entity["Null Poison"]["status"] = [[Poison]]
entity["Null Poison"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Vile Assault"] = {}
entity["Vile Assault"]["numericaltype"] = [[Absolute Value]]
entity["Vile Assault"]["element"] = [[Pierce]]
entity["Vile Assault"]["cost"] = 12
entity["Vile Assault"]["desc"] = [[Major pierce damage to one foe]]
entity["Vile Assault"]["numberofhits"] = 1
--a function: conditional
entity["Vile Assault"]["hitchance"] = 99
entity["Vile Assault"]["target"] = [[One Enemy]]
entity["Vile Assault"]["passive"] = false
--a function: statuschance
entity["Vile Assault"]["name"] = [[Vile Assault]]
entity["Vile Assault"]["status"] = [[None]]
entity["Vile Assault"]["targetattribute"] = [[HP]]
entity["Vile Assault"]["numericalvalue"] = 311
entity["Vile Assault"]["costtype"] = [[HP (%)]]
entity["Masukukaja"] = {}
entity["Masukukaja"]["numericaltype"] = [[Percentage]]
entity["Masukukaja"]["element"] = [[Support]]
entity["Masukukaja"]["cost"] = 12
entity["Masukukaja"]["desc"] = [[Raises Hit/Evasion of all allies]]
entity["Masukukaja"]["numberofhits"] = 1
--a function: conditional
entity["Masukukaja"]["hitchance"] = 100
entity["Masukukaja"]["target"] = [[All Ally]]
entity["Masukukaja"]["passive"] = false
--a function: statuschance
entity["Masukukaja"]["name"] = [[Masukukaja]]
entity["Masukukaja"]["status"] = [[None]]
entity["Masukukaja"]["targetattribute"] = [[Agility]]
entity["Masukukaja"]["numericalvalue"] = 50
entity["Masukukaja"]["costtype"] = [[SP]]
entity["Enradi"] = {}
--a function: numericaltype
entity["Enradi"]["element"] = [[Support]]
entity["Enradi"]["cost"] = 5
entity["Enradi"]["desc"] = [[Curse rage on one ally]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Enradi"]["target"] = [[One Ally]]
entity["Enradi"]["passive"] = false
entity["Enradi"]["statuschance"] = 100
entity["Enradi"]["name"] = [[Enradi]]
entity["Enradi"]["status"] = [[Rage]]
--a function: targetattribute
--a function: numericalvalue
entity["Enradi"]["costtype"] = [[SP]]
entity["Victory Cry"] = {}
entity["Victory Cry"]["numericaltype"] = [[Percentage]]
entity["Victory Cry"]["element"] = [[Support]]
--a function: cost
entity["Victory Cry"]["desc"] = [[Fully heals HP and SP after a battle]]
--a function: numberofhits
entity["Victory Cry"]["conditional"] = [[if battle.end]]
--a function: hitchance
entity["Victory Cry"]["target"] = [[Self]]
entity["Victory Cry"]["passive"] = true
--a function: statuschance
entity["Victory Cry"]["name"] = [[Victory Cry]]
--a function: status
entity["Victory Cry"]["targetattribute"] = [[HP/SP]]
entity["Victory Cry"]["numericalvalue"] = 100
--a function: costtype
entity["Auto-Tarukaja"] = {}
entity["Auto-Tarukaja"]["numericaltype"] = [[Percentage]]
entity["Auto-Tarukaja"]["element"] = [[Support]]
--a function: cost
entity["Auto-Tarukaja"]["desc"] = [[Start the battle with heightened attack power]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Auto-Tarukaja"]["target"] = [[Self]]
entity["Auto-Tarukaja"]["passive"] = true
--a function: statuschance
entity["Auto-Tarukaja"]["name"] = [[Auto-Tarukaja]]
--a function: status
entity["Auto-Tarukaja"]["targetattribute"] = [[Attack]]
entity["Auto-Tarukaja"]["numericalvalue"] = 50
--a function: costtype
entity["Dodge Fire"] = {}
--a function: numericaltype
entity["Dodge Fire"]["element"] = [[Fire]]
--a function: cost
entity["Dodge Fire"]["desc"] = [[Improves evasion against fire attacks]]
--a function: numberofhits
entity["Dodge Fire"]["conditional"] = [[DODGE]]
--a function: hitchance
entity["Dodge Fire"]["target"] = [[Self]]
entity["Dodge Fire"]["passive"] = true
--a function: statuschance
entity["Dodge Fire"]["name"] = [[Dodge Fire]]
--a function: status
entity["Dodge Fire"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Ice Break"] = {}
--a function: numericaltype
entity["Ice Break"]["element"] = [[Ice]]
entity["Ice Break"]["cost"] = 40
entity["Ice Break"]["desc"] = [[Reduces ice resistance of one foe to 'Normal']]
entity["Ice Break"]["numberofhits"] = 1
entity["Ice Break"]["conditional"] = [[NORMAL]]
entity["Ice Break"]["hitchance"] = 100
entity["Ice Break"]["target"] = [[One Enemy]]
entity["Ice Break"]["passive"] = false
--a function: statuschance
entity["Ice Break"]["name"] = [[Ice Break]]
entity["Ice Break"]["status"] = [[None]]
entity["Ice Break"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
entity["Ice Break"]["costtype"] = [[SP]]
entity["Sprint 16"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 16"]["desc"] = [[Push on AI, some mods and fix some P1 bugs from testing]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 16"]["passive"] = false
--a function: statuschance
entity["Sprint 16"]["name"] = [[Sprint 16]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Virus Breath"] = {}
entity["Virus Breath"]["numericaltype"] = [[Absolute Value]]
entity["Virus Breath"]["element"] = [[Almighty]]
entity["Virus Breath"]["cost"] = 40
entity["Virus Breath"]["desc"] = [[Almighty damage to all foes with chance to poison]]
entity["Virus Breath"]["numberofhits"] = 1
--a function: conditional
entity["Virus Breath"]["hitchance"] = 80
entity["Virus Breath"]["target"] = [[All Enemy]]
entity["Virus Breath"]["passive"] = false
entity["Virus Breath"]["statuschance"] = 25
entity["Virus Breath"]["name"] = [[Virus Breath]]
entity["Virus Breath"]["status"] = [[Poison]]
entity["Virus Breath"]["targetattribute"] = [[HP]]
entity["Virus Breath"]["numericalvalue"] = 230
entity["Virus Breath"]["costtype"] = [[SP]]
entity["Sprint 08"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 08"]["desc"] = [[Develop the weapons mods and the hyper real particle behaviour algorithms]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 08"]["passive"] = false
--a function: statuschance
entity["Sprint 08"]["name"] = [[Sprint 08]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Magaru"] = {}
entity["Magaru"]["numericaltype"] = [[Absolute Value]]
entity["Magaru"]["element"] = [[Wind]]
entity["Magaru"]["cost"] = 6
entity["Magaru"]["desc"] = [[Small wind damage to all foes]]
entity["Magaru"]["numberofhits"] = 1
--a function: conditional
entity["Magaru"]["hitchance"] = 90
entity["Magaru"]["target"] = [[All Enemy]]
entity["Magaru"]["passive"] = false
--a function: statuschance
entity["Magaru"]["name"] = [[Magaru]]
entity["Magaru"]["status"] = [[None]]
entity["Magaru"]["targetattribute"] = [[HP]]
entity["Magaru"]["numericalvalue"] = 50
entity["Magaru"]["costtype"] = [[SP]]
entity["Repel Fire"] = {}
--a function: numericaltype
entity["Repel Fire"]["element"] = [[Fire]]
--a function: cost
entity["Repel Fire"]["desc"] = [[Raise resistance against fire attacks to 'Repel']]
--a function: numberofhits
entity["Repel Fire"]["conditional"] = [[REPEL]]
--a function: hitchance
entity["Repel Fire"]["target"] = [[Self]]
entity["Repel Fire"]["passive"] = true
--a function: statuschance
entity["Repel Fire"]["name"] = [[Repel Fire]]
--a function: status
entity["Repel Fire"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Bufu"] = {}
entity["Bufu"]["numericaltype"] = [[Absolute Value]]
entity["Bufu"]["element"] = [[Ice]]
entity["Bufu"]["cost"] = 4
entity["Bufu"]["desc"] = [[Small ice damage to one foe]]
entity["Bufu"]["numberofhits"] = 1
--a function: conditional
entity["Bufu"]["hitchance"] = 95
entity["Bufu"]["target"] = [[One Enemy]]
entity["Bufu"]["passive"] = false
entity["Bufu"]["statuschance"] = 10
entity["Bufu"]["name"] = [[Bufu]]
entity["Bufu"]["status"] = [[Freeze]]
entity["Bufu"]["targetattribute"] = [[HP]]
entity["Bufu"]["numericalvalue"] = 50
entity["Bufu"]["costtype"] = [[SP]]
entity["Rakunda"] = {}
entity["Rakunda"]["numericaltype"] = [[Percentage]]
entity["Rakunda"]["element"] = [[Support]]
entity["Rakunda"]["cost"] = 6
entity["Rakunda"]["desc"] = [[Lowers defence of one foe]]
entity["Rakunda"]["numberofhits"] = 1
--a function: conditional
entity["Rakunda"]["hitchance"] = 100
entity["Rakunda"]["target"] = [[One Enemy]]
entity["Rakunda"]["passive"] = false
--a function: statuschance
entity["Rakunda"]["name"] = [[Rakunda]]
entity["Rakunda"]["status"] = [[None]]
entity["Rakunda"]["targetattribute"] = [[Defence]]
entity["Rakunda"]["numericalvalue"] = -50
entity["Rakunda"]["costtype"] = [[SP]]
entity["Blade of Fury"] = {}
entity["Blade of Fury"]["numericaltype"] = [[Absolute Value]]
entity["Blade of Fury"]["element"] = [[Slash]]
entity["Blade of Fury"]["cost"] = 16
entity["Blade of Fury"]["desc"] = [[Many light slash attacks to all foes]]
entity["Blade of Fury"]["numberofhits"] = 3
--a function: conditional
entity["Blade of Fury"]["hitchance"] = 80
entity["Blade of Fury"]["target"] = [[All Enemy]]
entity["Blade of Fury"]["passive"] = false
--a function: statuschance
entity["Blade of Fury"]["name"] = [[Blade of Fury]]
entity["Blade of Fury"]["status"] = [[None]]
entity["Blade of Fury"]["targetattribute"] = [[HP]]
entity["Blade of Fury"]["numericalvalue"] = 100
entity["Blade of Fury"]["costtype"] = [[HP (%)]]
entity["Dodge Pierce"] = {}
--a function: numericaltype
entity["Dodge Pierce"]["element"] = [[Pierce]]
--a function: cost
entity["Dodge Pierce"]["desc"] = [[Improves evasion against pierce attacks]]
--a function: numberofhits
entity["Dodge Pierce"]["conditional"] = [[DODGE]]
--a function: hitchance
entity["Dodge Pierce"]["target"] = [[Self]]
entity["Dodge Pierce"]["passive"] = true
--a function: statuschance
entity["Dodge Pierce"]["name"] = [[Dodge Pierce]]
--a function: status
entity["Dodge Pierce"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Evade Fire"] = {}
--a function: numericaltype
entity["Evade Fire"]["element"] = [[Fire]]
--a function: cost
entity["Evade Fire"]["desc"] = [[Large evasion boost against fire attacks]]
--a function: numberofhits
entity["Evade Fire"]["conditional"] = [[EVADE]]
--a function: hitchance
entity["Evade Fire"]["target"] = [[Self]]
entity["Evade Fire"]["passive"] = true
--a function: statuschance
entity["Evade Fire"]["name"] = [[Evade Fire]]
--a function: status
entity["Evade Fire"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Brave Blade"] = {}
entity["Brave Blade"]["numericaltype"] = [[Absolute Value]]
entity["Brave Blade"]["element"] = [[Slash]]
entity["Brave Blade"]["cost"] = 20
entity["Brave Blade"]["desc"] = [[Huge slash damage to one foe]]
entity["Brave Blade"]["numberofhits"] = 1
--a function: conditional
entity["Brave Blade"]["hitchance"] = 95
entity["Brave Blade"]["target"] = [[One Enemy]]
entity["Brave Blade"]["passive"] = false
--a function: statuschance
entity["Brave Blade"]["name"] = [[Brave Blade]]
entity["Brave Blade"]["status"] = [[None]]
entity["Brave Blade"]["targetattribute"] = [[HP]]
entity["Brave Blade"]["numericalvalue"] = 550
entity["Brave Blade"]["costtype"] = [[HP (%)]]
entity["Poisma"] = {}
--a function: numericaltype
entity["Poisma"]["element"] = [[Status]]
entity["Poisma"]["cost"] = 5
entity["Poisma"]["desc"] = [[Chance to poison one foe]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Poisma"]["target"] = [[One Enemy]]
entity["Poisma"]["passive"] = false
entity["Poisma"]["statuschance"] = 25
entity["Poisma"]["name"] = [[Poisma]]
entity["Poisma"]["status"] = [[Poison]]
--a function: targetattribute
--a function: numericalvalue
entity["Poisma"]["costtype"] = [[SP]]
entity["Auto-Marakunda"] = {}
entity["Auto-Marakunda"]["numericaltype"] = [[Percentage]]
entity["Auto-Marakunda"]["element"] = [[Support]]
--a function: cost
entity["Auto-Marakunda"]["desc"] = [[All foes enter battle with lowered defences]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Auto-Marakunda"]["target"] = [[All Enemy]]
entity["Auto-Marakunda"]["passive"] = true
--a function: statuschance
entity["Auto-Marakunda"]["name"] = [[Auto-Marakunda]]
--a function: status
entity["Auto-Marakunda"]["targetattribute"] = [[Defence]]
entity["Auto-Marakunda"]["numericalvalue"] = -50
--a function: costtype
entity["Repel Slash"] = {}
--a function: numericaltype
entity["Repel Slash"]["element"] = [[Slash]]
--a function: cost
entity["Repel Slash"]["desc"] = [[Raise resistance against slash attacks to 'Repel']]
--a function: numberofhits
entity["Repel Slash"]["conditional"] = [[REPEL]]
--a function: hitchance
entity["Repel Slash"]["target"] = [[Self]]
entity["Repel Slash"]["passive"] = true
--a function: statuschance
entity["Repel Slash"]["name"] = [[Repel Slash]]
--a function: status
entity["Repel Slash"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Mazio"] = {}
entity["Mazio"]["numericaltype"] = [[Absolute Value]]
entity["Mazio"]["element"] = [[Elec]]
entity["Mazio"]["cost"] = 8
entity["Mazio"]["desc"] = [[Small electric damage to all foes]]
entity["Mazio"]["numberofhits"] = 1
--a function: conditional
entity["Mazio"]["hitchance"] = 90
entity["Mazio"]["target"] = [[All Enemy]]
entity["Mazio"]["passive"] = false
entity["Mazio"]["statuschance"] = 10
entity["Mazio"]["name"] = [[Mazio]]
entity["Mazio"]["status"] = [[Shock]]
entity["Mazio"]["targetattribute"] = [[HP]]
entity["Mazio"]["numericalvalue"] = 50
entity["Mazio"]["costtype"] = [[SP]]
entity["Life Drain"] = {}
entity["Life Drain"]["numericaltype"] = [[Absolute Value]]
entity["Life Drain"]["element"] = [[Almighty]]
--a function: cost
entity["Life Drain"]["desc"] = [[Take a small amount of HP from the enemy]]
entity["Life Drain"]["numberofhits"] = 1
entity["Life Drain"]["conditional"] = [[self.hp.add(attack.damage)]]
entity["Life Drain"]["hitchance"] = 100
entity["Life Drain"]["target"] = [[One Enemy]]
entity["Life Drain"]["passive"] = false
--a function: statuschance
entity["Life Drain"]["name"] = [[Life Drain]]
--a function: status
entity["Life Drain"]["targetattribute"] = [[HP]]
entity["Life Drain"]["numericalvalue"] = 35
--a function: costtype
entity["Drain Strike"] = {}
--a function: numericaltype
entity["Drain Strike"]["element"] = [[Strike]]
--a function: cost
entity["Drain Strike"]["desc"] = [[Raise resistance against strike attacks to 'Drain']]
--a function: numberofhits
entity["Drain Strike"]["conditional"] = [[DRAIN]]
--a function: hitchance
entity["Drain Strike"]["target"] = [[Self]]
entity["Drain Strike"]["passive"] = true
--a function: statuschance
entity["Drain Strike"]["name"] = [[Drain Strike]]
--a function: status
entity["Drain Strike"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Vicious Strike"] = {}
entity["Vicious Strike"]["numericaltype"] = [[Absolute Value]]
entity["Vicious Strike"]["element"] = [[Strike]]
entity["Vicious Strike"]["cost"] = 19
entity["Vicious Strike"]["desc"] = [[Major strike damage to one foe]]
entity["Vicious Strike"]["numberofhits"] = 1
--a function: conditional
entity["Vicious Strike"]["hitchance"] = 92
entity["Vicious Strike"]["target"] = [[One Enemy]]
entity["Vicious Strike"]["passive"] = false
--a function: statuschance
entity["Vicious Strike"]["name"] = [[Vicious Strike]]
entity["Vicious Strike"]["status"] = [[None]]
entity["Vicious Strike"]["targetattribute"] = [[HP]]
entity["Vicious Strike"]["numericalvalue"] = 340
entity["Vicious Strike"]["costtype"] = [[HP (%)]]
entity["Double Fangs"] = {}
entity["Double Fangs"]["numericaltype"] = [[Absolute Value]]
entity["Double Fangs"]["element"] = [[Pierce]]
entity["Double Fangs"]["cost"] = 9
entity["Double Fangs"]["desc"] = [[Two small pierce attacks to one foe]]
entity["Double Fangs"]["numberofhits"] = 2
--a function: conditional
entity["Double Fangs"]["hitchance"] = 85
entity["Double Fangs"]["target"] = [[One Enemy]]
entity["Double Fangs"]["passive"] = false
--a function: statuschance
entity["Double Fangs"]["name"] = [[Double Fangs]]
entity["Double Fangs"]["status"] = [[None]]
entity["Double Fangs"]["targetattribute"] = [[HP]]
entity["Double Fangs"]["numericalvalue"] = 20
entity["Double Fangs"]["costtype"] = [[HP (%)]]
entity["Tetrakarn"] = {}
--a function: numericaltype
entity["Tetrakarn"]["element"] = [[Support]]
entity["Tetrakarn"]["cost"] = 55
entity["Tetrakarn"]["desc"] = [[Repels the next physical attack back towards the enemy]]
entity["Tetrakarn"]["numberofhits"] = 1
entity["Tetrakarn"]["conditional"] = [[if attack.element IN physical THEN Repel]]
entity["Tetrakarn"]["hitchance"] = 100
entity["Tetrakarn"]["target"] = [[Self]]
entity["Tetrakarn"]["passive"] = false
--a function: statuschance
entity["Tetrakarn"]["name"] = [[Tetrakarn]]
entity["Tetrakarn"]["status"] = [[None]]
entity["Tetrakarn"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
entity["Tetrakarn"]["costtype"] = [[SP]]
entity["Dodge Strike"] = {}
--a function: numericaltype
entity["Dodge Strike"]["element"] = [[Strike]]
--a function: cost
entity["Dodge Strike"]["desc"] = [[Improves evasion against strike attacks]]
--a function: numberofhits
entity["Dodge Strike"]["conditional"] = [[DODGE]]
--a function: hitchance
entity["Dodge Strike"]["target"] = [[Self]]
entity["Dodge Strike"]["passive"] = true
--a function: statuschance
entity["Dodge Strike"]["name"] = [[Dodge Strike]]
--a function: status
entity["Dodge Strike"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Magarula"] = {}
entity["Magarula"]["numericaltype"] = [[Absolute Value]]
entity["Magarula"]["element"] = [[Wind]]
entity["Magarula"]["cost"] = 12
entity["Magarula"]["desc"] = [[Moderate wind damage to all foes]]
entity["Magarula"]["numberofhits"] = 1
--a function: conditional
entity["Magarula"]["hitchance"] = 90
entity["Magarula"]["target"] = [[All Enemy]]
entity["Magarula"]["passive"] = false
--a function: statuschance
entity["Magarula"]["name"] = [[Magarula]]
entity["Magarula"]["status"] = [[None]]
entity["Magarula"]["targetattribute"] = [[HP]]
entity["Magarula"]["numericalvalue"] = 100
entity["Magarula"]["costtype"] = [[SP]]
entity["Resist Elec"] = {}
--a function: numericaltype
entity["Resist Elec"]["element"] = [[Elec]]
--a function: cost
entity["Resist Elec"]["desc"] = [[Raise resistance against electric attacks to 'Strong']]
--a function: numberofhits
entity["Resist Elec"]["conditional"] = [[STRONG]]
--a function: hitchance
entity["Resist Elec"]["target"] = [[Self]]
entity["Resist Elec"]["passive"] = true
--a function: statuschance
entity["Resist Elec"]["name"] = [[Resist Elec]]
--a function: status
entity["Resist Elec"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Mudoon"] = {}
entity["Mudoon"]["numericaltype"] = [[Percentage]]
entity["Mudoon"]["element"] = [[Dark]]
entity["Mudoon"]["cost"] = 12
entity["Mudoon"]["desc"] = [[Moderate chance to instant-kill one foe with darkness damage.]]
entity["Mudoon"]["numberofhits"] = 1
--a function: conditional
entity["Mudoon"]["hitchance"] = 50
entity["Mudoon"]["target"] = [[One Enemy]]
entity["Mudoon"]["passive"] = false
--a function: statuschance
entity["Mudoon"]["name"] = [[Mudoon]]
entity["Mudoon"]["status"] = [[None]]
entity["Mudoon"]["targetattribute"] = [[HP]]
entity["Mudoon"]["numericalvalue"] = 100
entity["Mudoon"]["costtype"] = [[SP]]
entity["Rebellion"] = {}
entity["Rebellion"]["numericaltype"] = [[Percentage]]
entity["Rebellion"]["element"] = [[Support]]
entity["Rebellion"]["cost"] = 5
entity["Rebellion"]["desc"] = [[Raise critical chance on everyone]]
entity["Rebellion"]["numberofhits"] = 1
--a function: conditional
entity["Rebellion"]["hitchance"] = 100
entity["Rebellion"]["target"] = [[All]]
entity["Rebellion"]["passive"] = false
--a function: statuschance
entity["Rebellion"]["name"] = [[Rebellion]]
entity["Rebellion"]["status"] = [[None]]
entity["Rebellion"]["targetattribute"] = [[Luck]]
entity["Rebellion"]["numericalvalue"] = 50
entity["Rebellion"]["costtype"] = [[SP]]
entity["Black Viper"] = {}
entity["Black Viper"]["numericaltype"] = [[Absolute Value]]
entity["Black Viper"]["element"] = [[Almighty]]
entity["Black Viper"]["cost"] = 60
entity["Black Viper"]["desc"] = [[Enormous almighty damage to one foe that cannot miss]]
entity["Black Viper"]["numberofhits"] = 1
--a function: conditional
entity["Black Viper"]["hitchance"] = 100
entity["Black Viper"]["target"] = [[One Enemy]]
entity["Black Viper"]["passive"] = false
--a function: statuschance
entity["Black Viper"]["name"] = [[Black Viper]]
entity["Black Viper"]["status"] = [[None]]
entity["Black Viper"]["targetattribute"] = [[HP]]
entity["Black Viper"]["numericalvalue"] = 900
entity["Black Viper"]["costtype"] = [[SP]]
entity["Lost Control"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Lost Control"]["desc"] = [[I can't... I... I've lost control!

Player can no longer control the character and he no longer distinguishes friend from foe *CHAOS ONLY*]]
--a function: numberofhits
entity["Lost Control"]["conditional"] = [[if chaos IN party THEN REMOVE FINALLY newparty.add(Chaos)]]
--a function: hitchance
entity["Lost Control"]["target"] = [[Self]]
entity["Lost Control"]["passive"] = false
--a function: statuschance
entity["Lost Control"]["name"] = [[Lost Control]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Infuriate"] = {}
--a function: numericaltype
entity["Infuriate"]["element"] = [[Status]]
entity["Infuriate"]["cost"] = 10
entity["Infuriate"]["desc"] = [[Chance to instill rage in all foes]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Infuriate"]["target"] = [[All Enemy]]
entity["Infuriate"]["passive"] = false
entity["Infuriate"]["statuschance"] = 25
entity["Infuriate"]["name"] = [[Infuriate]]
entity["Infuriate"]["status"] = [[Rage]]
--a function: targetattribute
--a function: numericalvalue
entity["Infuriate"]["costtype"] = [[SP]]
entity["Megidola"] = {}
entity["Megidola"]["numericaltype"] = [[Absolute Value]]
entity["Megidola"]["element"] = [[Almighty]]
entity["Megidola"]["cost"] = 65
entity["Megidola"]["desc"] = [[Moderate almighty damage to all foes]]
entity["Megidola"]["numberofhits"] = 1
--a function: conditional
entity["Megidola"]["hitchance"] = 95
entity["Megidola"]["target"] = [[All Enemy]]
entity["Megidola"]["passive"] = false
--a function: statuschance
entity["Megidola"]["name"] = [[Megidola]]
entity["Megidola"]["status"] = [[None]]
entity["Megidola"]["targetattribute"] = [[HP]]
entity["Megidola"]["numericalvalue"] = 320
entity["Megidola"]["costtype"] = [[SP]]
entity["Agidyne"] = {}
entity["Agidyne"]["numericaltype"] = [[Absolute Value]]
entity["Agidyne"]["element"] = [[Fire]]
entity["Agidyne"]["cost"] = 12
entity["Agidyne"]["desc"] = [[Major fire damage to one foe]]
entity["Agidyne"]["numberofhits"] = 1
--a function: conditional
entity["Agidyne"]["hitchance"] = 95
entity["Agidyne"]["target"] = [[One Enemy]]
entity["Agidyne"]["passive"] = false
--a function: statuschance
entity["Agidyne"]["name"] = [[Agidyne]]
entity["Agidyne"]["status"] = [[None]]
entity["Agidyne"]["targetattribute"] = [[HP]]
entity["Agidyne"]["numericalvalue"] = 320
entity["Agidyne"]["costtype"] = [[SP]]
entity["Growth 1"] = {}
entity["Growth 1"]["numericaltype"] = [[Percentage]]
entity["Growth 1"]["element"] = [[Support]]
--a function: cost
entity["Growth 1"]["desc"] = [[Gain a small amount of extra experience at the end of each battle]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Growth 1"]["target"] = [[Self]]
entity["Growth 1"]["passive"] = true
--a function: statuschance
entity["Growth 1"]["name"] = [[Growth 1]]
--a function: status
entity["Growth 1"]["targetattribute"] = [[EXP]]
entity["Growth 1"]["numericalvalue"] = 25
--a function: costtype
entity["Dodge Slash"] = {}
--a function: numericaltype
entity["Dodge Slash"]["element"] = [[Slash]]
--a function: cost
entity["Dodge Slash"]["desc"] = [[Improves evasion against slash attacks]]
--a function: numberofhits
entity["Dodge Slash"]["conditional"] = [[DODGE]]
--a function: hitchance
entity["Dodge Slash"]["target"] = [[Self]]
entity["Dodge Slash"]["passive"] = true
--a function: statuschance
entity["Dodge Slash"]["name"] = [[Dodge Slash]]
--a function: status
entity["Dodge Slash"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Sprint 04"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 04"]["desc"] = [[enhancements to dynamics, fixes to particles and AI testing]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 04"]["passive"] = false
--a function: statuschance
entity["Sprint 04"]["name"] = [[Sprint 04]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Hama Boost"] = {}
entity["Hama Boost"]["numericaltype"] = [[Percentage]]
entity["Hama Boost"]["element"] = [[Light]]
--a function: cost
entity["Hama Boost"]["desc"] = [[Raises damage of all light attacks]]
--a function: numberofhits
entity["Hama Boost"]["conditional"] = [[if attack.element IS light]]
--a function: hitchance
entity["Hama Boost"]["target"] = [[Self]]
entity["Hama Boost"]["passive"] = true
--a function: statuschance
entity["Hama Boost"]["name"] = [[Hama Boost]]
--a function: status
entity["Hama Boost"]["targetattribute"] = [[Attack]]
entity["Hama Boost"]["numericalvalue"] = 25
--a function: costtype
entity["Auto-Marakukaja"] = {}
entity["Auto-Marakukaja"]["numericaltype"] = [[Percentage]]
entity["Auto-Marakukaja"]["element"] = [[Support]]
--a function: cost
entity["Auto-Marakukaja"]["desc"] = [[All allies enter battle with heightened defences]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Auto-Marakukaja"]["target"] = [[All Ally]]
entity["Auto-Marakukaja"]["passive"] = true
--a function: statuschance
entity["Auto-Marakukaja"]["name"] = [[Auto-Marakukaja]]
--a function: status
entity["Auto-Marakukaja"]["targetattribute"] = [[Defence]]
entity["Auto-Marakukaja"]["numericalvalue"] = 50
--a function: costtype
entity["Gale Slash"] = {}
entity["Gale Slash"]["numericaltype"] = [[Absolute Value]]
entity["Gale Slash"]["element"] = [[Slash]]
entity["Gale Slash"]["cost"] = 14
entity["Gale Slash"]["desc"] = [[Light slash damage to all foes]]
entity["Gale Slash"]["numberofhits"] = 1
--a function: conditional
entity["Gale Slash"]["hitchance"] = 95
entity["Gale Slash"]["target"] = [[All Enemy]]
entity["Gale Slash"]["passive"] = false
--a function: statuschance
entity["Gale Slash"]["name"] = [[Gale Slash]]
entity["Gale Slash"]["status"] = [[None]]
entity["Gale Slash"]["targetattribute"] = [[HP]]
entity["Gale Slash"]["numericalvalue"] = 100
entity["Gale Slash"]["costtype"] = [[HP (%)]]
entity["Re Patra"] = {}
--a function: numericaltype
entity["Re Patra"]["element"] = [[Support]]
entity["Re Patra"]["cost"] = 3
entity["Re Patra"]["desc"] = [[Brings one ally to their feet]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Re Patra"]["target"] = [[One Ally]]
entity["Re Patra"]["passive"] = false
entity["Re Patra"]["statuschance"] = 100
entity["Re Patra"]["name"] = [[Re Patra]]
entity["Re Patra"]["status"] = [[Down]]
--a function: targetattribute
--a function: numericalvalue
entity["Re Patra"]["costtype"] = [[SP]]
entity["Elec Break"] = {}
--a function: numericaltype
entity["Elec Break"]["element"] = [[Elec]]
entity["Elec Break"]["cost"] = 40
entity["Elec Break"]["desc"] = [[Reduces electric resistance of one foe to 'Normal']]
entity["Elec Break"]["numberofhits"] = 1
entity["Elec Break"]["conditional"] = [[NORMAL]]
entity["Elec Break"]["hitchance"] = 100
entity["Elec Break"]["target"] = [[One Enemy]]
entity["Elec Break"]["passive"] = false
--a function: statuschance
entity["Elec Break"]["name"] = [[Elec Break]]
entity["Elec Break"]["status"] = [[None]]
entity["Elec Break"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
entity["Elec Break"]["costtype"] = [[SP]]
entity["Me Patra"] = {}
--a function: numericaltype
entity["Me Patra"]["element"] = [[Support]]
entity["Me Patra"]["cost"] = 6
entity["Me Patra"]["desc"] = [[Cures panic, fear and distress in all allies]]
--a function: numberofhits
entity["Me Patra"]["conditional"] = [[panic OR fear OR distress]]
--a function: hitchance
entity["Me Patra"]["target"] = [[All Ally]]
entity["Me Patra"]["passive"] = false
entity["Me Patra"]["statuschance"] = 100
entity["Me Patra"]["name"] = [[Me Patra]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
entity["Me Patra"]["costtype"] = [[SP]]
entity["Evade Strike"] = {}
--a function: numericaltype
entity["Evade Strike"]["element"] = [[Strike]]
--a function: cost
entity["Evade Strike"]["desc"] = [[Large evasion boost against strike attacks]]
--a function: numberofhits
entity["Evade Strike"]["conditional"] = [[EVADE]]
--a function: hitchance
entity["Evade Strike"]["target"] = [[Self]]
entity["Evade Strike"]["passive"] = true
--a function: statuschance
entity["Evade Strike"]["name"] = [[Evade Strike]]
--a function: status
entity["Evade Strike"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Sprint 11"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 11"]["desc"] = [[pass 2 on frameworks for AI, particles and interaction]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 11"]["passive"] = false
--a function: statuschance
entity["Sprint 11"]["name"] = [[Sprint 11]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Bash"] = {}
entity["Bash"]["numericaltype"] = [[Absolute Value]]
entity["Bash"]["element"] = [[Strike]]
entity["Bash"]["cost"] = 7
entity["Bash"]["desc"] = [[Small strike damage to one foe]]
entity["Bash"]["numberofhits"] = 1
--a function: conditional
entity["Bash"]["hitchance"] = 90
entity["Bash"]["target"] = [[One Enemy]]
entity["Bash"]["passive"] = false
--a function: statuschance
entity["Bash"]["name"] = [[Bash]]
entity["Bash"]["status"] = [[None]]
entity["Bash"]["targetattribute"] = [[HP]]
entity["Bash"]["numericalvalue"] = 30
entity["Bash"]["costtype"] = [[HP (%)]]
entity["Null Fire"] = {}
--a function: numericaltype
entity["Null Fire"]["element"] = [[Fire]]
--a function: cost
entity["Null Fire"]["desc"] = [[Raise resistance to fire damage to Null]]
--a function: numberofhits
entity["Null Fire"]["conditional"] = [[NULL]]
--a function: hitchance
entity["Null Fire"]["target"] = [[Self]]
entity["Null Fire"]["passive"] = true
--a function: statuschance
entity["Null Fire"]["name"] = [[Null Fire]]
--a function: status
entity["Null Fire"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Pulinpa"] = {}
--a function: numericaltype
entity["Pulinpa"]["element"] = [[Status]]
entity["Pulinpa"]["cost"] = 5
entity["Pulinpa"]["desc"] = [[Chance to instill panic in one foe]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Pulinpa"]["target"] = [[One Enemy]]
entity["Pulinpa"]["passive"] = false
entity["Pulinpa"]["statuschance"] = 25
entity["Pulinpa"]["name"] = [[Pulinpa]]
entity["Pulinpa"]["status"] = [[Panic]]
--a function: targetattribute
--a function: numericalvalue
entity["Pulinpa"]["costtype"] = [[SP]]
entity["Dekunda"] = {}
--a function: numericaltype
entity["Dekunda"]["element"] = [[Support]]
entity["Dekunda"]["cost"] = 15
entity["Dekunda"]["desc"] = [[Removes all stat debuffs from all allies]]
entity["Dekunda"]["numberofhits"] = 1
entity["Dekunda"]["conditional"] = [[if friend.statqueue CONTAINS debuff then REMOVE]]
entity["Dekunda"]["hitchance"] = 100
entity["Dekunda"]["target"] = [[All Ally]]
entity["Dekunda"]["passive"] = false
--a function: statuschance
entity["Dekunda"]["name"] = [[Dekunda]]
entity["Dekunda"]["status"] = [[None]]
--a function: targetattribute
--a function: numericalvalue
entity["Dekunda"]["costtype"] = [[SP]]
entity["Cruel Attack"] = {}
entity["Cruel Attack"]["numericaltype"] = [[Absolute Value]]
entity["Cruel Attack"]["element"] = [[Pierce]]
entity["Cruel Attack"]["cost"] = 10
entity["Cruel Attack"]["desc"] = [[Moderate pierce damage to one foe]]
entity["Cruel Attack"]["numberofhits"] = 1
--a function: conditional
entity["Cruel Attack"]["hitchance"] = 99
entity["Cruel Attack"]["target"] = [[One Enemy]]
entity["Cruel Attack"]["passive"] = false
--a function: statuschance
entity["Cruel Attack"]["name"] = [[Cruel Attack]]
entity["Cruel Attack"]["status"] = [[None]]
entity["Cruel Attack"]["targetattribute"] = [[HP]]
entity["Cruel Attack"]["numericalvalue"] = 225
entity["Cruel Attack"]["costtype"] = [[HP (%)]]
entity["Mind Charge"] = {}
entity["Mind Charge"]["numericaltype"] = [[Percentage]]
entity["Mind Charge"]["element"] = [[Support]]
entity["Mind Charge"]["cost"] = 15
entity["Mind Charge"]["desc"] = [[Greatly boost damage on the next magic attack]]
entity["Mind Charge"]["numberofhits"] = 1
entity["Mind Charge"]["conditional"] = [[END if mattack is DONE]]
entity["Mind Charge"]["hitchance"] = 100
entity["Mind Charge"]["target"] = [[One Ally]]
entity["Mind Charge"]["passive"] = false
--a function: statuschance
entity["Mind Charge"]["name"] = [[Mind Charge]]
entity["Mind Charge"]["status"] = [[None]]
entity["Mind Charge"]["targetattribute"] = [[Magic]]
entity["Mind Charge"]["numericalvalue"] = 150
entity["Mind Charge"]["costtype"] = [[SP]]
entity["Sprint 15"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 15"]["desc"] = [[Modeling tools for:

- quick draw
- squash
- stretch
- quick render to low-res and publish

Asset management tools:

- hooks for Tank
- shotgun publish framework]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 15"]["passive"] = false
--a function: statuschance
entity["Sprint 15"]["name"] = [[Sprint 15]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Watch me Dance"] = {}
entity["Watch me Dance"]["numericaltype"] = [[Percentage]]
entity["Watch me Dance"]["element"] = [[Support]]
--a function: cost
entity["Watch me Dance"]["desc"] = [[Watch me dance! Boosts evasion.

*CHAOS ONLY*]]
entity["Watch me Dance"]["numberofhits"] = 1
--a function: conditional
entity["Watch me Dance"]["hitchance"] = 100
entity["Watch me Dance"]["target"] = [[Self]]
entity["Watch me Dance"]["passive"] = false
--a function: statuschance
entity["Watch me Dance"]["name"] = [[Watch me Dance]]
--a function: status
entity["Watch me Dance"]["targetattribute"] = [[Agility]]
entity["Watch me Dance"]["numericalvalue"] = 200
--a function: costtype
entity["Null Light"] = {}
--a function: numericaltype
entity["Null Light"]["element"] = [[Light]]
--a function: cost
entity["Null Light"]["desc"] = [[Raise resistance to light damage to Null]]
--a function: numberofhits
entity["Null Light"]["conditional"] = [[NULL]]
--a function: hitchance
entity["Null Light"]["target"] = [[Self]]
entity["Null Light"]["passive"] = true
--a function: statuschance
entity["Null Light"]["name"] = [[Null Light]]
--a function: status
entity["Null Light"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Mudo Boost"] = {}
entity["Mudo Boost"]["numericaltype"] = [[Percentage]]
entity["Mudo Boost"]["element"] = [[Dark]]
--a function: cost
entity["Mudo Boost"]["desc"] = [[Raises damage of all darkness attacks]]
--a function: numberofhits
entity["Mudo Boost"]["conditional"] = [[if attack.element IS dark]]
--a function: hitchance
entity["Mudo Boost"]["target"] = [[Self]]
entity["Mudo Boost"]["passive"] = true
--a function: statuschance
entity["Mudo Boost"]["name"] = [[Mudo Boost]]
--a function: status
entity["Mudo Boost"]["targetattribute"] = [[Attack]]
entity["Mudo Boost"]["numericalvalue"] = 25
--a function: costtype
entity["Garula"] = {}
entity["Garula"]["numericaltype"] = [[Absolute Value]]
entity["Garula"]["element"] = [[Wind]]
entity["Garula"]["cost"] = 6
entity["Garula"]["desc"] = [[Moderate wind damage to one foe]]
entity["Garula"]["numberofhits"] = 1
--a function: conditional
entity["Garula"]["hitchance"] = 95
entity["Garula"]["target"] = [[One Enemy]]
entity["Garula"]["passive"] = false
--a function: statuschance
entity["Garula"]["name"] = [[Garula]]
entity["Garula"]["status"] = [[None]]
entity["Garula"]["targetattribute"] = [[HP]]
entity["Garula"]["numericalvalue"] = 100
entity["Garula"]["costtype"] = [[SP]]
entity["Tempest Slash"] = {}
entity["Tempest Slash"]["numericaltype"] = [[Absolute Value]]
entity["Tempest Slash"]["element"] = [[Slash]]
entity["Tempest Slash"]["cost"] = 13
entity["Tempest Slash"]["desc"] = [[Two major slash attacks to all foes]]
entity["Tempest Slash"]["numberofhits"] = 2
--a function: conditional
entity["Tempest Slash"]["hitchance"] = 95
entity["Tempest Slash"]["target"] = [[All Enemy]]
entity["Tempest Slash"]["passive"] = false
--a function: statuschance
entity["Tempest Slash"]["name"] = [[Tempest Slash]]
entity["Tempest Slash"]["status"] = [[None]]
entity["Tempest Slash"]["targetattribute"] = [[HP]]
entity["Tempest Slash"]["numericalvalue"] = 350
entity["Tempest Slash"]["costtype"] = [[HP (%)]]
entity["Bufudyne"] = {}
entity["Bufudyne"]["numericaltype"] = [[Absolute Value]]
entity["Bufudyne"]["element"] = [[Ice]]
entity["Bufudyne"]["cost"] = 16
entity["Bufudyne"]["desc"] = [[Major ice damage to one foe]]
entity["Bufudyne"]["numberofhits"] = 1
--a function: conditional
entity["Bufudyne"]["hitchance"] = 95
entity["Bufudyne"]["target"] = [[One Enemy]]
entity["Bufudyne"]["passive"] = false
entity["Bufudyne"]["statuschance"] = 10
entity["Bufudyne"]["name"] = [[Bufudyne]]
entity["Bufudyne"]["status"] = [[Freeze]]
entity["Bufudyne"]["targetattribute"] = [[HP]]
entity["Bufudyne"]["numericalvalue"] = 320
entity["Bufudyne"]["costtype"] = [[SP]]
entity["Null Slash"] = {}
--a function: numericaltype
entity["Null Slash"]["element"] = [[Slash]]
--a function: cost
entity["Null Slash"]["desc"] = [[Raise resistance to slash damage to Null]]
--a function: numberofhits
entity["Null Slash"]["conditional"] = [[NULL]]
--a function: hitchance
entity["Null Slash"]["target"] = [[Self]]
entity["Null Slash"]["passive"] = true
--a function: statuschance
entity["Null Slash"]["name"] = [[Null Slash]]
--a function: status
entity["Null Slash"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Sukunda"] = {}
entity["Sukunda"]["numericaltype"] = [[Percentage]]
entity["Sukunda"]["element"] = [[Support]]
entity["Sukunda"]["cost"] = 6
entity["Sukunda"]["desc"] = [[Lowers Hit/Evasion of one foe]]
entity["Sukunda"]["numberofhits"] = 1
--a function: conditional
entity["Sukunda"]["hitchance"] = 100
entity["Sukunda"]["target"] = [[One Enemy]]
entity["Sukunda"]["passive"] = false
--a function: statuschance
entity["Sukunda"]["name"] = [[Sukunda]]
entity["Sukunda"]["status"] = [[None]]
entity["Sukunda"]["targetattribute"] = [[Agility]]
entity["Sukunda"]["numericalvalue"] = -50
entity["Sukunda"]["costtype"] = [[SP]]
entity["Eerie Sound"] = {}
--a function: numericaltype
entity["Eerie Sound"]["element"] = [[Status]]
entity["Eerie Sound"]["cost"] = 10
entity["Eerie Sound"]["desc"] = [[Chance to distress all foes]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Eerie Sound"]["target"] = [[All Enemy]]
entity["Eerie Sound"]["passive"] = false
entity["Eerie Sound"]["statuschance"] = 25
entity["Eerie Sound"]["name"] = [[Eerie Sound]]
entity["Eerie Sound"]["status"] = [[Distress]]
--a function: targetattribute
--a function: numericalvalue
entity["Eerie Sound"]["costtype"] = [[SP]]
entity["Patra"] = {}
--a function: numericaltype
entity["Patra"]["element"] = [[Support]]
entity["Patra"]["cost"] = 3
entity["Patra"]["desc"] = [[Cures panic, fear and distress in one ally]]
--a function: numberofhits
entity["Patra"]["conditional"] = [[panic OR fear OR distress]]
--a function: hitchance
entity["Patra"]["target"] = [[One Ally]]
entity["Patra"]["passive"] = false
entity["Patra"]["statuschance"] = 100
entity["Patra"]["name"] = [[Patra]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
entity["Patra"]["costtype"] = [[SP]]
entity["Mabufula"] = {}
entity["Mabufula"]["numericaltype"] = [[Absolute Value]]
entity["Mabufula"]["element"] = [[Ice]]
entity["Mabufula"]["cost"] = 16
entity["Mabufula"]["desc"] = [[Moderate ice damage to all foes]]
entity["Mabufula"]["numberofhits"] = 1
--a function: conditional
entity["Mabufula"]["hitchance"] = 90
entity["Mabufula"]["target"] = [[All Enemy]]
entity["Mabufula"]["passive"] = false
entity["Mabufula"]["statuschance"] = 10
entity["Mabufula"]["name"] = [[Mabufula]]
entity["Mabufula"]["status"] = [[Freeze]]
entity["Mabufula"]["targetattribute"] = [[HP]]
entity["Mabufula"]["numericalvalue"] = 100
entity["Mabufula"]["costtype"] = [[SP]]
entity["Sprint 09"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 09"]["desc"] = [[More custom features for spectator mode and cheat codes, fix more P1 bugs and pusho the testing framework]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 09"]["passive"] = false
--a function: statuschance
entity["Sprint 09"]["name"] = [[Sprint 09]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Tarunda"] = {}
entity["Tarunda"]["numericaltype"] = [[Percentage]]
entity["Tarunda"]["element"] = [[Support]]
entity["Tarunda"]["cost"] = 6
entity["Tarunda"]["desc"] = [[Lowers attack power of one enemy]]
entity["Tarunda"]["numberofhits"] = 1
--a function: conditional
entity["Tarunda"]["hitchance"] = 100
entity["Tarunda"]["target"] = [[One Enemy]]
entity["Tarunda"]["passive"] = false
--a function: statuschance
entity["Tarunda"]["name"] = [[Tarunda]]
entity["Tarunda"]["status"] = [[None]]
entity["Tarunda"]["targetattribute"] = [[Attack]]
entity["Tarunda"]["numericalvalue"] = -50
entity["Tarunda"]["costtype"] = [[SP]]
entity["Matarukaja"] = {}
entity["Matarukaja"]["numericaltype"] = [[Percentage]]
entity["Matarukaja"]["element"] = [[Support]]
entity["Matarukaja"]["cost"] = 12
entity["Matarukaja"]["desc"] = [[Boosts attack power for all allies]]
entity["Matarukaja"]["numberofhits"] = 1
--a function: conditional
entity["Matarukaja"]["hitchance"] = 100
entity["Matarukaja"]["target"] = [[All Ally]]
entity["Matarukaja"]["passive"] = false
--a function: statuschance
entity["Matarukaja"]["name"] = [[Matarukaja]]
entity["Matarukaja"]["status"] = [[None]]
entity["Matarukaja"]["targetattribute"] = [[Attack]]
entity["Matarukaja"]["numericalvalue"] = 50
entity["Matarukaja"]["costtype"] = [[SP]]
entity["Ghastly Wail"] = {}
entity["Ghastly Wail"]["numericaltype"] = [[Percentage]]
entity["Ghastly Wail"]["element"] = [[Almighty]]
entity["Ghastly Wail"]["cost"] = 15
entity["Ghastly Wail"]["desc"] = [[Instantly kill anyone inflicted with fear]]
entity["Ghastly Wail"]["numberofhits"] = 1
entity["Ghastly Wail"]["conditional"] = [[if all[i].status IS fear]]
entity["Ghastly Wail"]["hitchance"] = 100
entity["Ghastly Wail"]["target"] = [[All]]
entity["Ghastly Wail"]["passive"] = false
--a function: statuschance
entity["Ghastly Wail"]["name"] = [[Ghastly Wail]]
--a function: status
entity["Ghastly Wail"]["targetattribute"] = [[HP]]
entity["Ghastly Wail"]["numericalvalue"] = 100
entity["Ghastly Wail"]["costtype"] = [[SP]]
entity["Ziodyne"] = {}
entity["Ziodyne"]["numericaltype"] = [[Absolute Value]]
entity["Ziodyne"]["element"] = [[Elec]]
entity["Ziodyne"]["cost"] = 16
entity["Ziodyne"]["desc"] = [[Major electric damage to one foe]]
entity["Ziodyne"]["numberofhits"] = 1
--a function: conditional
entity["Ziodyne"]["hitchance"] = 95
entity["Ziodyne"]["target"] = [[One Enemy]]
entity["Ziodyne"]["passive"] = false
entity["Ziodyne"]["statuschance"] = 10
entity["Ziodyne"]["name"] = [[Ziodyne]]
entity["Ziodyne"]["status"] = [[Shock]]
entity["Ziodyne"]["targetattribute"] = [[HP]]
entity["Ziodyne"]["numericalvalue"] = 320
entity["Ziodyne"]["costtype"] = [[SP]]
entity["Resist Wind"] = {}
--a function: numericaltype
entity["Resist Wind"]["element"] = [[Wind]]
--a function: cost
entity["Resist Wind"]["desc"] = [[Raise resistance against wind attacks to 'Strong']]
--a function: numberofhits
entity["Resist Wind"]["conditional"] = [[STRONG]]
--a function: hitchance
entity["Resist Wind"]["target"] = [[Self]]
entity["Resist Wind"]["passive"] = true
--a function: statuschance
entity["Resist Wind"]["name"] = [[Resist Wind]]
--a function: status
entity["Resist Wind"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["2h Swd Master"] = {}
entity["2h Swd Master"]["numericaltype"] = [[Percentage]]
entity["2h Swd Master"]["element"] = [[Support]]
--a function: cost
entity["2h Swd Master"]["desc"] = [[Raises damage done with two-handed swords]]
--a function: numberofhits
entity["2h Swd Master"]["conditional"] = [[if self.weapon.type IS HHSWD]]
--a function: hitchance
entity["2h Swd Master"]["target"] = [[Self]]
entity["2h Swd Master"]["passive"] = true
--a function: statuschance
entity["2h Swd Master"]["name"] = [[2h Swd Master]]
--a function: status
entity["2h Swd Master"]["targetattribute"] = [[Attack]]
entity["2h Swd Master"]["numericalvalue"] = 100
--a function: costtype
entity["1h Swd Master"] = {}
entity["1h Swd Master"]["numericaltype"] = [[Percentage]]
entity["1h Swd Master"]["element"] = [[Support]]
--a function: cost
entity["1h Swd Master"]["desc"] = [[Raises damage done with rapiers]]
--a function: numberofhits
entity["1h Swd Master"]["conditional"] = [[if self.weapon.type IS HSWD]]
--a function: hitchance
entity["1h Swd Master"]["target"] = [[Self]]
entity["1h Swd Master"]["passive"] = true
--a function: statuschance
entity["1h Swd Master"]["name"] = [[1h Swd Master]]
--a function: status
entity["1h Swd Master"]["targetattribute"] = [[Attack]]
entity["1h Swd Master"]["numericalvalue"] = 100
--a function: costtype
entity["Null Dark"] = {}
--a function: numericaltype
entity["Null Dark"]["element"] = [[Dark]]
--a function: cost
entity["Null Dark"]["desc"] = [[Raise resistance to dark damage to Null]]
--a function: numberofhits
entity["Null Dark"]["conditional"] = [[NULL]]
--a function: hitchance
entity["Null Dark"]["target"] = [[Self]]
entity["Null Dark"]["passive"] = true
--a function: statuschance
entity["Null Dark"]["name"] = [[Null Dark]]
--a function: status
entity["Null Dark"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Evade Slash"] = {}
--a function: numericaltype
entity["Evade Slash"]["element"] = [[Slash]]
--a function: cost
entity["Evade Slash"]["desc"] = [[Large evasion boost against slash attacks]]
--a function: numberofhits
entity["Evade Slash"]["conditional"] = [[EVADE]]
--a function: hitchance
entity["Evade Slash"]["target"] = [[Self]]
entity["Evade Slash"]["passive"] = true
--a function: statuschance
entity["Evade Slash"]["name"] = [[Evade Slash]]
--a function: status
entity["Evade Slash"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Evade Pierce"] = {}
--a function: numericaltype
entity["Evade Pierce"]["element"] = [[Pierce]]
--a function: cost
entity["Evade Pierce"]["desc"] = [[Large evasion boost against pierce attacks]]
--a function: numberofhits
entity["Evade Pierce"]["conditional"] = [[EVADE]]
--a function: hitchance
entity["Evade Pierce"]["target"] = [[Self]]
entity["Evade Pierce"]["passive"] = true
--a function: statuschance
entity["Evade Pierce"]["name"] = [[Evade Pierce]]
--a function: status
entity["Evade Pierce"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Survive Dark"] = {}
--a function: numericaltype
entity["Survive Dark"]["element"] = [[Dark]]
--a function: cost
entity["Survive Dark"]["desc"] = [[Heightens chance of not being killed by dark attacks]]
--a function: numberofhits
entity["Survive Dark"]["conditional"] = [[SURVIVE]]
--a function: hitchance
entity["Survive Dark"]["target"] = [[Self]]
entity["Survive Dark"]["passive"] = true
--a function: statuschance
entity["Survive Dark"]["name"] = [[Survive Dark]]
--a function: status
entity["Survive Dark"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Mabufudyne"] = {}
entity["Mabufudyne"]["numericaltype"] = [[Absolute Value]]
entity["Mabufudyne"]["element"] = [[Ice]]
entity["Mabufudyne"]["cost"] = 32
entity["Mabufudyne"]["desc"] = [[Major ice damage to all foes]]
entity["Mabufudyne"]["numberofhits"] = 1
--a function: conditional
entity["Mabufudyne"]["hitchance"] = 90
entity["Mabufudyne"]["target"] = [[All Enemy]]
entity["Mabufudyne"]["passive"] = false
entity["Mabufudyne"]["statuschance"] = 10
entity["Mabufudyne"]["name"] = [[Mabufudyne]]
entity["Mabufudyne"]["status"] = [[Freeze]]
entity["Mabufudyne"]["targetattribute"] = [[HP]]
entity["Mabufudyne"]["numericalvalue"] = 320
entity["Mabufudyne"]["costtype"] = [[SP]]
entity["Maragi"] = {}
entity["Maragi"]["numericaltype"] = [[Absolute Value]]
entity["Maragi"]["element"] = [[Fire]]
entity["Maragi"]["cost"] = 6
entity["Maragi"]["desc"] = [[Small fire damage to all foes]]
entity["Maragi"]["numberofhits"] = 1
--a function: conditional
entity["Maragi"]["hitchance"] = 90
entity["Maragi"]["target"] = [[All Enemy]]
entity["Maragi"]["passive"] = false
--a function: statuschance
entity["Maragi"]["name"] = [[Maragi]]
entity["Maragi"]["status"] = [[None]]
entity["Maragi"]["targetattribute"] = [[HP]]
entity["Maragi"]["numericalvalue"] = 50
entity["Maragi"]["costtype"] = [[SP]]
entity["Bufula"] = {}
entity["Bufula"]["numericaltype"] = [[Absolute Value]]
entity["Bufula"]["element"] = [[Ice]]
entity["Bufula"]["cost"] = 8
entity["Bufula"]["desc"] = [[Moderate ice damage to one foe]]
entity["Bufula"]["numberofhits"] = 1
--a function: conditional
entity["Bufula"]["hitchance"] = 95
entity["Bufula"]["target"] = [[One Enemy]]
entity["Bufula"]["passive"] = false
entity["Bufula"]["statuschance"] = 10
entity["Bufula"]["name"] = [[Bufula]]
entity["Bufula"]["status"] = [[Freeze]]
entity["Bufula"]["targetattribute"] = [[HP]]
entity["Bufula"]["numericalvalue"] = 100
entity["Bufula"]["costtype"] = [[SP]]
entity["Survive Light"] = {}
--a function: numericaltype
entity["Survive Light"]["element"] = [[Light]]
--a function: cost
entity["Survive Light"]["desc"] = [[Heightens chance of not being killed by light attacks]]
--a function: numberofhits
entity["Survive Light"]["conditional"] = [[SURVIVE]]
--a function: hitchance
entity["Survive Light"]["target"] = [[Self]]
entity["Survive Light"]["passive"] = true
--a function: statuschance
entity["Survive Light"]["name"] = [[Survive Light]]
--a function: status
entity["Survive Light"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Sprint 03"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 03"]["desc"] = [[pass 3 on AI, more particles and enhancements to dynamics and interaction]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 03"]["passive"] = false
--a function: statuschance
entity["Sprint 03"]["name"] = [[Sprint 03]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Holy Arrow"] = {}
entity["Holy Arrow"]["numericaltype"] = [[Absolute Value]]
entity["Holy Arrow"]["element"] = [[Pierce]]
entity["Holy Arrow"]["cost"] = 9
entity["Holy Arrow"]["desc"] = [[Light pierce damage to one foe with chance to charm]]
entity["Holy Arrow"]["numberofhits"] = 1
--a function: conditional
entity["Holy Arrow"]["hitchance"] = 90
entity["Holy Arrow"]["target"] = [[One Enemy]]
entity["Holy Arrow"]["passive"] = false
entity["Holy Arrow"]["statuschance"] = 10
entity["Holy Arrow"]["name"] = [[Holy Arrow]]
entity["Holy Arrow"]["status"] = [[Charm]]
entity["Holy Arrow"]["targetattribute"] = [[HP]]
entity["Holy Arrow"]["numericalvalue"] = 60
entity["Holy Arrow"]["costtype"] = [[HP (%)]]
entity["Fear Boost"] = {}
--a function: numericaltype
entity["Fear Boost"]["element"] = [[Status]]
--a function: cost
entity["Fear Boost"]["desc"] = [[Raises chance to inflict fear to the enemy]]
--a function: numberofhits
entity["Fear Boost"]["conditional"] = [[if attack.status IS fear THEN BOOST chance]]
--a function: hitchance
entity["Fear Boost"]["target"] = [[Self]]
entity["Fear Boost"]["passive"] = true
entity["Fear Boost"]["statuschance"] = 25
entity["Fear Boost"]["name"] = [[Fear Boost]]
entity["Fear Boost"]["status"] = [[Fear]]
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Zionga"] = {}
entity["Zionga"]["numericaltype"] = [[Absolute Value]]
entity["Zionga"]["element"] = [[Elec]]
entity["Zionga"]["cost"] = 8
entity["Zionga"]["desc"] = [[Moderate electric damage to one foe]]
entity["Zionga"]["numberofhits"] = 1
--a function: conditional
entity["Zionga"]["hitchance"] = 95
entity["Zionga"]["target"] = [[One Enemy]]
entity["Zionga"]["passive"] = false
entity["Zionga"]["statuschance"] = 10
entity["Zionga"]["name"] = [[Zionga]]
entity["Zionga"]["status"] = [[Shock]]
entity["Zionga"]["targetattribute"] = [[HP]]
entity["Zionga"]["numericalvalue"] = 100
entity["Zionga"]["costtype"] = [[SP]]
entity["Ragnarok"] = {}
entity["Ragnarok"]["numericaltype"] = [[Absolute Value]]
entity["Ragnarok"]["element"] = [[Fire]]
entity["Ragnarok"]["cost"] = 30
entity["Ragnarok"]["desc"] = [[Huge fire damage to one foe]]
entity["Ragnarok"]["numberofhits"] = 1
--a function: conditional
entity["Ragnarok"]["hitchance"] = 99
entity["Ragnarok"]["target"] = [[One Enemy]]
entity["Ragnarok"]["passive"] = false
--a function: statuschance
entity["Ragnarok"]["name"] = [[Ragnarok]]
entity["Ragnarok"]["status"] = [[None]]
entity["Ragnarok"]["targetattribute"] = [[HP]]
entity["Ragnarok"]["numericalvalue"] = 650
entity["Ragnarok"]["costtype"] = [[SP]]
entity["Garu"] = {}
entity["Garu"]["numericaltype"] = [[Absolute Value]]
entity["Garu"]["element"] = [[Wind]]
entity["Garu"]["cost"] = 3
entity["Garu"]["desc"] = [[Small wind damage to one foe]]
entity["Garu"]["numberofhits"] = 1
--a function: conditional
entity["Garu"]["hitchance"] = 95
entity["Garu"]["target"] = [[One Enemy]]
entity["Garu"]["passive"] = false
--a function: statuschance
entity["Garu"]["name"] = [[Garu]]
entity["Garu"]["status"] = [[None]]
entity["Garu"]["targetattribute"] = [[HP]]
entity["Garu"]["numericalvalue"] = 50
entity["Garu"]["costtype"] = [[SP]]
entity["Ice Boost"] = {}
entity["Ice Boost"]["numericaltype"] = [[Percentage]]
entity["Ice Boost"]["element"] = [[Ice]]
--a function: cost
entity["Ice Boost"]["desc"] = [[Raises damage of all ice attacks]]
--a function: numberofhits
entity["Ice Boost"]["conditional"] = [[if attack.element IS ice]]
--a function: hitchance
entity["Ice Boost"]["target"] = [[Self]]
entity["Ice Boost"]["passive"] = true
--a function: statuschance
entity["Ice Boost"]["name"] = [[Ice Boost]]
--a function: status
entity["Ice Boost"]["targetattribute"] = [[Attack]]
entity["Ice Boost"]["numericalvalue"] = 25
--a function: costtype
entity["Torrent Shot"] = {}
entity["Torrent Shot"]["numericaltype"] = [[Absolute Value]]
entity["Torrent Shot"]["element"] = [[Pierce]]
entity["Torrent Shot"]["cost"] = 10
entity["Torrent Shot"]["desc"] = [[Three small pierce attacks to one foe]]
entity["Torrent Shot"]["numberofhits"] = 3
--a function: conditional
entity["Torrent Shot"]["hitchance"] = 80
entity["Torrent Shot"]["target"] = [[One Enemy]]
entity["Torrent Shot"]["passive"] = false
--a function: statuschance
entity["Torrent Shot"]["name"] = [[Torrent Shot]]
entity["Torrent Shot"]["status"] = [[None]]
entity["Torrent Shot"]["targetattribute"] = [[HP]]
entity["Torrent Shot"]["numericalvalue"] = 50
entity["Torrent Shot"]["costtype"] = [[HP (%)]]
entity["Repel Strike"] = {}
--a function: numericaltype
entity["Repel Strike"]["element"] = [[Strike]]
--a function: cost
entity["Repel Strike"]["desc"] = [[Raise resistance against strike attacks to 'Repel']]
--a function: numberofhits
entity["Repel Strike"]["conditional"] = [[REPEL]]
--a function: hitchance
entity["Repel Strike"]["target"] = [[Self]]
entity["Repel Strike"]["passive"] = true
--a function: statuschance
entity["Repel Strike"]["name"] = [[Repel Strike]]
--a function: status
entity["Repel Strike"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Sprint 07"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 07"]["desc"] = [[Push on AI, some mods and fix some P1 bugs from testing]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 07"]["passive"] = false
--a function: statuschance
entity["Sprint 07"]["name"] = [[Sprint 07]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Mediarahan"] = {}
entity["Mediarahan"]["numericaltype"] = [[Percentage]]
entity["Mediarahan"]["element"] = [[Support]]
entity["Mediarahan"]["cost"] = 40
entity["Mediarahan"]["desc"] = [[Full heal for all allies]]
entity["Mediarahan"]["numberofhits"] = 1
--a function: conditional
entity["Mediarahan"]["hitchance"] = 100
entity["Mediarahan"]["target"] = [[All Ally]]
entity["Mediarahan"]["passive"] = false
--a function: statuschance
entity["Mediarahan"]["name"] = [[Mediarahan]]
entity["Mediarahan"]["status"] = [[None]]
entity["Mediarahan"]["targetattribute"] = [[HP]]
entity["Mediarahan"]["numericalvalue"] = 100
entity["Mediarahan"]["costtype"] = [[SP]]
entity["Cleave"] = {}
entity["Cleave"]["numericaltype"] = [[Absolute Value]]
entity["Cleave"]["element"] = [[Slash]]
entity["Cleave"]["cost"] = 7
entity["Cleave"]["desc"] = [[Small slash damage to one foe]]
entity["Cleave"]["numberofhits"] = 1
--a function: conditional
entity["Cleave"]["hitchance"] = 90
entity["Cleave"]["target"] = [[One Enemy]]
entity["Cleave"]["passive"] = false
--a function: statuschance
entity["Cleave"]["name"] = [[Cleave]]
entity["Cleave"]["status"] = [[None]]
entity["Cleave"]["targetattribute"] = [[HP]]
entity["Cleave"]["numericalvalue"] = 30
entity["Cleave"]["costtype"] = [[HP (%)]]
entity["Megidolaon"] = {}
entity["Megidolaon"]["numericaltype"] = [[Absolute Value]]
entity["Megidolaon"]["element"] = [[Almighty]]
entity["Megidolaon"]["cost"] = 85
entity["Megidolaon"]["desc"] = [[Major almighty damage to all foes]]
entity["Megidolaon"]["numberofhits"] = 1
--a function: conditional
entity["Megidolaon"]["hitchance"] = 95
entity["Megidolaon"]["target"] = [[All Enemy]]
entity["Megidolaon"]["passive"] = false
--a function: statuschance
entity["Megidolaon"]["name"] = [[Megidolaon]]
entity["Megidolaon"]["status"] = [[None]]
entity["Megidolaon"]["targetattribute"] = [[HP]]
entity["Megidolaon"]["numericalvalue"] = 650
entity["Megidolaon"]["costtype"] = [[SP]]
entity["Fire Amp"] = {}
entity["Fire Amp"]["numericaltype"] = [[Percentage]]
entity["Fire Amp"]["element"] = [[Fire]]
--a function: cost
entity["Fire Amp"]["desc"] = [[Greatly raises damage of all fire attacks]]
--a function: numberofhits
entity["Fire Amp"]["conditional"] = [[if attack.element IS fire]]
--a function: hitchance
entity["Fire Amp"]["target"] = [[Self]]
entity["Fire Amp"]["passive"] = true
--a function: statuschance
entity["Fire Amp"]["name"] = [[Fire Amp]]
--a function: status
entity["Fire Amp"]["targetattribute"] = [[Attack]]
entity["Fire Amp"]["numericalvalue"] = 50
--a function: costtype
entity["Power Charge"] = {}
entity["Power Charge"]["numericaltype"] = [[Percentage]]
entity["Power Charge"]["element"] = [[Support]]
entity["Power Charge"]["cost"] = 15
entity["Power Charge"]["desc"] = [[Greatly boost damage on the next physical attack]]
entity["Power Charge"]["numberofhits"] = 1
entity["Power Charge"]["conditional"] = [[END if attack is DONE]]
entity["Power Charge"]["hitchance"] = 100
entity["Power Charge"]["target"] = [[One Ally]]
entity["Power Charge"]["passive"] = false
--a function: statuschance
entity["Power Charge"]["name"] = [[Power Charge]]
entity["Power Charge"]["status"] = [[None]]
entity["Power Charge"]["targetattribute"] = [[Strength]]
entity["Power Charge"]["numericalvalue"] = 150
entity["Power Charge"]["costtype"] = [[SP]]
entity["Ice Amp"] = {}
entity["Ice Amp"]["numericaltype"] = [[Percentage]]
entity["Ice Amp"]["element"] = [[Ice]]
--a function: cost
entity["Ice Amp"]["desc"] = [[Greatly raises damage of all ice attacks]]
--a function: numberofhits
entity["Ice Amp"]["conditional"] = [[if attack.element IS ice]]
--a function: hitchance
entity["Ice Amp"]["target"] = [[Self]]
entity["Ice Amp"]["passive"] = true
--a function: statuschance
entity["Ice Amp"]["name"] = [[Ice Amp]]
--a function: status
entity["Ice Amp"]["targetattribute"] = [[Attack]]
entity["Ice Amp"]["numericalvalue"] = 50
--a function: costtype
entity["Tentarafoo"] = {}
--a function: numericaltype
entity["Tentarafoo"]["element"] = [[Status]]
entity["Tentarafoo"]["cost"] = 10
entity["Tentarafoo"]["desc"] = [[Chance to instill panic in all foes]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Tentarafoo"]["target"] = [[All Enemy]]
entity["Tentarafoo"]["passive"] = false
entity["Tentarafoo"]["statuschance"] = 25
entity["Tentarafoo"]["name"] = [[Tentarafoo]]
entity["Tentarafoo"]["status"] = [[Panic]]
--a function: targetattribute
--a function: numericalvalue
entity["Tentarafoo"]["costtype"] = [[SP]]
entity["Chaos!"] = {}
entity["Chaos!"]["numericaltype"] = [[Absolute Value]]
entity["Chaos!"]["element"] = [[Almighty]]
entity["Chaos!"]["cost"] = 99
entity["Chaos!"]["desc"] = [[I'll show you my true power!

Empties HP and SP to near-null but deals massive damage to the enemy *CHAOS ONLY*]]
entity["Chaos!"]["numberofhits"] = 5
entity["Chaos!"]["conditional"] = [[if battle.end REMOVE Chaos FROM party]]
entity["Chaos!"]["hitchance"] = 100
entity["Chaos!"]["target"] = [[All Enemy]]
entity["Chaos!"]["passive"] = false
--a function: statuschance
entity["Chaos!"]["name"] = [[Chaos!]]
--a function: status
entity["Chaos!"]["targetattribute"] = [[HP]]
entity["Chaos!"]["numericalvalue"] = 9999999
entity["Chaos!"]["costtype"] = [[HP/SP(%)]]
entity["Resist Strike"] = {}
--a function: numericaltype
entity["Resist Strike"]["element"] = [[Strike]]
--a function: cost
entity["Resist Strike"]["desc"] = [[Raise resistance against strike attacks to 'Strong']]
--a function: numberofhits
entity["Resist Strike"]["conditional"] = [[STRONG]]
--a function: hitchance
entity["Resist Strike"]["target"] = [[Self]]
entity["Resist Strike"]["passive"] = true
--a function: statuschance
entity["Resist Strike"]["name"] = [[Resist Strike]]
--a function: status
entity["Resist Strike"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Fatal End"] = {}
entity["Fatal End"]["numericaltype"] = [[Absolute Value]]
entity["Fatal End"]["element"] = [[Slash]]
entity["Fatal End"]["cost"] = 16
entity["Fatal End"]["desc"] = [[Moderate slash damage to one foe]]
entity["Fatal End"]["numberofhits"] = 1
--a function: conditional
entity["Fatal End"]["hitchance"] = 90
entity["Fatal End"]["target"] = [[One Enemy]]
entity["Fatal End"]["passive"] = false
--a function: statuschance
entity["Fatal End"]["name"] = [[Fatal End]]
entity["Fatal End"]["status"] = [[None]]
entity["Fatal End"]["targetattribute"] = [[HP]]
entity["Fatal End"]["numericalvalue"] = 225
entity["Fatal End"]["costtype"] = [[HP (%)]]
entity["Panta Rhei"] = {}
entity["Panta Rhei"]["numericaltype"] = [[Absolute Value]]
entity["Panta Rhei"]["element"] = [[Wind]]
entity["Panta Rhei"]["cost"] = 30
entity["Panta Rhei"]["desc"] = [[Huge wind damage to one foe]]
entity["Panta Rhei"]["numberofhits"] = 1
--a function: conditional
entity["Panta Rhei"]["hitchance"] = 99
entity["Panta Rhei"]["target"] = [[One Enemy]]
entity["Panta Rhei"]["passive"] = false
--a function: statuschance
entity["Panta Rhei"]["name"] = [[Panta Rhei]]
entity["Panta Rhei"]["status"] = [[None]]
entity["Panta Rhei"]["targetattribute"] = [[HP]]
entity["Panta Rhei"]["numericalvalue"] = 650
entity["Panta Rhei"]["costtype"] = [[SP]]
entity["Diarahan"] = {}
entity["Diarahan"]["numericaltype"] = [[Percentage]]
entity["Diarahan"]["element"] = [[Support]]
entity["Diarahan"]["cost"] = 20
entity["Diarahan"]["desc"] = [[Full heal for one ally]]
entity["Diarahan"]["numberofhits"] = 1
--a function: conditional
entity["Diarahan"]["hitchance"] = 100
entity["Diarahan"]["target"] = [[One Ally]]
entity["Diarahan"]["passive"] = false
--a function: statuschance
entity["Diarahan"]["name"] = [[Diarahan]]
entity["Diarahan"]["status"] = [[None]]
entity["Diarahan"]["targetattribute"] = [[HP]]
entity["Diarahan"]["numericalvalue"] = 100
entity["Diarahan"]["costtype"] = [[SP]]
entity["Spirit Drain"] = {}
entity["Spirit Drain"]["numericaltype"] = [[Absolute Value]]
entity["Spirit Drain"]["element"] = [[Almighty]]
--a function: cost
entity["Spirit Drain"]["desc"] = [[Take a small amount of SP from the enemy]]
entity["Spirit Drain"]["numberofhits"] = 1
entity["Spirit Drain"]["conditional"] = [[self.sp.add(attack.damage)]]
entity["Spirit Drain"]["hitchance"] = 100
entity["Spirit Drain"]["target"] = [[One Enemy]]
entity["Spirit Drain"]["passive"] = false
--a function: statuschance
entity["Spirit Drain"]["name"] = [[Spirit Drain]]
--a function: status
entity["Spirit Drain"]["targetattribute"] = [[SP]]
entity["Spirit Drain"]["numericalvalue"] = 20
--a function: costtype
entity["Trafuri"] = {}
--a function: numericaltype
entity["Trafuri"]["element"] = [[Support]]
entity["Trafuri"]["cost"] = 25
entity["Trafuri"]["desc"] = [[Escape from battle (some battle must be fought to the end!)]]
entity["Trafuri"]["numberofhits"] = 1
entity["Trafuri"]["conditional"] = [[if battle.boss IS NOT TRUE]]
entity["Trafuri"]["hitchance"] = 100
--a function: target
entity["Trafuri"]["passive"] = false
--a function: statuschance
entity["Trafuri"]["name"] = [[Trafuri]]
entity["Trafuri"]["status"] = [[None]]
--a function: targetattribute
--a function: numericalvalue
entity["Trafuri"]["costtype"] = [[SP]]
entity["Gatsu-ei"] = {}
entity["Gatsu-ei"]["numericaltype"] = [[Absolute Value]]
entity["Gatsu-ei"]["element"] = [[Slash]]
entity["Gatsu-ei"]["cost"] = 10
entity["Gatsu-ei"]["desc"] = [[Light slash damage to one foe. Gets more powerful as the moon wanes]]
entity["Gatsu-ei"]["numberofhits"] = 1
--a function: conditional
entity["Gatsu-ei"]["hitchance"] = 90
entity["Gatsu-ei"]["target"] = [[One Enemy]]
entity["Gatsu-ei"]["passive"] = false
--a function: statuschance
entity["Gatsu-ei"]["name"] = [[Gatsu-ei]]
entity["Gatsu-ei"]["status"] = [[None]]
entity["Gatsu-ei"]["targetattribute"] = [[HP]]
entity["Gatsu-ei"]["numericalvalue"] = 140
entity["Gatsu-ei"]["costtype"] = [[HP (%)]]
entity["Charmdi"] = {}
--a function: numericaltype
entity["Charmdi"]["element"] = [[Support]]
entity["Charmdi"]["cost"] = 5
entity["Charmdi"]["desc"] = [[Cures charm in one ally]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Charmdi"]["target"] = [[One Ally]]
entity["Charmdi"]["passive"] = false
entity["Charmdi"]["statuschance"] = 100
entity["Charmdi"]["name"] = [[Charmdi]]
entity["Charmdi"]["status"] = [[Charm]]
--a function: targetattribute
--a function: numericalvalue
entity["Charmdi"]["costtype"] = [[SP]]
entity["Recarmdra"] = {}
entity["Recarmdra"]["numericaltype"] = [[Percentage]]
entity["Recarmdra"]["element"] = [[Almighty]]
entity["Recarmdra"]["cost"] = 99
entity["Recarmdra"]["desc"] = [[Revives all allies with all HP at the cost of yours]]
entity["Recarmdra"]["numberofhits"] = 1
entity["Recarmdra"]["conditional"] = [[if friend.down THEN PASS]]
entity["Recarmdra"]["hitchance"] = 100
entity["Recarmdra"]["target"] = [[All Ally]]
entity["Recarmdra"]["passive"] = false
entity["Recarmdra"]["statuschance"] = 100
entity["Recarmdra"]["name"] = [[Recarmdra]]
entity["Recarmdra"]["status"] = [[Down]]
entity["Recarmdra"]["targetattribute"] = [[HP]]
entity["Recarmdra"]["numericalvalue"] = 100
entity["Recarmdra"]["costtype"] = [[HP (%)]]
entity["Auto-Rakukaja"] = {}
entity["Auto-Rakukaja"]["numericaltype"] = [[Percentage]]
entity["Auto-Rakukaja"]["element"] = [[Support]]
--a function: cost
entity["Auto-Rakukaja"]["desc"] = [[Start the battle with heightened defences]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Auto-Rakukaja"]["target"] = [[Self]]
entity["Auto-Rakukaja"]["passive"] = true
--a function: statuschance
entity["Auto-Rakukaja"]["name"] = [[Auto-Rakukaja]]
--a function: status
entity["Auto-Rakukaja"]["targetattribute"] = [[Defence]]
entity["Auto-Rakukaja"]["numericalvalue"] = 50
--a function: costtype
entity["Garudyne"] = {}
entity["Garudyne"]["numericaltype"] = [[Absolute Value]]
entity["Garudyne"]["element"] = [[Wind]]
entity["Garudyne"]["cost"] = 12
entity["Garudyne"]["desc"] = [[Major wind damage to one foe]]
entity["Garudyne"]["numberofhits"] = 1
--a function: conditional
entity["Garudyne"]["hitchance"] = 95
entity["Garudyne"]["target"] = [[One Enemy]]
entity["Garudyne"]["passive"] = false
--a function: statuschance
entity["Garudyne"]["name"] = [[Garudyne]]
entity["Garudyne"]["status"] = [[None]]
entity["Garudyne"]["targetattribute"] = [[HP]]
entity["Garudyne"]["numericalvalue"] = 320
entity["Garudyne"]["costtype"] = [[SP]]
entity["Weary Thrust"] = {}
entity["Weary Thrust"]["numericaltype"] = [[Absolute Value]]
entity["Weary Thrust"]["element"] = [[Strike]]
entity["Weary Thrust"]["cost"] = 13
entity["Weary Thrust"]["desc"] = [[Major strike damage to one foe]]
entity["Weary Thrust"]["numberofhits"] = 1
--a function: conditional
entity["Weary Thrust"]["hitchance"] = 99
entity["Weary Thrust"]["target"] = [[One Enemy]]
entity["Weary Thrust"]["passive"] = false
--a function: statuschance
entity["Weary Thrust"]["name"] = [[Weary Thrust]]
entity["Weary Thrust"]["status"] = [[None]]
entity["Weary Thrust"]["targetattribute"] = [[HP]]
entity["Weary Thrust"]["numericalvalue"] = 405
entity["Weary Thrust"]["costtype"] = [[HP (%)]]
entity["Kill Rush"] = {}
entity["Kill Rush"]["numericaltype"] = [[Absolute Value]]
entity["Kill Rush"]["element"] = [[Strike]]
entity["Kill Rush"]["cost"] = 10
entity["Kill Rush"]["desc"] = [[Two light strike attacks to all foes]]
entity["Kill Rush"]["numberofhits"] = 2
--a function: conditional
entity["Kill Rush"]["hitchance"] = 80
entity["Kill Rush"]["target"] = [[All Enemy]]
entity["Kill Rush"]["passive"] = false
--a function: statuschance
entity["Kill Rush"]["name"] = [[Kill Rush]]
entity["Kill Rush"]["status"] = [[None]]
entity["Kill Rush"]["targetattribute"] = [[HP]]
entity["Kill Rush"]["numericalvalue"] = 110
entity["Kill Rush"]["costtype"] = [[HP (%)]]
entity["Akasha Arts"] = {}
entity["Akasha Arts"]["numericaltype"] = [[Absolute Value]]
entity["Akasha Arts"]["element"] = [[Strike]]
entity["Akasha Arts"]["cost"] = 19
entity["Akasha Arts"]["desc"] = [[Two major strike attacks to all foes]]
entity["Akasha Arts"]["numberofhits"] = 2
--a function: conditional
entity["Akasha Arts"]["hitchance"] = 85
entity["Akasha Arts"]["target"] = [[All Enemy]]
entity["Akasha Arts"]["passive"] = false
--a function: statuschance
entity["Akasha Arts"]["name"] = [[Akasha Arts]]
entity["Akasha Arts"]["status"] = [[None]]
entity["Akasha Arts"]["targetattribute"] = [[HP]]
entity["Akasha Arts"]["numericalvalue"] = 350
entity["Akasha Arts"]["costtype"] = [[HP (%)]]
entity["Resist Pierce"] = {}
--a function: numericaltype
entity["Resist Pierce"]["element"] = [[Pierce]]
--a function: cost
entity["Resist Pierce"]["desc"] = [[Raise resistance against pierce attacks to 'Strong']]
--a function: numberofhits
entity["Resist Pierce"]["conditional"] = [[STRONG]]
--a function: hitchance
entity["Resist Pierce"]["target"] = [[Self]]
entity["Resist Pierce"]["passive"] = true
--a function: statuschance
entity["Resist Pierce"]["name"] = [[Resist Pierce]]
--a function: status
entity["Resist Pierce"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Foul Breath"] = {}
--a function: numericaltype
entity["Foul Breath"]["element"] = [[Status]]
entity["Foul Breath"]["cost"] = 15
entity["Foul Breath"]["desc"] = [[Raises chance of inflicting status ailments on everyone]]
--a function: numberofhits
entity["Foul Breath"]["conditional"] = [[FOR ALL IN status RAISE status_chance]]
--a function: hitchance
entity["Foul Breath"]["target"] = [[All]]
entity["Foul Breath"]["passive"] = false
--a function: statuschance
entity["Foul Breath"]["name"] = [[Foul Breath]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
entity["Foul Breath"]["costtype"] = [[SP]]
entity["Herculean Strike"] = {}
entity["Herculean Strike"]["numericaltype"] = [[Absolute Value]]
entity["Herculean Strike"]["element"] = [[Strike]]
entity["Herculean Strike"]["cost"] = 18
entity["Herculean Strike"]["desc"] = [[Moderate strike damage to one foe]]
entity["Herculean Strike"]["numberofhits"] = 1
--a function: conditional
entity["Herculean Strike"]["hitchance"] = 85
entity["Herculean Strike"]["target"] = [[One Enemy]]
entity["Herculean Strike"]["passive"] = false
--a function: statuschance
entity["Herculean Strike"]["name"] = [[Herculean Strike]]
entity["Herculean Strike"]["status"] = [[None]]
entity["Herculean Strike"]["targetattribute"] = [[HP]]
entity["Herculean Strike"]["numericalvalue"] = 210
entity["Herculean Strike"]["costtype"] = [[HP (%)]]
entity["Apt Pupil"] = {}
entity["Apt Pupil"]["numericaltype"] = [[Percentage]]
entity["Apt Pupil"]["element"] = [[Support]]
--a function: cost
entity["Apt Pupil"]["desc"] = [[Greatly raises chance of critical hits]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Apt Pupil"]["target"] = [[Self]]
entity["Apt Pupil"]["passive"] = true
--a function: statuschance
entity["Apt Pupil"]["name"] = [[Apt Pupil]]
--a function: status
entity["Apt Pupil"]["targetattribute"] = [[Luck]]
entity["Apt Pupil"]["numericalvalue"] = 50
--a function: costtype
entity["Fist Master"] = {}
entity["Fist Master"]["numericaltype"] = [[Percentage]]
entity["Fist Master"]["element"] = [[Support]]
--a function: cost
entity["Fist Master"]["desc"] = [[Raises damage done with your fists]]
--a function: numberofhits
entity["Fist Master"]["conditional"] = [[if self.weapon.type IS FIST]]
--a function: hitchance
entity["Fist Master"]["target"] = [[Self]]
entity["Fist Master"]["passive"] = true
--a function: statuschance
entity["Fist Master"]["name"] = [[Fist Master]]
--a function: status
entity["Fist Master"]["targetattribute"] = [[Attack]]
entity["Fist Master"]["numericalvalue"] = 100
--a function: costtype
entity["Hama"] = {}
entity["Hama"]["numericaltype"] = [[Percentage]]
entity["Hama"]["element"] = [[Light]]
entity["Hama"]["cost"] = 6
entity["Hama"]["desc"] = [[Small chance to instant-kill one foe with light damage.]]
entity["Hama"]["numberofhits"] = 1
--a function: conditional
entity["Hama"]["hitchance"] = 25
entity["Hama"]["target"] = [[One Enemy]]
entity["Hama"]["passive"] = false
--a function: statuschance
entity["Hama"]["name"] = [[Hama]]
entity["Hama"]["status"] = [[None]]
entity["Hama"]["targetattribute"] = [[HP]]
entity["Hama"]["numericalvalue"] = 100
entity["Hama"]["costtype"] = [[SP]]
entity["Morning Star"] = {}
entity["Morning Star"]["numericaltype"] = [[Absolute Value]]
entity["Morning Star"]["element"] = [[Almighty]]
entity["Morning Star"]["cost"] = 80
entity["Morning Star"]["desc"] = [[Enormous almighty damage to all foes]]
entity["Morning Star"]["numberofhits"] = 1
--a function: conditional
entity["Morning Star"]["hitchance"] = 95
entity["Morning Star"]["target"] = [[All Enemy]]
entity["Morning Star"]["passive"] = false
--a function: statuschance
entity["Morning Star"]["name"] = [[Morning Star]]
entity["Morning Star"]["status"] = [[None]]
entity["Morning Star"]["targetattribute"] = [[HP]]
entity["Morning Star"]["numericalvalue"] = 850
entity["Morning Star"]["costtype"] = [[SP]]
entity["Mediarama"] = {}
entity["Mediarama"]["numericaltype"] = [[Absolute Value]]
entity["Mediarama"]["element"] = [[Support]]
entity["Mediarama"]["cost"] = 16
entity["Mediarama"]["desc"] = [[Moderate heal for all allies]]
entity["Mediarama"]["numberofhits"] = 1
--a function: conditional
entity["Mediarama"]["hitchance"] = 100
entity["Mediarama"]["target"] = [[All Ally]]
entity["Mediarama"]["passive"] = false
--a function: statuschance
entity["Mediarama"]["name"] = [[Mediarama]]
entity["Mediarama"]["status"] = [[None]]
entity["Mediarama"]["targetattribute"] = [[HP]]
entity["Mediarama"]["numericalvalue"] = 125
entity["Mediarama"]["costtype"] = [[SP]]
entity["Enduring Soul"] = {}
--a function: numericaltype
entity["Enduring Soul"]["element"] = [[Support]]
--a function: cost
entity["Enduring Soul"]["desc"] = [[Survive a lethal blow and heal all HP once per battle]]
--a function: numberofhits
entity["Enduring Soul"]["conditional"] = [[if attack.damage IS LETHAL AND spell.used IS FALSE THEN self.hp=self.HP]]
--a function: hitchance
entity["Enduring Soul"]["target"] = [[Self]]
entity["Enduring Soul"]["passive"] = true
--a function: statuschance
entity["Enduring Soul"]["name"] = [[Enduring Soul]]
--a function: status
entity["Enduring Soul"]["targetattribute"] = [[HP]]
--a function: numericalvalue
--a function: costtype
entity["Maziodyne"] = {}
entity["Maziodyne"]["numericaltype"] = [[Absolute Value]]
entity["Maziodyne"]["element"] = [[Elec]]
entity["Maziodyne"]["cost"] = 32
entity["Maziodyne"]["desc"] = [[Major electric damage to all foes]]
entity["Maziodyne"]["numberofhits"] = 1
--a function: conditional
entity["Maziodyne"]["hitchance"] = 90
entity["Maziodyne"]["target"] = [[All Enemy]]
entity["Maziodyne"]["passive"] = false
entity["Maziodyne"]["statuschance"] = 10
entity["Maziodyne"]["name"] = [[Maziodyne]]
entity["Maziodyne"]["status"] = [[Shock]]
entity["Maziodyne"]["targetattribute"] = [[HP]]
entity["Maziodyne"]["numericalvalue"] = 320
entity["Maziodyne"]["costtype"] = [[SP]]
entity["Null Panic"] = {}
--a function: numericaltype
entity["Null Panic"]["element"] = [[Status]]
--a function: cost
entity["Null Panic"]["desc"] = [[Prevents the status 'Panic']]
--a function: numberofhits
entity["Null Panic"]["conditional"] = [[STATUS]]
--a function: hitchance
entity["Null Panic"]["target"] = [[Self]]
entity["Null Panic"]["passive"] = true
--a function: statuschance
entity["Null Panic"]["name"] = [[Null Panic]]
entity["Null Panic"]["status"] = [[Panic]]
entity["Null Panic"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Single Shot"] = {}
entity["Single Shot"]["numericaltype"] = [[Absolute Value]]
entity["Single Shot"]["element"] = [[Pierce]]
entity["Single Shot"]["cost"] = 8
entity["Single Shot"]["desc"] = [[Small pierce damage to one foe]]
entity["Single Shot"]["numberofhits"] = 1
--a function: conditional
entity["Single Shot"]["hitchance"] = 95
entity["Single Shot"]["target"] = [[One Enemy]]
entity["Single Shot"]["passive"] = false
--a function: statuschance
entity["Single Shot"]["name"] = [[Single Shot]]
entity["Single Shot"]["status"] = [[None]]
entity["Single Shot"]["targetattribute"] = [[HP]]
entity["Single Shot"]["numericalvalue"] = 28
entity["Single Shot"]["costtype"] = [[HP (%)]]
entity["Arrow Rain"] = {}
entity["Arrow Rain"]["numericaltype"] = [[Absolute Value]]
entity["Arrow Rain"]["element"] = [[Pierce]]
entity["Arrow Rain"]["cost"] = 19
entity["Arrow Rain"]["desc"] = [[Two moderate pierce attacks to all foes]]
entity["Arrow Rain"]["numberofhits"] = 2
--a function: conditional
entity["Arrow Rain"]["hitchance"] = 90
entity["Arrow Rain"]["target"] = [[All Enemy]]
entity["Arrow Rain"]["passive"] = false
--a function: statuschance
entity["Arrow Rain"]["name"] = [[Arrow Rain]]
entity["Arrow Rain"]["status"] = [[None]]
entity["Arrow Rain"]["targetattribute"] = [[HP]]
entity["Arrow Rain"]["numericalvalue"] = 230
entity["Arrow Rain"]["costtype"] = [[HP (%)]]
entity["Salvation"] = {}
entity["Salvation"]["numericaltype"] = [[Percentage]]
entity["Salvation"]["element"] = [[Support]]
entity["Salvation"]["cost"] = 60
entity["Salvation"]["desc"] = [[Full heal for all party members and cures all status ailments]]
entity["Salvation"]["numberofhits"] = 1
entity["Salvation"]["conditional"] = [[spell.amrita.effect()]]
entity["Salvation"]["hitchance"] = 100
entity["Salvation"]["target"] = [[All Ally]]
entity["Salvation"]["passive"] = false
--a function: statuschance
entity["Salvation"]["name"] = [[Salvation]]
--a function: status
entity["Salvation"]["targetattribute"] = [[HP]]
entity["Salvation"]["numericalvalue"] = 100
entity["Salvation"]["costtype"] = [[SP]]
entity["Maralagidyne"] = {}
entity["Maralagidyne"]["numericaltype"] = [[Absolute Value]]
entity["Maralagidyne"]["element"] = [[Fire]]
entity["Maralagidyne"]["cost"] = 32
entity["Maralagidyne"]["desc"] = [[Huge fire damage to all foes]]
entity["Maralagidyne"]["numberofhits"] = 1
--a function: conditional
entity["Maralagidyne"]["hitchance"] = 95
entity["Maralagidyne"]["target"] = [[All Enemy]]
entity["Maralagidyne"]["passive"] = false
--a function: statuschance
entity["Maralagidyne"]["name"] = [[Maralagidyne]]
entity["Maralagidyne"]["status"] = [[None]]
entity["Maralagidyne"]["targetattribute"] = [[HP]]
entity["Maralagidyne"]["numericalvalue"] = 650
entity["Maralagidyne"]["costtype"] = [[SP]]
entity["Rage Boost"] = {}
--a function: numericaltype
entity["Rage Boost"]["element"] = [[Status]]
--a function: cost
entity["Rage Boost"]["desc"] = [[Raises chance to instill rage in the enemy]]
--a function: numberofhits
entity["Rage Boost"]["conditional"] = [[if attack.status IS rage THEN BOOST chance]]
--a function: hitchance
entity["Rage Boost"]["target"] = [[Self]]
entity["Rage Boost"]["passive"] = true
entity["Rage Boost"]["statuschance"] = 25
entity["Rage Boost"]["name"] = [[Rage Boost]]
entity["Rage Boost"]["status"] = [[Rage]]
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Endure"] = {}
--a function: numericaltype
entity["Endure"]["element"] = [[Support]]
--a function: cost
entity["Endure"]["desc"] = [[Survive a lethal blow with 1 HP once per battle]]
--a function: numberofhits
entity["Endure"]["conditional"] = [[if attack.damage IS LETHAL AND spell.used IS FALSE THEN self.hp=1]]
--a function: hitchance
entity["Endure"]["target"] = [[Self]]
entity["Endure"]["passive"] = true
--a function: statuschance
entity["Endure"]["name"] = [[Endure]]
--a function: status
entity["Endure"]["targetattribute"] = [[HP]]
--a function: numericalvalue
--a function: costtype
entity["Revolution"] = {}
entity["Revolution"]["numericaltype"] = [[Percentage]]
entity["Revolution"]["element"] = [[Support]]
entity["Revolution"]["cost"] = 5
entity["Revolution"]["desc"] = [[Greatly raises everyone's critical chances]]
entity["Revolution"]["numberofhits"] = 1
--a function: conditional
entity["Revolution"]["hitchance"] = 100
entity["Revolution"]["target"] = [[All]]
entity["Revolution"]["passive"] = false
--a function: statuschance
entity["Revolution"]["name"] = [[Revolution]]
entity["Revolution"]["status"] = [[None]]
entity["Revolution"]["targetattribute"] = [[Luck]]
entity["Revolution"]["numericalvalue"] = 100
entity["Revolution"]["costtype"] = [[SP]]
entity["Regenerate 1"] = {}
entity["Regenerate 1"]["numericaltype"] = [[Percentage]]
entity["Regenerate 1"]["element"] = [[Support]]
--a function: cost
entity["Regenerate 1"]["desc"] = [[Heals a small amount of HP after each turn]]
--a function: numberofhits
entity["Regenerate 1"]["conditional"] = [[if battle.turn.end]]
--a function: hitchance
entity["Regenerate 1"]["target"] = [[Self]]
entity["Regenerate 1"]["passive"] = true
--a function: statuschance
entity["Regenerate 1"]["name"] = [[Regenerate 1]]
--a function: status
entity["Regenerate 1"]["targetattribute"] = [[HP]]
entity["Regenerate 1"]["numericalvalue"] = 5
--a function: costtype
entity["Counter"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Counter"]["desc"] = [[Small chance to counter physical attacks]]
--a function: numberofhits
entity["Counter"]["conditional"] = [[if attack.element IN physical]]
entity["Counter"]["hitchance"] = 15
entity["Counter"]["target"] = [[Self]]
entity["Counter"]["passive"] = true
--a function: statuschance
entity["Counter"]["name"] = [[Counter]]
--a function: status
entity["Counter"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Posumudi"] = {}
--a function: numericaltype
entity["Posumudi"]["element"] = [[Support]]
entity["Posumudi"]["cost"] = 5
entity["Posumudi"]["desc"] = [[Cures one ally of poison]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Posumudi"]["target"] = [[One Ally]]
entity["Posumudi"]["passive"] = false
entity["Posumudi"]["statuschance"] = 100
entity["Posumudi"]["name"] = [[Posumudi]]
entity["Posumudi"]["status"] = [[Poison]]
--a function: targetattribute
--a function: numericalvalue
entity["Posumudi"]["costtype"] = [[SP]]
entity["Dia"] = {}
entity["Dia"]["numericaltype"] = [[Absolute Value]]
entity["Dia"]["element"] = [[Support]]
entity["Dia"]["cost"] = 4
entity["Dia"]["desc"] = [[Small heal on one ally]]
entity["Dia"]["numberofhits"] = 1
--a function: conditional
entity["Dia"]["hitchance"] = 100
entity["Dia"]["target"] = [[One Ally]]
entity["Dia"]["passive"] = false
--a function: statuschance
entity["Dia"]["name"] = [[Dia]]
entity["Dia"]["status"] = [[None]]
entity["Dia"]["targetattribute"] = [[HP]]
entity["Dia"]["numericalvalue"] = 60
entity["Dia"]["costtype"] = [[SP]]
entity["Swift Strike"] = {}
entity["Swift Strike"]["numericaltype"] = [[Absolute Value]]
entity["Swift Strike"]["element"] = [[Strike]]
entity["Swift Strike"]["cost"] = 15
entity["Swift Strike"]["desc"] = [[Three light strike attacks to all foes]]
entity["Swift Strike"]["numberofhits"] = 3
--a function: conditional
entity["Swift Strike"]["hitchance"] = 80
entity["Swift Strike"]["target"] = [[All Enemy]]
entity["Swift Strike"]["passive"] = false
--a function: statuschance
entity["Swift Strike"]["name"] = [[Swift Strike]]
entity["Swift Strike"]["status"] = [[None]]
entity["Swift Strike"]["targetattribute"] = [[HP]]
entity["Swift Strike"]["numericalvalue"] = 95
entity["Swift Strike"]["costtype"] = [[HP (%)]]
entity["Regenerate 3"] = {}
entity["Regenerate 3"]["numericaltype"] = [[Percentage]]
entity["Regenerate 3"]["element"] = [[Support]]
--a function: cost
entity["Regenerate 3"]["desc"] = [[Heals some HP after each turn]]
--a function: numberofhits
entity["Regenerate 3"]["conditional"] = [[if battle.turn.end]]
--a function: hitchance
entity["Regenerate 3"]["target"] = [[Self]]
entity["Regenerate 3"]["passive"] = true
--a function: statuschance
entity["Regenerate 3"]["name"] = [[Regenerate 3]]
--a function: status
entity["Regenerate 3"]["targetattribute"] = [[HP]]
entity["Regenerate 3"]["numericalvalue"] = 15
--a function: costtype
entity["Null Charm"] = {}
--a function: numericaltype
entity["Null Charm"]["element"] = [[Status]]
--a function: cost
entity["Null Charm"]["desc"] = [[Prevents the status 'Charm']]
--a function: numberofhits
entity["Null Charm"]["conditional"] = [[STATUS]]
--a function: hitchance
entity["Null Charm"]["target"] = [[Self]]
entity["Null Charm"]["passive"] = true
--a function: statuschance
entity["Null Charm"]["name"] = [[Null Charm]]
entity["Null Charm"]["status"] = [[Charm]]
entity["Null Charm"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Auto-Matarunda"] = {}
entity["Auto-Matarunda"]["numericaltype"] = [[Percentage]]
entity["Auto-Matarunda"]["element"] = [[Support]]
--a function: cost
entity["Auto-Matarunda"]["desc"] = [[All foes enter battle with lowered attack power]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Auto-Matarunda"]["target"] = [[All Enemy]]
entity["Auto-Matarunda"]["passive"] = true
--a function: statuschance
entity["Auto-Matarunda"]["name"] = [[Auto-Matarunda]]
--a function: status
entity["Auto-Matarunda"]["targetattribute"] = [[Attack]]
entity["Auto-Matarunda"]["numericalvalue"] = -50
--a function: costtype
entity["Sprint 06"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 06"]["desc"] = [[Modeling tools for:

- quick draw
- squash
- stretch
- quick render to low-res and publish

Asset management tools:

- hooks for Tank
- shotgun publish framework]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 06"]["passive"] = false
--a function: statuschance
entity["Sprint 06"]["name"] = [[Sprint 06]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Resist Fire"] = {}
--a function: numericaltype
entity["Resist Fire"]["element"] = [[Fire]]
--a function: cost
entity["Resist Fire"]["desc"] = [[Raise resistance against fire attacks to 'Strong']]
--a function: numberofhits
entity["Resist Fire"]["conditional"] = [[STRONG]]
--a function: hitchance
entity["Resist Fire"]["target"] = [[Self]]
entity["Resist Fire"]["passive"] = true
--a function: statuschance
entity["Resist Fire"]["name"] = [[Resist Fire]]
--a function: status
entity["Resist Fire"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Megido"] = {}
entity["Megido"]["numericaltype"] = [[Absolute Value]]
entity["Megido"]["element"] = [[Almighty]]
entity["Megido"]["cost"] = 45
entity["Megido"]["desc"] = [[Light almighty damage to all foes]]
entity["Megido"]["numberofhits"] = 1
--a function: conditional
entity["Megido"]["hitchance"] = 95
entity["Megido"]["target"] = [[All Enemy]]
entity["Megido"]["passive"] = false
--a function: statuschance
entity["Megido"]["name"] = [[Megido]]
entity["Megido"]["status"] = [[None]]
entity["Megido"]["targetattribute"] = [[HP]]
entity["Megido"]["numericalvalue"] = 180
entity["Megido"]["costtype"] = [[SP]]
entity["Sprint 17"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 17"]["desc"] = [[Develop the weapons mods and the hyper real particle behaviour algorithms]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 17"]["passive"] = false
--a function: statuschance
entity["Sprint 17"]["name"] = [[Sprint 17]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Thunder Reign"] = {}
entity["Thunder Reign"]["numericaltype"] = [[Absolute Value]]
entity["Thunder Reign"]["element"] = [[Elec]]
entity["Thunder Reign"]["cost"] = 32
entity["Thunder Reign"]["desc"] = [[Huge electric damage to one foe]]
entity["Thunder Reign"]["numberofhits"] = 1
--a function: conditional
entity["Thunder Reign"]["hitchance"] = 99
entity["Thunder Reign"]["target"] = [[One Enemy]]
entity["Thunder Reign"]["passive"] = false
entity["Thunder Reign"]["statuschance"] = 100
entity["Thunder Reign"]["name"] = [[Thunder Reign]]
entity["Thunder Reign"]["status"] = [[Shock]]
entity["Thunder Reign"]["targetattribute"] = [[HP]]
entity["Thunder Reign"]["numericalvalue"] = 650
entity["Thunder Reign"]["costtype"] = [[SP]]
entity["Mudo"] = {}
entity["Mudo"]["numericaltype"] = [[Percentage]]
entity["Mudo"]["element"] = [[Dark]]
entity["Mudo"]["cost"] = 6
entity["Mudo"]["desc"] = [[Small chance to instant-kill one foe with darkness damage]]
entity["Mudo"]["numberofhits"] = 1
--a function: conditional
entity["Mudo"]["hitchance"] = 25
entity["Mudo"]["target"] = [[One Enemy]]
entity["Mudo"]["passive"] = false
--a function: statuschance
entity["Mudo"]["name"] = [[Mudo]]
entity["Mudo"]["status"] = [[None]]
entity["Mudo"]["targetattribute"] = [[HP]]
entity["Mudo"]["numericalvalue"] = 100
entity["Mudo"]["costtype"] = [[SP]]
entity["Sexy Dance"] = {}
--a function: numericaltype
entity["Sexy Dance"]["element"] = [[Status]]
entity["Sexy Dance"]["cost"] = 10
entity["Sexy Dance"]["desc"] = [[Chance to charm all foes]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Sexy Dance"]["target"] = [[All Enemy]]
entity["Sexy Dance"]["passive"] = false
entity["Sexy Dance"]["statuschance"] = 25
entity["Sexy Dance"]["name"] = [[Sexy Dance]]
entity["Sexy Dance"]["status"] = [[Charm]]
--a function: targetattribute
--a function: numericalvalue
entity["Sexy Dance"]["costtype"] = [[SP]]
entity["Pralaya"] = {}
entity["Pralaya"]["numericaltype"] = [[Absolute Value]]
entity["Pralaya"]["element"] = [[Pierce]]
entity["Pralaya"]["cost"] = 18
entity["Pralaya"]["desc"] = [[Huge pierce damage to all foes]]
entity["Pralaya"]["numberofhits"] = 1
--a function: conditional
entity["Pralaya"]["hitchance"] = 95
entity["Pralaya"]["target"] = [[All Enemy]]
entity["Pralaya"]["passive"] = false
--a function: statuschance
entity["Pralaya"]["name"] = [[Pralaya]]
entity["Pralaya"]["status"] = [[None]]
entity["Pralaya"]["targetattribute"] = [[HP]]
entity["Pralaya"]["numericalvalue"] = 600
entity["Pralaya"]["costtype"] = [[HP (%)]]
entity["Sharp Student"] = {}
entity["Sharp Student"]["numericaltype"] = [[Percentage]]
entity["Sharp Student"]["element"] = [[Support]]
--a function: cost
entity["Sharp Student"]["desc"] = [[Raises chance of critical hits]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Sharp Student"]["target"] = [[Self]]
entity["Sharp Student"]["passive"] = true
--a function: statuschance
entity["Sharp Student"]["name"] = [[Sharp Student]]
--a function: status
entity["Sharp Student"]["targetattribute"] = [[Luck]]
entity["Sharp Student"]["numericalvalue"] = 25
--a function: costtype
entity["Raging Tiger"] = {}
entity["Raging Tiger"]["numericaltype"] = [[Percentage]]
entity["Raging Tiger"]["element"] = [[Support]]
--a function: cost
entity["Raging Tiger"]["desc"] = [[Raises critical chance]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Raging Tiger"]["target"] = [[Self]]
entity["Raging Tiger"]["passive"] = true
--a function: statuschance
entity["Raging Tiger"]["name"] = [[Raging Tiger]]
--a function: status
entity["Raging Tiger"]["targetattribute"] = [[Luck]]
entity["Raging Tiger"]["numericalvalue"] = 100
--a function: costtype
entity["Auto-Sukukaja"] = {}
entity["Auto-Sukukaja"]["numericaltype"] = [[Percentage]]
entity["Auto-Sukukaja"]["element"] = [[Support]]
--a function: cost
entity["Auto-Sukukaja"]["desc"] = [[Start the battle with heightened Hit/Evasion]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Auto-Sukukaja"]["target"] = [[Self]]
entity["Auto-Sukukaja"]["passive"] = true
--a function: statuschance
entity["Auto-Sukukaja"]["name"] = [[Auto-Sukukaja]]
--a function: status
entity["Auto-Sukukaja"]["targetattribute"] = [[Agility]]
entity["Auto-Sukukaja"]["numericalvalue"] = 50
--a function: costtype
entity["Drain Wind"] = {}
--a function: numericaltype
entity["Drain Wind"]["element"] = [[Wind]]
--a function: cost
entity["Drain Wind"]["desc"] = [[Raise resistance against wind attacks to 'Drain']]
--a function: numberofhits
entity["Drain Wind"]["conditional"] = [[DRAIN]]
--a function: hitchance
entity["Drain Wind"]["target"] = [[Self]]
entity["Drain Wind"]["passive"] = true
--a function: statuschance
entity["Drain Wind"]["name"] = [[Drain Wind]]
--a function: status
entity["Drain Wind"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Myriad Arrows"] = {}
entity["Myriad Arrows"]["numericaltype"] = [[Absolute Value]]
entity["Myriad Arrows"]["element"] = [[Pierce]]
entity["Myriad Arrows"]["cost"] = 24
entity["Myriad Arrows"]["desc"] = [[Three major pierce attacks to all foes with chance to cause fear]]
entity["Myriad Arrows"]["numberofhits"] = 3
--a function: conditional
entity["Myriad Arrows"]["hitchance"] = 90
entity["Myriad Arrows"]["target"] = [[All Enemy]]
entity["Myriad Arrows"]["passive"] = false
entity["Myriad Arrows"]["statuschance"] = 10
entity["Myriad Arrows"]["name"] = [[Myriad Arrows]]
entity["Myriad Arrows"]["status"] = [[Fear]]
entity["Myriad Arrows"]["targetattribute"] = [[HP]]
entity["Myriad Arrows"]["numericalvalue"] = 320
entity["Myriad Arrows"]["costtype"] = [[HP (%)]]
entity["Maragion"] = {}
entity["Maragion"]["numericaltype"] = [[Absolute Value]]
entity["Maragion"]["element"] = [[Fire]]
entity["Maragion"]["cost"] = 12
entity["Maragion"]["desc"] = [[Moderate fire damage to all foes]]
entity["Maragion"]["numberofhits"] = 1
--a function: conditional
entity["Maragion"]["hitchance"] = 90
entity["Maragion"]["target"] = [[All Enemy]]
entity["Maragion"]["passive"] = false
--a function: statuschance
entity["Maragion"]["name"] = [[Maragion]]
entity["Maragion"]["status"] = [[None]]
entity["Maragion"]["targetattribute"] = [[HP]]
entity["Maragion"]["numericalvalue"] = 100
entity["Maragion"]["costtype"] = [[SP]]
entity["Stagnant Air"] = {}
--a function: numericaltype
entity["Stagnant Air"]["element"] = [[Status]]
entity["Stagnant Air"]["cost"] = 15
entity["Stagnant Air"]["desc"] = [[Raises chance to inflict statuses on the enemy]]
--a function: numberofhits
entity["Stagnant Air"]["conditional"] = [[if attack.status THEN BOOST chance]]
--a function: hitchance
entity["Stagnant Air"]["target"] = [[All]]
entity["Stagnant Air"]["passive"] = false
entity["Stagnant Air"]["statuschance"] = 100
entity["Stagnant Air"]["name"] = [[Stagnant Air]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
entity["Stagnant Air"]["costtype"] = [[SP]]
entity["Growth 2"] = {}
entity["Growth 2"]["numericaltype"] = [[Percentage]]
entity["Growth 2"]["element"] = [[Support]]
--a function: cost
entity["Growth 2"]["desc"] = [[Gain a moderate amount of extra experience at the end of each battle]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Growth 2"]["target"] = [[Self]]
entity["Growth 2"]["passive"] = true
--a function: statuschance
entity["Growth 2"]["name"] = [[Growth 2]]
--a function: status
entity["Growth 2"]["targetattribute"] = [[EXP]]
entity["Growth 2"]["numericalvalue"] = 50
--a function: costtype
entity["Zan-ei"] = {}
entity["Zan-ei"]["numericaltype"] = [[Absolute Value]]
entity["Zan-ei"]["element"] = [[Slash]]
entity["Zan-ei"]["cost"] = 10
entity["Zan-ei"]["desc"] = [[Light slash damage to one foe. Gets more powerful as the moon waxes]]
entity["Zan-ei"]["numberofhits"] = 1
--a function: conditional
entity["Zan-ei"]["hitchance"] = 80
entity["Zan-ei"]["target"] = [[One Enemy]]
entity["Zan-ei"]["passive"] = false
--a function: statuschance
entity["Zan-ei"]["name"] = [[Zan-ei]]
entity["Zan-ei"]["status"] = [[None]]
entity["Zan-ei"]["targetattribute"] = [[HP]]
entity["Zan-ei"]["numericalvalue"] = 120
entity["Zan-ei"]["costtype"] = [[HP (%)]]
entity["Distress Boost"] = {}
--a function: numericaltype
entity["Distress Boost"]["element"] = [[Status]]
--a function: cost
entity["Distress Boost"]["desc"] = [[Raises chance to distress the enemy]]
--a function: numberofhits
entity["Distress Boost"]["conditional"] = [[if attack.status IS distress THEN BOOST chance]]
--a function: hitchance
entity["Distress Boost"]["target"] = [[Self]]
entity["Distress Boost"]["passive"] = true
entity["Distress Boost"]["statuschance"] = 25
entity["Distress Boost"]["name"] = [[Distress Boost]]
entity["Distress Boost"]["status"] = [[Distress]]
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Mahama"] = {}
entity["Mahama"]["numericaltype"] = [[Percentage]]
entity["Mahama"]["element"] = [[Light]]
entity["Mahama"]["cost"] = 12
entity["Mahama"]["desc"] = [[Small chance to instant-kill all foes with light damage]]
entity["Mahama"]["numberofhits"] = 1
--a function: conditional
entity["Mahama"]["hitchance"] = 20
entity["Mahama"]["target"] = [[All Enemy]]
entity["Mahama"]["passive"] = false
--a function: statuschance
entity["Mahama"]["name"] = [[Mahama]]
entity["Mahama"]["status"] = [[None]]
entity["Mahama"]["targetattribute"] = [[HP]]
entity["Mahama"]["numericalvalue"] = 100
entity["Mahama"]["costtype"] = [[SP]]
entity["Null Fear"] = {}
--a function: numericaltype
entity["Null Fear"]["element"] = [[Status]]
--a function: cost
entity["Null Fear"]["desc"] = [[Prevents the status 'Fear']]
--a function: numberofhits
entity["Null Fear"]["conditional"] = [[STATUS]]
--a function: hitchance
entity["Null Fear"]["target"] = [[Self]]
entity["Null Fear"]["passive"] = true
--a function: statuschance
entity["Null Fear"]["name"] = [[Null Fear]]
entity["Null Fear"]["status"] = [[Fear]]
entity["Null Fear"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Null Rage"] = {}
--a function: numericaltype
entity["Null Rage"]["element"] = [[Status]]
--a function: cost
entity["Null Rage"]["desc"] = [[Prevents the status 'Rage']]
--a function: numberofhits
entity["Null Rage"]["conditional"] = [[STATUS]]
--a function: hitchance
entity["Null Rage"]["target"] = [[Self]]
entity["Null Rage"]["passive"] = true
--a function: statuschance
entity["Null Rage"]["name"] = [[Null Rage]]
entity["Null Rage"]["status"] = [[Rage]]
entity["Null Rage"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Mamudoon"] = {}
entity["Mamudoon"]["numericaltype"] = [[Percentage]]
entity["Mamudoon"]["element"] = [[Dark]]
entity["Mamudoon"]["cost"] = 24
entity["Mamudoon"]["desc"] = [[Moderate chance to instant-kill all foes with darkness damage]]
entity["Mamudoon"]["numberofhits"] = 1
--a function: conditional
entity["Mamudoon"]["hitchance"] = 40
entity["Mamudoon"]["target"] = [[All Enemy]]
entity["Mamudoon"]["passive"] = false
--a function: statuschance
entity["Mamudoon"]["name"] = [[Mamudoon]]
entity["Mamudoon"]["status"] = [[None]]
entity["Mamudoon"]["targetattribute"] = [[HP]]
entity["Mamudoon"]["numericalvalue"] = 100
entity["Mamudoon"]["costtype"] = [[SP]]
entity["Fire Boost"] = {}
entity["Fire Boost"]["numericaltype"] = [[Percentage]]
entity["Fire Boost"]["element"] = [[Fire]]
--a function: cost
entity["Fire Boost"]["desc"] = [[Raises damage of all fire attacks]]
--a function: numberofhits
entity["Fire Boost"]["conditional"] = [[if attack.element IS fire]]
--a function: hitchance
entity["Fire Boost"]["target"] = [[Self]]
entity["Fire Boost"]["passive"] = true
--a function: statuschance
entity["Fire Boost"]["name"] = [[Fire Boost]]
--a function: status
entity["Fire Boost"]["targetattribute"] = [[Attack]]
entity["Fire Boost"]["numericalvalue"] = 25
--a function: costtype
entity["Samarecarm"] = {}
entity["Samarecarm"]["numericaltype"] = [[Percentage]]
entity["Samarecarm"]["element"] = [[Support]]
entity["Samarecarm"]["cost"] = 40
entity["Samarecarm"]["desc"] = [[Revives one ally with all their HP]]
entity["Samarecarm"]["numberofhits"] = 1
entity["Samarecarm"]["conditional"] = [[if ally.down NOT PASS]]
entity["Samarecarm"]["hitchance"] = 100
entity["Samarecarm"]["target"] = [[One Ally]]
entity["Samarecarm"]["passive"] = false
entity["Samarecarm"]["statuschance"] = 100
entity["Samarecarm"]["name"] = [[Samarecarm]]
entity["Samarecarm"]["status"] = [[Down]]
entity["Samarecarm"]["targetattribute"] = [[HP]]
entity["Samarecarm"]["numericalvalue"] = 100
entity["Samarecarm"]["costtype"] = [[SP]]
entity["Elec Boost"] = {}
entity["Elec Boost"]["numericaltype"] = [[Percentage]]
entity["Elec Boost"]["element"] = [[Elec]]
--a function: cost
entity["Elec Boost"]["desc"] = [[Raises damage of all electric attacks]]
--a function: numberofhits
entity["Elec Boost"]["conditional"] = [[if attack.element IS elec]]
--a function: hitchance
entity["Elec Boost"]["target"] = [[Self]]
entity["Elec Boost"]["passive"] = true
--a function: statuschance
entity["Elec Boost"]["name"] = [[Elec Boost]]
--a function: status
entity["Elec Boost"]["targetattribute"] = [[Attack]]
entity["Elec Boost"]["numericalvalue"] = 25
--a function: costtype
entity["Invigorate 2"] = {}
entity["Invigorate 2"]["numericaltype"] = [[Percentage]]
entity["Invigorate 2"]["element"] = [[Support]]
--a function: cost
entity["Invigorate 2"]["desc"] = [[Heals a bit of SP after each turn]]
--a function: numberofhits
entity["Invigorate 2"]["conditional"] = [[if battle.turn.end]]
--a function: hitchance
entity["Invigorate 2"]["target"] = [[Self]]
entity["Invigorate 2"]["passive"] = true
--a function: statuschance
entity["Invigorate 2"]["name"] = [[Invigorate 2]]
--a function: status
entity["Invigorate 2"]["targetattribute"] = [[SP]]
entity["Invigorate 2"]["numericalvalue"] = 10
--a function: costtype
entity["Wind Break"] = {}
--a function: numericaltype
entity["Wind Break"]["element"] = [[Wind]]
entity["Wind Break"]["cost"] = 40
entity["Wind Break"]["desc"] = [[Reduces wind resistance of one foe to 'Normal']]
entity["Wind Break"]["numberofhits"] = 1
entity["Wind Break"]["conditional"] = [[NORMAL]]
entity["Wind Break"]["hitchance"] = 100
entity["Wind Break"]["target"] = [[One Enemy]]
entity["Wind Break"]["passive"] = false
--a function: statuschance
entity["Wind Break"]["name"] = [[Wind Break]]
entity["Wind Break"]["status"] = [[None]]
entity["Wind Break"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
entity["Wind Break"]["costtype"] = [[SP]]
entity["Dodge Wind"] = {}
--a function: numericaltype
entity["Dodge Wind"]["element"] = [[Wind]]
--a function: cost
entity["Dodge Wind"]["desc"] = [[Improves evasion against wind attacks]]
--a function: numberofhits
entity["Dodge Wind"]["conditional"] = [[DODGE]]
--a function: hitchance
entity["Dodge Wind"]["target"] = [[Self]]
entity["Dodge Wind"]["passive"] = true
--a function: statuschance
entity["Dodge Wind"]["name"] = [[Dodge Wind]]
--a function: status
entity["Dodge Wind"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Cool Breeze"] = {}
entity["Cool Breeze"]["numericaltype"] = [[Percentage]]
entity["Cool Breeze"]["element"] = [[Support]]
--a function: cost
entity["Cool Breeze"]["desc"] = [[Heals a small amount of HP and SP after each battle]]
--a function: numberofhits
entity["Cool Breeze"]["conditional"] = [[if battle.end]]
--a function: hitchance
entity["Cool Breeze"]["target"] = [[Self]]
entity["Cool Breeze"]["passive"] = true
--a function: statuschance
entity["Cool Breeze"]["name"] = [[Cool Breeze]]
--a function: status
entity["Cool Breeze"]["targetattribute"] = [[HP/SP]]
entity["Cool Breeze"]["numericalvalue"] = 8
--a function: costtype
entity["Elec Amp"] = {}
entity["Elec Amp"]["numericaltype"] = [[Percentage]]
entity["Elec Amp"]["element"] = [[Elec]]
--a function: cost
entity["Elec Amp"]["desc"] = [[Greatly raises damage of all electric attacks]]
--a function: numberofhits
entity["Elec Amp"]["conditional"] = [[if attack.element IS elec]]
--a function: hitchance
entity["Elec Amp"]["target"] = [[Self]]
entity["Elec Amp"]["passive"] = true
--a function: statuschance
entity["Elec Amp"]["name"] = [[Elec Amp]]
--a function: status
entity["Elec Amp"]["targetattribute"] = [[Attack]]
entity["Elec Amp"]["numericalvalue"] = 50
--a function: costtype
entity["Bow Master"] = {}
entity["Bow Master"]["numericaltype"] = [[Percentage]]
entity["Bow Master"]["element"] = [[Support]]
--a function: cost
entity["Bow Master"]["desc"] = [[Raises damage done with bows]]
--a function: numberofhits
entity["Bow Master"]["conditional"] = [[if self.weapon.type IS BOW]]
--a function: hitchance
entity["Bow Master"]["target"] = [[Self]]
entity["Bow Master"]["passive"] = true
--a function: statuschance
entity["Bow Master"]["name"] = [[Bow Master]]
--a function: status
entity["Bow Master"]["targetattribute"] = [[Attack]]
entity["Bow Master"]["numericalvalue"] = 100
--a function: costtype
entity["Counterstrike"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Counterstrike"]["desc"] = [[Moderate chance to counter physical attacks]]
--a function: numberofhits
entity["Counterstrike"]["conditional"] = [[if attack.element IN physical]]
entity["Counterstrike"]["hitchance"] = 30
entity["Counterstrike"]["target"] = [[Self]]
entity["Counterstrike"]["passive"] = true
--a function: statuschance
entity["Counterstrike"]["name"] = [[Counterstrike]]
--a function: status
entity["Counterstrike"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Drain Ice"] = {}
--a function: numericaltype
entity["Drain Ice"]["element"] = [[Ice]]
--a function: cost
entity["Drain Ice"]["desc"] = [[Raise resistance against ice attacks to 'Drain']]
--a function: numberofhits
entity["Drain Ice"]["conditional"] = [[DRAIN]]
--a function: hitchance
entity["Drain Ice"]["target"] = [[Self]]
entity["Drain Ice"]["passive"] = true
--a function: statuschance
entity["Drain Ice"]["name"] = [[Drain Ice]]
--a function: status
entity["Drain Ice"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Dodge Ice"] = {}
--a function: numericaltype
entity["Dodge Ice"]["element"] = [[Ice]]
--a function: cost
entity["Dodge Ice"]["desc"] = [[Improves evasion against ice attacks]]
--a function: numberofhits
entity["Dodge Ice"]["conditional"] = [[DODGE]]
--a function: hitchance
entity["Dodge Ice"]["target"] = [[Self]]
entity["Dodge Ice"]["passive"] = true
--a function: statuschance
entity["Dodge Ice"]["name"] = [[Dodge Ice]]
--a function: status
entity["Dodge Ice"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Power Slash"] = {}
entity["Power Slash"]["numericaltype"] = [[Absolute Value]]
entity["Power Slash"]["element"] = [[Slash]]
entity["Power Slash"]["cost"] = 10
entity["Power Slash"]["desc"] = [[Light Slash damage to one foe]]
entity["Power Slash"]["numberofhits"] = 1
--a function: conditional
entity["Power Slash"]["hitchance"] = 92
entity["Power Slash"]["target"] = [[One Enemy]]
entity["Power Slash"]["passive"] = false
--a function: statuschance
entity["Power Slash"]["name"] = [[Power Slash]]
entity["Power Slash"]["status"] = [[None]]
entity["Power Slash"]["targetattribute"] = [[HP]]
entity["Power Slash"]["numericalvalue"] = 88
entity["Power Slash"]["costtype"] = [[HP (%)]]
entity["Auto-Masukunda"] = {}
entity["Auto-Masukunda"]["numericaltype"] = [[Percentage]]
entity["Auto-Masukunda"]["element"] = [[Support]]
--a function: cost
entity["Auto-Masukunda"]["desc"] = [[All foes enter battle with lowered Hit/Evasion]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Auto-Masukunda"]["target"] = [[All Enemy]]
entity["Auto-Masukunda"]["passive"] = true
--a function: statuschance
entity["Auto-Masukunda"]["name"] = [[Auto-Masukunda]]
--a function: status
entity["Auto-Masukunda"]["targetattribute"] = [[Agility]]
entity["Auto-Masukunda"]["numericalvalue"] = -50
--a function: costtype
entity["Resist Ice"] = {}
--a function: numericaltype
entity["Resist Ice"]["element"] = [[Ice]]
--a function: cost
entity["Resist Ice"]["desc"] = [[Raise resistance against ice attacks to 'Strong']]
--a function: numberofhits
entity["Resist Ice"]["conditional"] = [[STRONG]]
--a function: hitchance
entity["Resist Ice"]["target"] = [[Self]]
entity["Resist Ice"]["passive"] = true
--a function: statuschance
entity["Resist Ice"]["name"] = [[Resist Ice]]
--a function: status
entity["Resist Ice"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Makarakarn"] = {}
--a function: numericaltype
entity["Makarakarn"]["element"] = [[Support]]
entity["Makarakarn"]["cost"] = 55
entity["Makarakarn"]["desc"] = [[Repels the next magical attack back towards the enemy]]
entity["Makarakarn"]["numberofhits"] = 1
entity["Makarakarn"]["conditional"] = [[if attack.element IN magical THEN Repel]]
entity["Makarakarn"]["hitchance"] = 100
entity["Makarakarn"]["target"] = [[Self]]
entity["Makarakarn"]["passive"] = false
--a function: statuschance
entity["Makarakarn"]["name"] = [[Makarakarn]]
entity["Makarakarn"]["status"] = [[None]]
entity["Makarakarn"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
entity["Makarakarn"]["costtype"] = [[SP]]
entity["Null Pierce"] = {}
--a function: numericaltype
entity["Null Pierce"]["element"] = [[Pierce]]
--a function: cost
entity["Null Pierce"]["desc"] = [[Raise resistance to pierce damage to Null]]
--a function: numberofhits
entity["Null Pierce"]["conditional"] = [[NULL]]
--a function: hitchance
entity["Null Pierce"]["target"] = [[Self]]
entity["Null Pierce"]["passive"] = true
--a function: statuschance
entity["Null Pierce"]["name"] = [[Null Pierce]]
--a function: status
entity["Null Pierce"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Sprint 05"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 05"]["desc"] = [[AI extensions, fusion API wrappers, fixes to particles]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 05"]["passive"] = false
--a function: statuschance
entity["Sprint 05"]["name"] = [[Sprint 05]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Zio"] = {}
entity["Zio"]["numericaltype"] = [[Absolute Value]]
entity["Zio"]["element"] = [[Elec]]
entity["Zio"]["cost"] = 4
entity["Zio"]["desc"] = [[Minor electric damage to one foe]]
entity["Zio"]["numberofhits"] = 1
--a function: conditional
entity["Zio"]["hitchance"] = 95
entity["Zio"]["target"] = [[One Enemy]]
entity["Zio"]["passive"] = false
entity["Zio"]["statuschance"] = 10
entity["Zio"]["name"] = [[Zio]]
entity["Zio"]["status"] = [[Shock]]
entity["Zio"]["targetattribute"] = [[HP]]
entity["Zio"]["numericalvalue"] = 50
entity["Zio"]["costtype"] = [[SP]]
entity["Poison Boost"] = {}
--a function: numericaltype
entity["Poison Boost"]["element"] = [[Status]]
--a function: cost
entity["Poison Boost"]["desc"] = [[Raises chance to poison to the enemy]]
--a function: numberofhits
entity["Poison Boost"]["conditional"] = [[if attack.status IS poison THEN BOOST chance]]
--a function: hitchance
entity["Poison Boost"]["target"] = [[Self]]
entity["Poison Boost"]["passive"] = true
entity["Poison Boost"]["statuschance"] = 25
entity["Poison Boost"]["name"] = [[Poison Boost]]
entity["Poison Boost"]["status"] = [[Poison]]
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Endure Light"] = {}
--a function: numericaltype
entity["Endure Light"]["element"] = [[Light]]
--a function: cost
entity["Endure Light"]["desc"] = [[Survive Light attacks with 1 HP]]
--a function: numberofhits
entity["Endure Light"]["conditional"] = [[ENDURE]]
--a function: hitchance
entity["Endure Light"]["target"] = [[Self]]
entity["Endure Light"]["passive"] = true
--a function: statuschance
entity["Endure Light"]["name"] = [[Endure Light]]
--a function: status
entity["Endure Light"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Invigorate 3"] = {}
entity["Invigorate 3"]["numericaltype"] = [[Percentage]]
entity["Invigorate 3"]["element"] = [[Support]]
--a function: cost
entity["Invigorate 3"]["desc"] = [[Heals some SP after each turn]]
--a function: numberofhits
entity["Invigorate 3"]["conditional"] = [[if battle.turn.end]]
--a function: hitchance
entity["Invigorate 3"]["target"] = [[Self]]
entity["Invigorate 3"]["passive"] = true
--a function: statuschance
entity["Invigorate 3"]["name"] = [[Invigorate 3]]
--a function: status
entity["Invigorate 3"]["targetattribute"] = [[SP]]
entity["Invigorate 3"]["numericalvalue"] = 15
--a function: costtype
entity["Mighty Swing"] = {}
entity["Mighty Swing"]["numericaltype"] = [[Absolute Value]]
entity["Mighty Swing"]["element"] = [[Slash]]
entity["Mighty Swing"]["cost"] = 10
entity["Mighty Swing"]["desc"] = [[Moderate slash damage to one foe]]
entity["Mighty Swing"]["numberofhits"] = 1
--a function: conditional
entity["Mighty Swing"]["hitchance"] = 99
entity["Mighty Swing"]["target"] = [[One Enemy]]
entity["Mighty Swing"]["passive"] = false
--a function: statuschance
entity["Mighty Swing"]["name"] = [[Mighty Swing]]
entity["Mighty Swing"]["status"] = [[None]]
entity["Mighty Swing"]["targetattribute"] = [[HP]]
entity["Mighty Swing"]["numericalvalue"] = 225
entity["Mighty Swing"]["costtype"] = [[HP (%)]]
entity["Repel Dark"] = {}
--a function: numericaltype
entity["Repel Dark"]["element"] = [[Dark]]
--a function: cost
entity["Repel Dark"]["desc"] = [[Raise resistance against dark attacks to 'Repel']]
--a function: numberofhits
entity["Repel Dark"]["conditional"] = [[REPEL]]
--a function: hitchance
entity["Repel Dark"]["target"] = [[Self]]
entity["Repel Dark"]["passive"] = true
--a function: statuschance
entity["Repel Dark"]["name"] = [[Repel Dark]]
--a function: status
entity["Repel Dark"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Evil Smile"] = {}
--a function: numericaltype
entity["Evil Smile"]["element"] = [[Status]]
entity["Evil Smile"]["cost"] = 10
entity["Evil Smile"]["desc"] = [[Chance to instill fear in all foes]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Evil Smile"]["target"] = [[All Enemy]]
entity["Evil Smile"]["passive"] = false
entity["Evil Smile"]["statuschance"] = 25
entity["Evil Smile"]["name"] = [[Evil Smile]]
entity["Evil Smile"]["status"] = [[Fear]]
--a function: targetattribute
--a function: numericalvalue
entity["Evil Smile"]["costtype"] = [[SP]]
entity["Diarama"] = {}
entity["Diarama"]["numericaltype"] = [[Absolute Value]]
entity["Diarama"]["element"] = [[Support]]
entity["Diarama"]["cost"] = 8
entity["Diarama"]["desc"] = [[Moderate heal on one ally]]
entity["Diarama"]["numberofhits"] = 1
--a function: conditional
entity["Diarama"]["hitchance"] = 100
entity["Diarama"]["target"] = [[One Ally]]
entity["Diarama"]["passive"] = false
--a function: statuschance
entity["Diarama"]["name"] = [[Diarama]]
entity["Diarama"]["status"] = [[None]]
entity["Diarama"]["targetattribute"] = [[HP]]
entity["Diarama"]["numericalvalue"] = 125
entity["Diarama"]["costtype"] = [[SP]]
entity["Drain Pierce"] = {}
--a function: numericaltype
entity["Drain Pierce"]["element"] = [[Pierce]]
--a function: cost
entity["Drain Pierce"]["desc"] = [[Raise resistance against pierce attacks to 'Drain']]
--a function: numberofhits
entity["Drain Pierce"]["conditional"] = [[DRAIN]]
--a function: hitchance
entity["Drain Pierce"]["target"] = [[Self]]
entity["Drain Pierce"]["passive"] = true
--a function: statuschance
entity["Drain Pierce"]["name"] = [[Drain Pierce]]
--a function: status
entity["Drain Pierce"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Sukukaja"] = {}
entity["Sukukaja"]["numericaltype"] = [[Percentage]]
entity["Sukukaja"]["element"] = [[Support]]
entity["Sukukaja"]["cost"] = 6
entity["Sukukaja"]["desc"] = [[Raises Hit/Evasion of one ally]]
entity["Sukukaja"]["numberofhits"] = 1
--a function: conditional
entity["Sukukaja"]["hitchance"] = 100
entity["Sukukaja"]["target"] = [[One Ally]]
entity["Sukukaja"]["passive"] = false
--a function: statuschance
entity["Sukukaja"]["name"] = [[Sukukaja]]
entity["Sukukaja"]["status"] = [[None]]
entity["Sukukaja"]["targetattribute"] = [[Agility]]
entity["Sukukaja"]["numericalvalue"] = 50
entity["Sukukaja"]["costtype"] = [[SP]]
entity["Bewilder"] = {}
--a function: numericaltype
entity["Bewilder"]["element"] = [[Status]]
entity["Bewilder"]["cost"] = 5
entity["Bewilder"]["desc"] = [[Chance to distress one foe]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Bewilder"]["target"] = [[One Enemy]]
entity["Bewilder"]["passive"] = false
entity["Bewilder"]["statuschance"] = 25
entity["Bewilder"]["name"] = [[Bewilder]]
entity["Bewilder"]["status"] = [[Distress]]
--a function: targetattribute
--a function: numericalvalue
entity["Bewilder"]["costtype"] = [[SP]]
entity["Deathbound"] = {}
entity["Deathbound"]["numericaltype"] = [[Absolute Value]]
entity["Deathbound"]["element"] = [[Slash]]
entity["Deathbound"]["cost"] = 19
entity["Deathbound"]["desc"] = [[Two major slash attacks to all foes]]
entity["Deathbound"]["numberofhits"] = 2
--a function: conditional
entity["Deathbound"]["hitchance"] = 90
entity["Deathbound"]["target"] = [[All Enemy]]
entity["Deathbound"]["passive"] = false
--a function: statuschance
entity["Deathbound"]["name"] = [[Deathbound]]
entity["Deathbound"]["status"] = [[None]]
entity["Deathbound"]["targetattribute"] = [[HP]]
entity["Deathbound"]["numericalvalue"] = 370
entity["Deathbound"]["costtype"] = [[HP (%)]]
entity["Null Distress"] = {}
--a function: numericaltype
entity["Null Distress"]["element"] = [[Status]]
--a function: cost
entity["Null Distress"]["desc"] = [[Prevents the status 'Distress']]
--a function: numberofhits
entity["Null Distress"]["conditional"] = [[STATUS]]
--a function: hitchance
entity["Null Distress"]["target"] = [[Self]]
entity["Null Distress"]["passive"] = true
--a function: statuschance
entity["Null Distress"]["name"] = [[Null Distress]]
entity["Null Distress"]["status"] = [[Distress]]
entity["Null Distress"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Mamudo"] = {}
entity["Mamudo"]["numericaltype"] = [[Percentage]]
entity["Mamudo"]["element"] = [[Dark]]
entity["Mamudo"]["cost"] = 12
entity["Mamudo"]["desc"] = [[Small chance to instant-kill all foes with darkness damage]]
entity["Mamudo"]["numberofhits"] = 1
--a function: conditional
entity["Mamudo"]["hitchance"] = 20
entity["Mamudo"]["target"] = [[All Enemy]]
entity["Mamudo"]["passive"] = false
--a function: statuschance
entity["Mamudo"]["name"] = [[Mamudo]]
entity["Mamudo"]["status"] = [[None]]
entity["Mamudo"]["targetattribute"] = [[HP]]
entity["Mamudo"]["numericalvalue"] = 100
entity["Mamudo"]["costtype"] = [[SP]]
entity["Amrita"] = {}
--a function: numericaltype
entity["Amrita"]["element"] = [[Support]]
entity["Amrita"]["cost"] = 25
entity["Amrita"]["desc"] = [[Cures all statuses on all allies]]
--a function: numberofhits
entity["Amrita"]["conditional"] = [[all]]
--a function: hitchance
entity["Amrita"]["target"] = [[All Ally]]
entity["Amrita"]["passive"] = false
entity["Amrita"]["statuschance"] = 100
entity["Amrita"]["name"] = [[Amrita]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
entity["Amrita"]["costtype"] = [[SP]]
entity["Sprint 12"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 12"]["desc"] = [[enhancements to dynamics, fixes to particles and AI testing]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 12"]["passive"] = false
--a function: statuschance
entity["Sprint 12"]["name"] = [[Sprint 12]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Resist Slash"] = {}
--a function: numericaltype
entity["Resist Slash"]["element"] = [[Slash]]
--a function: cost
entity["Resist Slash"]["desc"] = [[Raise resistance against slash attacks to 'Strong']]
--a function: numberofhits
entity["Resist Slash"]["conditional"] = [[STRONG]]
--a function: hitchance
entity["Resist Slash"]["target"] = [[Self]]
entity["Resist Slash"]["passive"] = true
--a function: statuschance
entity["Resist Slash"]["name"] = [[Resist Slash]]
--a function: status
entity["Resist Slash"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Unshaken Will"] = {}
--a function: numericaltype
entity["Unshaken Will"]["element"] = [[Status]]
--a function: cost
entity["Unshaken Will"]["desc"] = [[Prevents all statuses]]
--a function: numberofhits
entity["Unshaken Will"]["conditional"] = [[STATUS ALL]]
--a function: hitchance
entity["Unshaken Will"]["target"] = [[Self]]
entity["Unshaken Will"]["passive"] = true
--a function: statuschance
entity["Unshaken Will"]["name"] = [[Unshaken Will]]
--a function: status
entity["Unshaken Will"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Die for Me!"] = {}
entity["Die for Me!"]["numericaltype"] = [[Percentage]]
entity["Die for Me!"]["element"] = [[Dark]]
entity["Die for Me!"]["cost"] = 35
entity["Die for Me!"]["desc"] = [[High chance to instant-kill all foes with darkness damage]]
entity["Die for Me!"]["numberofhits"] = 1
--a function: conditional
entity["Die for Me!"]["hitchance"] = 85
entity["Die for Me!"]["target"] = [[All Enemy]]
entity["Die for Me!"]["passive"] = false
--a function: statuschance
entity["Die for Me!"]["name"] = [[Die for Me!]]
entity["Die for Me!"]["status"] = [[None]]
entity["Die for Me!"]["targetattribute"] = [[HP]]
entity["Die for Me!"]["numericalvalue"] = 100
entity["Die for Me!"]["costtype"] = [[SP]]
entity["Tarukaja"] = {}
entity["Tarukaja"]["numericaltype"] = [[Percentage]]
entity["Tarukaja"]["element"] = [[Support]]
entity["Tarukaja"]["cost"] = 6
entity["Tarukaja"]["desc"] = [[Boosts attack power of one ally]]
entity["Tarukaja"]["numberofhits"] = 1
--a function: conditional
entity["Tarukaja"]["hitchance"] = 100
entity["Tarukaja"]["target"] = [[One Ally]]
entity["Tarukaja"]["passive"] = false
--a function: statuschance
entity["Tarukaja"]["name"] = [[Tarukaja]]
entity["Tarukaja"]["status"] = [[None]]
entity["Tarukaja"]["targetattribute"] = [[Attack]]
entity["Tarukaja"]["numericalvalue"] = 50
entity["Tarukaja"]["costtype"] = [[SP]]
entity["Null Elec"] = {}
--a function: numericaltype
entity["Null Elec"]["element"] = [[Elec]]
--a function: cost
entity["Null Elec"]["desc"] = [[Raise resistance to electric damage to Null]]
--a function: numberofhits
entity["Null Elec"]["conditional"] = [[NULL]]
--a function: hitchance
entity["Null Elec"]["target"] = [[Self]]
entity["Null Elec"]["passive"] = true
--a function: statuschance
entity["Null Elec"]["name"] = [[Null Elec]]
--a function: status
entity["Null Elec"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Recarm"] = {}
entity["Recarm"]["numericaltype"] = [[Percentage]]
entity["Recarm"]["element"] = [[Support]]
entity["Recarm"]["cost"] = 20
entity["Recarm"]["desc"] = [[Revives one ally with half their HP]]
entity["Recarm"]["numberofhits"] = 1
entity["Recarm"]["conditional"] = [[if ally.down NOT PASS]]
entity["Recarm"]["hitchance"] = 100
entity["Recarm"]["target"] = [[One Ally]]
entity["Recarm"]["passive"] = false
entity["Recarm"]["statuschance"] = 100
entity["Recarm"]["name"] = [[Recarm]]
entity["Recarm"]["status"] = [[Down]]
entity["Recarm"]["targetattribute"] = [[HP]]
entity["Recarm"]["numericalvalue"] = 50
entity["Recarm"]["costtype"] = [[SP]]
entity["Poison Mist"] = {}
--a function: numericaltype
entity["Poison Mist"]["element"] = [[Status]]
entity["Poison Mist"]["cost"] = 10
entity["Poison Mist"]["desc"] = [[Chance to poison all foes]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
entity["Poison Mist"]["target"] = [[All Enemy]]
entity["Poison Mist"]["passive"] = false
entity["Poison Mist"]["statuschance"] = 25
entity["Poison Mist"]["name"] = [[Poison Mist]]
entity["Poison Mist"]["status"] = [[Poison]]
--a function: targetattribute
--a function: numericalvalue
entity["Poison Mist"]["costtype"] = [[SP]]
entity["Primal Force"] = {}
entity["Primal Force"]["numericaltype"] = [[Absolute Value]]
entity["Primal Force"]["element"] = [[Pierce]]
entity["Primal Force"]["cost"] = 21
entity["Primal Force"]["desc"] = [[Huge pierce damage to one foe]]
entity["Primal Force"]["numberofhits"] = 1
--a function: conditional
entity["Primal Force"]["hitchance"] = 95
entity["Primal Force"]["target"] = [[One Enemy]]
entity["Primal Force"]["passive"] = false
--a function: statuschance
entity["Primal Force"]["name"] = [[Primal Force]]
entity["Primal Force"]["status"] = [[None]]
entity["Primal Force"]["targetattribute"] = [[HP]]
entity["Primal Force"]["numericalvalue"] = 600
entity["Primal Force"]["costtype"] = [[HP (%)]]
entity["Agi"] = {}
entity["Agi"]["numericaltype"] = [[Absolute Value]]
entity["Agi"]["element"] = [[Fire]]
entity["Agi"]["cost"] = 3
entity["Agi"]["desc"] = [[Small fire damage to one foe]]
entity["Agi"]["numberofhits"] = 1
--a function: conditional
entity["Agi"]["hitchance"] = 95
entity["Agi"]["target"] = [[One Enemy]]
entity["Agi"]["passive"] = false
--a function: statuschance
entity["Agi"]["name"] = [[Agi]]
entity["Agi"]["status"] = [[None]]
entity["Agi"]["targetattribute"] = [[HP]]
entity["Agi"]["numericalvalue"] = 50
entity["Agi"]["costtype"] = [[SP]]
entity["Marakunda"] = {}
entity["Marakunda"]["numericaltype"] = [[Percentage]]
entity["Marakunda"]["element"] = [[Support]]
entity["Marakunda"]["cost"] = 12
entity["Marakunda"]["desc"] = [[Lowers defence of all foes]]
entity["Marakunda"]["numberofhits"] = 1
--a function: conditional
entity["Marakunda"]["hitchance"] = 100
entity["Marakunda"]["target"] = [[All Enemy]]
entity["Marakunda"]["passive"] = false
--a function: statuschance
entity["Marakunda"]["name"] = [[Marakunda]]
entity["Marakunda"]["status"] = [[None]]
entity["Marakunda"]["targetattribute"] = [[Defence]]
entity["Marakunda"]["numericalvalue"] = -50
entity["Marakunda"]["costtype"] = [[SP]]
entity["Twin Shot"] = {}
entity["Twin Shot"]["numericaltype"] = [[Absolute Value]]
entity["Twin Shot"]["element"] = [[Pierce]]
entity["Twin Shot"]["cost"] = 10
entity["Twin Shot"]["desc"] = [[Two light pierce attacks to one foe]]
entity["Twin Shot"]["numberofhits"] = 2
--a function: conditional
entity["Twin Shot"]["hitchance"] = 80
entity["Twin Shot"]["target"] = [[One Enemy]]
entity["Twin Shot"]["passive"] = false
--a function: statuschance
entity["Twin Shot"]["name"] = [[Twin Shot]]
entity["Twin Shot"]["status"] = [[None]]
entity["Twin Shot"]["targetattribute"] = [[HP]]
entity["Twin Shot"]["numericalvalue"] = 100
entity["Twin Shot"]["costtype"] = [[HP (%)]]
entity["Spring of Life"] = {}
entity["Spring of Life"]["numericaltype"] = [[Percentage]]
entity["Spring of Life"]["element"] = [[Support]]
--a function: cost
entity["Spring of Life"]["desc"] = [[Heals HP after each turn]]
--a function: numberofhits
entity["Spring of Life"]["conditional"] = [[if battle.turn.end]]
--a function: hitchance
entity["Spring of Life"]["target"] = [[Self]]
entity["Spring of Life"]["passive"] = true
--a function: statuschance
entity["Spring of Life"]["name"] = [[Spring of Life]]
--a function: status
entity["Spring of Life"]["targetattribute"] = [[HP]]
entity["Spring of Life"]["numericalvalue"] = 30
--a function: costtype
entity["Sprint 01"] = {}
--a function: numericaltype
--a function: element
--a function: cost
entity["Sprint 01"]["desc"] = [[prepare basic frameworks and outlines]]
--a function: numberofhits
--a function: conditional
--a function: hitchance
--a function: target
entity["Sprint 01"]["passive"] = false
--a function: statuschance
entity["Sprint 01"]["name"] = [[Sprint 01]]
--a function: status
--a function: targetattribute
--a function: numericalvalue
--a function: costtype
entity["Drain Fire"] = {}
--a function: numericaltype
entity["Drain Fire"]["element"] = [[Fire]]
--a function: cost
entity["Drain Fire"]["desc"] = [[Raise resistance against fire attacks to 'Drain']]
--a function: numberofhits
entity["Drain Fire"]["conditional"] = [[DRAIN]]
--a function: hitchance
entity["Drain Fire"]["target"] = [[Self]]
entity["Drain Fire"]["passive"] = true
--a function: statuschance
entity["Drain Fire"]["name"] = [[Drain Fire]]
--a function: status
entity["Drain Fire"]["targetattribute"] = [[Resistance]]
--a function: numericalvalue
--a function: costtype
entity["Marakukaja"] = {}
entity["Marakukaja"]["numericaltype"] = [[Percentage]]
entity["Marakukaja"]["element"] = [[Support]]
entity["Marakukaja"]["cost"] = 12
entity["Marakukaja"]["desc"] = [[Raises defence of all allies]]
entity["Marakukaja"]["numberofhits"] = 1
--a function: conditional
entity["Marakukaja"]["hitchance"] = 100
entity["Marakukaja"]["target"] = [[All Ally]]
entity["Marakukaja"]["passive"] = false
--a function: statuschance
entity["Marakukaja"]["name"] = [[Marakukaja]]
entity["Marakukaja"]["status"] = [[None]]
entity["Marakukaja"]["targetattribute"] = [[Defence]]
entity["Marakukaja"]["numericalvalue"] = 50
entity["Marakukaja"]["costtype"] = [[SP]]
entity["Dekaja"] = {}
--a function: numericaltype
entity["Dekaja"]["element"] = [[Support]]
entity["Dekaja"]["cost"] = 15
entity["Dekaja"]["desc"] = [[Removes all stat buffs from all foes]]
entity["Dekaja"]["numberofhits"] = 1
entity["Dekaja"]["conditional"] = [[if enemy.statqueue CONTAINS buff THEN REMOVE]]
entity["Dekaja"]["hitchance"] = 100
entity["Dekaja"]["target"] = [[All Enemy]]
entity["Dekaja"]["passive"] = false
--a function: statuschance
entity["Dekaja"]["name"] = [[Dekaja]]
entity["Dekaja"]["status"] = [[None]]
--a function: targetattribute
--a function: numericalvalue
entity["Dekaja"]["costtype"] = [[SP]]
entity["Agilao"] = {}
entity["Agilao"]["numericaltype"] = [[Absolute Value]]
entity["Agilao"]["element"] = [[Fire]]
entity["Agilao"]["cost"] = 6
entity["Agilao"]["desc"] = [[Moderate fire damage to one foe]]
entity["Agilao"]["numberofhits"] = 1
--a function: conditional
entity["Agilao"]["hitchance"] = 95
entity["Agilao"]["target"] = [[One Enemy]]
entity["Agilao"]["passive"] = false
--a function: statuschance
entity["Agilao"]["name"] = [[Agilao]]
entity["Agilao"]["status"] = [[None]]
entity["Agilao"]["targetattribute"] = [[HP]]
entity["Agilao"]["numericalvalue"] = 100
entity["Agilao"]["costtype"] = [[SP]]
entity["Mahamaon"] = {}
entity["Mahamaon"]["numericaltype"] = [[Percentage]]
entity["Mahamaon"]["element"] = [[Light]]
entity["Mahamaon"]["cost"] = 24
entity["Mahamaon"]["desc"] = [[Moderate chance to instant-kill all foes with light damage]]
entity["Mahamaon"]["numberofhits"] = 1
--a function: conditional
entity["Mahamaon"]["hitchance"] = 40
entity["Mahamaon"]["target"] = [[All Enemy]]
entity["Mahamaon"]["passive"] = false
--a function: statuschance
entity["Mahamaon"]["name"] = [[Mahamaon]]
entity["Mahamaon"]["status"] = [[None]]
entity["Mahamaon"]["targetattribute"] = [[HP]]
entity["Mahamaon"]["numericalvalue"] = 100
entity["Mahamaon"]["costtype"] = [[SP]]
return entity
