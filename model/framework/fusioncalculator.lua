require('json_reader')

function fuse(together, allpersonas)
	local combos = read({file='fusion_combos.json', path=(#together .. 'way')})
	local fusebetween = ""
	local fusebetweenbackwards = ""
	local base_level = 0
	local temp = {}
	local nextlowest = {}
	local common = false
	for name, persona in pairs(together) do
		if persona.arcana == common then common=true else common=persona.arcana end--Won't work for 3way+
		fusebetween = fusebetween .. persona.arcana
		fusebetweenbackwards = persona.arcana .. fusebetweenbackwards
		base_level = base_level + persona.level
--		if (persona.level > base_level and base_level == 0) or (persona.level < base_level) then
--			base_level = persona.level
--		end
	end
	base_level = base_level/(#together)+1--This is how it was done in the python fusion script that I had written.
	if not (type(common) == 'boolean') then common=false end
	print(fusebetween, combos[fusebetween])
	if combos[fusebetween] or combos[fusebetweenbackwards] then
		for name, persona in pairs(allpersonas) do
			if persona.arcana == combos[fusebetween] or persona.arcana == combos[fusebetweenbackwards] then
				temp[persona.name] = persona
			end
		end
		nextlowest.level = 100
		for name, persona in pairs(temp) do
			if not common then
				if persona.level > base_level and persona.level < nextlowest.level then
					nextlowest = persona
				end
			else
				if persona.level < nextlowest.level then
					nextlowest = persona
				end
			end
		end
	end
	return nextlowest
end


testps = {Pixie={name='Pixie', arcana='Lovers', level=10}, Io={name='Io', arcana='Lovers', level=1}, Cybele={name='Cybele', arcana='Lovers', level=64},Orpheus={name='Orpehus', arcana='Fool', level=1}, JackFrost={name='Jack Frost', arcana='Magician', level=8}, Angel={name='Angel', arcana='Justice', level=4}}
fusing = {testps.Orpheus, testps.Angel}
print(#fusing .. 'way')
result = fuse(fusing, testps)
if result.name then
	for key,value in pairs(result) do
		print(key, value)
	end
else
	print("No valid fusion results")
end