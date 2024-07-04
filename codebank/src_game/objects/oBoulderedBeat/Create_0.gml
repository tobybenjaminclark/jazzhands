/// @description Creation & Side Offset
/// @author Toby Benjamin Clark
/// @date   14/01/2023

/* Trail PS */
_ps2 = part_system_create();
part_system_draw_order(_ps2, true);

//Emitter
_ptype12 = part_type_create();
part_type_sprite(_ptype12, spr_semiquaver, false, true, true)
part_type_size(_ptype12, 0.1, 1, 0, 0);
part_type_scale(_ptype12, 1, 1);
part_type_speed(_ptype12, 1, 2, 0, 0);
part_type_direction(_ptype12, 0, 359, 0, 0);
part_type_gravity(_ptype12, 0, 270);
part_type_orientation(_ptype12, 0, 359, 1.4, 0, false);
part_type_colour3(_ptype12, $D865FF, $FFD67F, $00C7FF);
part_type_alpha3(_ptype12, 0.322, 0.42, 0.588);
part_type_blend(_ptype12, false);
part_type_life(_ptype12, 80, 80);

/* PS */
_ps = part_system_create();
part_system_draw_order(_ps, true);

/* Bad Particles (Missed Beat) */
_ptype1 = part_type_create();
part_type_shape(_ptype1, pt_shape_ring);
part_type_size(_ptype1, 0.5, 1, -0.02, 0);
part_type_scale(_ptype1, 1, 1);
part_type_speed(_ptype1, 2, 4, 0.1, 1);
part_type_direction(_ptype1, 0, 359, 0, 0);
part_type_gravity(_ptype1, 0.1, 270);
part_type_orientation(_ptype1, 0, 0, 0, 0, false);
part_type_colour3(_ptype1, $9999BF, $0000FF, $000060);
part_type_alpha3(_ptype1, 1, 1, 1);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 80, 80);

/* Good Particles (Hit Beat) */
_ptype2 = part_type_create();
part_type_shape(_ptype2, pt_shape_ring);
part_type_size(_ptype2, 0.5, 1, -0.02, 0);
part_type_scale(_ptype2, 1, 1);
part_type_speed(_ptype2, 2, 4, 0.1, 1);
part_type_direction(_ptype2, 0, 359, 0, 0);
part_type_orientation(_ptype2, 0, 0, 0, 0, false);
part_type_colour3(_ptype2, $FFFFFF, $00FF00, $008000);
part_type_alpha3(_ptype2, 1, 1, 1);
part_type_blend(_ptype2, false);
part_type_life(_ptype2, 80, 80);

/* Initial Variable Setup */
boulder = true;
boulder_rot = 0;

start_time = 0;
target_time = 0;
movement_factor = 6;
paused = false;
set = false;
moving = false;
dead = false;
rotation_direction = 1;

/* Set x offset based on each side */
tx = x - side_offset;
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











