/// @description Creation & Side Offset
/// @author Toby Benjamin Clark
/// @date   14/01/2023
hit_this_beat = false;
lx = -500
ly = -500


/* Scale? */
_scale = 0.5;

/* Initial Variable Setup */
pstart_time = 0;
target_time = 0;
paused = false;
set = false;
moving = false;
dead = false;

image_blend = c_red;

colliding = false;	
missed = false;
has_played_hit_sound = false;
rotation_direction = 1;
has_horizontal_shifted = false;

/* Flip side (makes the game easier?) */
if (side == "LEFT") {image_xscale = -image_xscale;}

/* Set x offset based on each side */
tx = x - side_offset;
if (side == "LEFT"){
	tx = x - side_offset;
	x = x - side_offset * 32;
}
else if (side == "RIGHT"){
	tx = x + side_offset;
	x = x + side_offset * 32;
}

sx = x;
sy = y;

/* Initial Y Position */
y = (parent.kill_line - (sprite_height / 2)) - ((current_time + start_time) - current_time)







