--Spawn code
function npc_spawner(pos, SPAWN_TYPE)
	local MAX_NPC = 15
	local count = table.getn(minetest.env:get_objects_inside_radius(pos, 100))
	if count == nil then
		count = 0
	end
	
	if count <= MAX_NPC then
		minetest.env:add_entity({x=pos.x+math.random(-1,1),y=pos.y+math.random(2,3),z=pos.z+math.random(-1,1)}, (SPAWN_TYPE))
	end
end

--Item Code for default npcs
minetest.register_node("peaceful_npc:summoner_npc_def", {
	description = "Default NPC Summoner",
	image = "peaceful_npc_npc_summoner_def.png",
	inventory_image = "peaceful_npc_npc_summoner_def.png",
	wield_image = "peaceful_npc_npc_summoner_def.png",
	paramtype = "light",
	tiles = {"peaceful_npc_spawnegg.png"},
	is_ground_content = true,
	drawtype = "glasslike",
	groups = {crumbly=3},
	selection_box = {
		type = "fixed",
		fixed = {0,0,0,0,0,0}
	},
	sounds = default.node_sound_dirt_defaults(),
	on_place = function(itemstack, placer, pointed)
		local name = placer:get_player_name()
		if (minetest.check_player_privs(name, {peacefulnpc=true})) then
            pos = pointed.above
            pos.y = pos.y + 1
        minetest.env:add_entity(pointed.above,"peaceful_npc:npc_def")
        itemstack:take_item(1)
	else
		minetest.chat_send_player(name, "Nope! You need to have the peacefulnpc priv!")
	end
	return itemstack
end	
})

minetest.register_node("peaceful_npc:spawner_npc_def", {
	description = "Default NPC Portal",
	drawtype = "glasslike",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_glass_defaults(),
	tiles = {"peaceful_npc_spawner_def.png"},
	sunlight_propagates = true,
	paramtype = "light",
	mesecons = {effector = {
		action_on = npc_spawner
	}}
})
minetest.register_abm({
	nodenames = {"peaceful_npc:spawner_npc_def"},
	interval = 20,
	chance = 1,
	action = function(pos)
		npc_spawner(pos, "peaceful_npc:npc_def")
	end,
})

--Item Code for fast npcs
minetest.register_node("peaceful_npc:summoner_npc_fast", {
	description = "Fast NPC Summoner",
	image = "peaceful_npc_npc_summoner_fast.png",
	inventory_image = "peaceful_npc_npc_summoner_fast.png",
	wield_image = "peaceful_npc_npc_summoner_fast.png",
	paramtype = "light",
	tiles = {"peaceful_npc_spawnegg.png"},
	is_ground_content = true,
	drawtype = "glasslike",
	groups = {crumbly=3},
	selection_box = {
		type = "fixed",
		fixed = {0,0,0,0,0,0}
	},
	sounds = default.node_sound_dirt_defaults(),
	on_place = function(itemstack, placer, pointed)
		local name = placer:get_player_name()
		if (minetest.check_player_privs(name, {peacefulnpc=true})) then
            pos = pointed.above
            pos.y = pos.y + 1
        minetest.env:add_entity(pointed.above,"peaceful_npc:npc_fast")
        itemstack:take_item(1)
	else
		minetest.chat_send_player(name, "Nope! You need to have the peacefulnpc priv!")
	end
	return itemstack
end	
})

minetest.register_node("peaceful_npc:spawner_npc_fast", {
	description = "Fast NPC Portal",
	drawtype = "glasslike",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_glass_defaults(),
	tiles = {"peaceful_npc_spawner_def.png"},
	sunlight_propagates = true,
	paramtype = "light",
	mesecons = {effector = {
		action_on = npc_spawner
	}}
})
minetest.register_abm({
	nodenames = {"peaceful_npc:spawner_npc_fast"},
	interval = 20,
	chance = 1,
	action = function(pos)
		npc_spawner(pos, "peaceful_npc:npc_fast")
	end,
})

print("Peaceful NPC items.lua loaded! By jojoa1997!")