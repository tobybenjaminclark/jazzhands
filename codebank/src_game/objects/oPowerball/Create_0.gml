/// @description Insert description here
// You can write your code in this editor

/* Make particle sys */
//ps_powerball
_ps = part_system_create();
part_system_draw_order(_ps, true);

//Emitter
var _ptype1 = part_type_create();
part_type_shape(_ptype1, pt_shape_disk);
part_type_size(_ptype1, 0.1, 0.3, -0.01, 0);
part_type_scale(_ptype1, 0.6, 0.6);
part_type_speed(_ptype1, 1, 2, 0, 0);
part_type_direction(_ptype1, 0, 355, 0, 0);
part_type_gravity(_ptype1, 0, 270);
part_type_orientation(_ptype1, 0, 0, 0, 0, false);
part_type_colour3(_ptype1, $FFFFFF, $FFB84F, $FFFFFF);
part_type_alpha3(_ptype1, 1, 1, 0);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 30, 40);

var _pemit1 = part_emitter_create(_ps);
part_emitter_region(_ps, _pemit1, -32, 32, -32, 32, ps_shape_ellipse, ps_distr_invgaussian);
part_emitter_stream(_ps, _pemit1, _ptype1, 1);

spd = 10;
if(target.x < 0 || target.y < 0 || target.boulder == false){
	instance_destroy(self);	
}