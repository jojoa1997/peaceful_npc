--
--Crafts
--

minetest.register_craft({
	output = 'peaceful_npc:npc_spawner',
	recipe = {
		{'default:mese_block', 'default:glass', 'default:mese_block'},
		{'default:glass', 'default:mese_crystal', 'default:glass'},
		{'default:mese_block', 'default:glass', 'default:mese_block'},
	}
})

minetest.register_craft({
	output = 'peaceful_npc:summoner',
	recipe = {
		{'default:mese_crystal', 'default:glass', 'default:mese_crystal'},
		{'default:glass', 'default:coal_lump', 'default:glass'},
		{'default:mese_crystal', 'default:glass', 'default:mese_crystal'},
	}
})

minetest.register_craft({
	output = 'peaceful_npc:npc_spawner',
	recipe = {
		{'default:mese', 'default:glass', 'default:mese'},
		{'default:glass', 'default:mese', 'default:glass'},
		{'default:mese', 'default:glass', 'default:mese'},
	}
})

minetest.register_craft({
	output = 'peaceful_npc:summoner',
	recipe = {
		{'default:mese', 'default:glass', 'default:mese'},
		{'default:glass', 'default:coal_lump', 'default:glass'},
		{'default:mese', 'default:glass', 'default:mese'},
	}
})

print("Peaceful NPC recipes.lua loaded! By jojoa1997!")