pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- game
-- by leo and karl
---@diagnostic disable: lowercase-global, undefined-global

-- the player data
player = {
	x=-32, -- x position on the map in pixels
	y=-32, -- y position on the map in pixels
	animation=0 -- animation to play
}

-- the fixed position of the
-- player on the screen
ancor = {x=64,y=64}

-- the doors on the map
doors = {
	[0] = {x=8,y=3,d=1},
	[1] = {x=13,y=0,d=1},
	[2] = {x=13,y=6,d=1}
}

-- defined flags
flag_free = 0
flag_door = 1

-- check if a plate is pressed
function check_plate(x, y)
	local sprite = get_sprite(x, y)
	if sprite >= 96 and sprite <= 99 then
		mset(
			(x+ancor.x) / 8,
			(y+ancor.y) / 8,
			100
		)
		unlock_door(sprite - 96)
	end
end

-- unlocks the doors on the map. This starts at the 
function unlock_door(d)
	local door = doors[d]
	local door_x = door.x
	local door_y = door.y
	local sprite = mget(door.x, door.y)

	-- repeat until sprite has not the door flag
	while fget(sprite, flag_door) do
		mset(
			door_x,
			door_y,
			sprite - 48
		)
		door_y = door_y + door.d
		sprite = mget(
			door_x,
			door_y
		)
	end
end

function _update()
	handle_input()
end

function _draw()
	cls(5)
	map(0, 0, -player.x,-player.y, 16, 16)
	spr(player.animation, ancor.x-4, ancor.y-8)
end
-->8
-- utility

-- returs the sprite based on the position of the player
-- please note that the position is in pixels
function get_sprite(x,y)
	local player_column = (x+ancor.x) / 8
	local player_row = (y+ancor.y) / 8

	return mget(
		player_column,
		player_row
	)
end

-- returns if a sprite at (x,y) position has the desired flag
function has_flag(x, y, f)
	return fget(get_sprite(x, y), f)
end
-->8
-- handlers

-- function to handle key
-- input, moves the player
function handle_input()
	-- check buttons
	local dx = 0
	local dy = 0
	if btn(0) then dx=dx-1 end
	if btn(1) then dx=dx+1 end
	if btn(2) then dy=dy-1 end
	if btn(3) then dy=dy+1 end

	-- next position
	local px = player.x + dx
	local py = player.y + dy

	-- check if it does not hit a wall
	if has_flag(px, py, flag_free) then
		handle_movement(px, py)
		handle_animation(dx, dy)
	end
end

function handle_movement(px, py)
	player.x = px
	player.y = py

	check_plate(px, py)
end

function handle_animation(dx, dy)
	local animation = 0
	if dx < 0 then animation=1
	elseif dx > 0 then animation=2
	elseif dy < 0 then animation=3
	end
	player.animation = animation
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dddd000ddddd0000ddddd000dddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dccd000dccdd0000ddccd000dddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dccd000dccdd0000ddccd000dddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dddd000ddddd0000ddddd000dddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dddd000ddddd0000ddddd000dddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000dd00000dd00000000dd00000dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000dd00000dd00000000dd00000dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666769666667777777777777777777777776666696776966666666666666666696766666967769666666666666666666666000000000000000000000000
66666666769666667777777777777777777777776666696776966666666666666666696766666967769666666666666666666666000000000000000000000000
66666666769666667777777777777777777777776666696776966666666666666666696766666967769666666666666666666666000000000000000000000000
66666666769666667777777777777777777777776666696776966666666666666666696766666967769666666666666666666666777777770000000000000000
66666666769666667777777777777777777777776666696776966666666666666666696766666967769666666666666666666666777777770000000000000000
66666666769666667666666666666666666666676666696776999999999999999999996766666966669666666666699999966666777777770000000000000000
66666666769666667699999999999999999999676666696776666666666666666666666766666999999666666666696666966666777777770000000000000000
66666666769666667696666666666666666669676666696700000000000000000000000066666666666666666666696776966666777777770000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
688888866888888668888886688888866bbbbbb60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
682222866822228668222286682222866b3333b60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
682222866822228668222286682222866b3333b60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
682222866822228668222286682222866b3333b60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
682222866822228668222286682222866b3333b60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
688888866888888668888886688888866bbbbbb60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66655666000000000000000077755777000000000000000000000000666556660000000000000000000000000000000000000000000000000000000000000000
66655666000000000000000077755777000000000000000000000000666556660000000000000000000000000000000000000000000000000000000000000000
66655666000000000000000077755777000000000000000000000000666556660000000000000000000000000000000000000000000000000000000000000000
66655666000000000000000077755777000000000000000000000000666556660000000000000000000000000000000000000000777557770000000000000000
66655666000000000000000077755777000000000000000000000000666556660000000000000000000000000000000000000000777557770000000000000000
66655666000000000000000066655666000000000000000000000000999559990000000000000000000000000000000000000000777557770000000000000000
66655666000000000000000099955999000000000000000000000000666556660000000000000000000000000000000000000000777557770000000000000000
66655666000000000000000066655666000000000000000000000000000000000000000000000000000000000000000000000000777557770000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010000000101010101010101000000000000000000000000000000000000001121418101000000000000000000000002000002000000020000000000020000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
4d4d4d4d4d4d4d0000004d4d4d7d4d4d4d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
424343434343440e000042434373434344000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
414040404040450e0e0e41404070404045000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
414040604040454d7d4d41404070404045000000004040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
414040404040494373434a404b774c4049434343404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4140406140404b4777474c40454d414040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
414040404040454e4e4e414049734a404b474747004040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4140406240404508084e41404070404045000000004040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4140404040404500000041404070404045000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4140404040404500000041404070404045000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4140404040404500000041404070404045000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4647474747474800000046474777474748000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000004e4e4e4e4e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000200502003020050200501e0501a05015050100500b0500605005050050500505005050060500705008050090500b0500e050140501505017050180501a0501a0501c0501a05001050020500b05014050
0010000020050200502005020050200501f0501f0501e0501d0501c0501b050190501805014050130500f0500d050090500405003050020500105001050020500305004050050500605007050090500a0500b050
__music__
00 41024344

