/// @description Creation & Side Offset
/// @author Toby Benjamin Clark
/// @date   14/01/2023

//ps_badnotes
_ps2 = part_system_create();
part_system_draw_order(_ps2, true);

//Emitter
_ptype12 = part_type_create();
part_type_sprite(_ptype12, spr_semiquaver, false, true, true)
part_type_size(_ptype12, 0.1, 1, 0, 0.1);
part_type_scale(_ptype12, 1, 1);
part_type_speed(_ptype12, 2, 3, 0, 2);
part_type_direction(_ptype12, 0, 359, 1, 0);
part_type_gravity(_ptype12, 0, 270);
part_type_orientation(_ptype12, 0, 359, 2.7, 5, false);
part_type_colour3(_ptype12, $0000FF, $0000FF, $000035);
part_type_alpha3(_ptype12, 0.322, 0.42, 0.588);
part_type_blend(_ptype12, false);
part_type_life(_ptype12, 80, 80);



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
