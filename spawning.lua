--Spawn function
function def_spawn(pos)
	minetest.env:add_entity(pos, "peaceful_npc:npc_def")
	minetest.chat_send_all("want to spawn npc_def at "..dump(pos))
end

function fast_spawn(pos)
	minetest.env:add_entity(pos, "peaceful_npc:npc_fast")
	minetest.chat_send_all("want to spawn npc_fast at "..dump(pos))
end

--biomes
def_biome = {
	surface = "default:dirt_with_grass",
	avoid_nodes = { "default:water_source", "default:water_flowing"},
	avoid_radius = 5,
	rarity = 95,
	max_count = 1,
	min_elevation = -10,
	max_elevation = 30,
}

beach_biome = {
	surface = "default:sand",
	avoid_nodes = { "default:water_source", "default:water_flowing"},
	avoid_radius = 1,
	rarity = 90,
	max_count = 1,
	min_elevation = 0,
	max_elevation = 10,
}

desert_biome = {
	surface = { "default:desert_sand", "default:desert_stone"},
	avoid_nodes = { "default:water_source", "default:water_flowing"},
	avoid_radius = 3,
	rarity = 50,
	max_count = 1,
	min_elevation = 0,
	max_elevation = 100,
}
	
--spawn def
plantslib:register_generate_plant(def_biome, "def_spawn")
plantslib:register_generate_plant(beach_biome, "fast_spawn")
plantslib:register_generate_plant(desert_biome, "fast_spawn")


print("Peaceful NPC spawning.lua loaded! By jojoa1997!")