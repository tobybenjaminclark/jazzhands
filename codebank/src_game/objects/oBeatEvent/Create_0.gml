/// @description Creation & Side Offset
/// @author Toby Benjamin Clark
/// @date   14/01/2023

/* Initial Variable Setup */

start_time = 0;
target_time = 0;
movement_factor = 6;
paused = false;
set = false;
moving = false;
dead = false;


tx = x - side_offset;
// Set x offset based on each side
if (side == "LEFT"){
	tx = x - side_offset;
	x = x - side_offset * 16;
}
else if (side == "RIGHT"){
	tx = x + side_offset;
	x = x + side_offset * 16;
}

sx = x;
sy = y;

/* Initial Y Position */
y = (parent.kill_line - (sprite_height / 2)) - ((current_time + time) - current_time)











