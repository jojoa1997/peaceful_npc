--Spawn Command Function
local function spawn_for_command(name, param)
	local npcs_to_spawn = tonumber(param) or 1
	local player = minetest.env:get_player_by_name(name)
	local pos = player:getpos()
	local max_spawn = 20
	local max_surround_npc = 30
	local active_npc_count = table.getn(minetest.env:get_objects_inside_radius(pos, 50))
	if active_npc_count == nil then
		active_npc_count = 0
	end
	if npcs_to_spawn + active_npc_count > max_surround_npc then
		minetest.chat_send_player(name, "There are too many NPCs around you.")
	elseif npcs_to_spawn >= max_spawn + 1 then
		minetest.chat_send_player(name, "The spawn limit is"..max_spawn)
	else
		for n = 1, npcs_to_spawn do
		offsetx = math.random(-5,5)
		offsety = math.random(2,4)
		offsetz = math.random(-5,5)
			minetest.env:add_entity({ x=pos.x+offsetx, y=pos.y+offsety, z=pos.z+offsetz }, ("peaceful_npc:npc"))
		end
	end
end

--Spawn command
minetest.register_chatcommand("summonnpc", {
	description = "spawns a npc",
    privs = {peacefulnpc=true},
    func = spawn_for_command
})

print("Peaceful NPC commands.lua loaded! By jojoa1997!")