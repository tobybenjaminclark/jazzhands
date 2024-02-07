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

// Set x offset based on each side
if (side == "LEFT") x = x - side_offset;
else if (side == "RIGHT") x = x + side_offset;

/* Initial Y Position */
y = (parent.kill_line - (sprite_height / 2)) - ((current_time + time) - current_time)

/* Red to symbolize bad */
image_blend = make_color_rgb(255, 100, 100);
