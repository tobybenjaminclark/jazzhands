/// @description Insert description here
// You can write your code in this editor

if(boulder == true){
	
	audio_play_sound(snd_rock_destroy, 1, false);
	
	// Copy pasted boilerplate from the particle system editor.
	//ps_boulderexplode
	var _ps = part_system_create();
	part_system_draw_order(_ps, true);

	// Part 1 Emitter_1_1
	var _ptype1 = part_type_create();
	part_type_sprite(_ptype1, sprBoulderPart3, false, true, false)
	part_type_size(_ptype1, 0.05, 0.1, -0.0005, 0);
	part_type_scale(_ptype1, 1, 1);
	part_type_speed(_ptype1, 3, 3, -0.03, 0);
	part_type_direction(_ptype1, 330, 359, 0, 0);
	part_type_gravity(_ptype1, 0, 180);
	part_type_orientation(_ptype1, 0, 359, 6, 0, false);
	part_type_colour3(_ptype1, $4F6BA3, $A3A3CC, $191919);
	part_type_alpha3(_ptype1, 1, 1, 0.078);
	part_type_blend(_ptype1, false);
	part_type_life(_ptype1, 70, 70);

	var _pemit1 = part_emitter_create(_ps);
	part_emitter_region(_ps, _pemit1, -64, 64, -64, 64, ps_shape_ellipse, ps_distr_linear);
	part_emitter_burst(_ps, _pemit1, _ptype1, 10);

	// Part 1 Emitter_1
	var _ptype2 = part_type_create();
	part_type_sprite(_ptype2, sprBoulderPart2, false, true, false)
	part_type_size(_ptype2, 0.05, 0.1, -0.001, 0);
	part_type_scale(_ptype2, 1, 1);
	part_type_speed(_ptype2, 3, 3, -0.03, 0);
	part_type_direction(_ptype2, 0, 359, 0, 0);
	part_type_gravity(_ptype2, 0, 270);
	part_type_orientation(_ptype2, 0, 359, 4, 3, false);
	part_type_colour3(_ptype2, $7F7FFF, $FFFFFF, $191919);
	part_type_alpha3(_ptype2, 1, 1, 0.078);
	part_type_blend(_ptype2, false);
	part_type_life(_ptype2, 80, 140);

	var _pemit2 = part_emitter_create(_ps);
	part_emitter_region(_ps, _pemit2, -32, 32, -32, 32, ps_shape_ellipse, ps_distr_linear);
	part_emitter_burst(_ps, _pemit2, _ptype2, 10);

	// Part 1 Emitter
	var _ptype3 = part_type_create();
	part_type_sprite(_ptype3, sprBoulderPart1, false, true, false)
	part_type_size(_ptype3, 0.05, 0.1, -0.0005, 0);
	part_type_scale(_ptype3, 1, 1);
	part_type_speed(_ptype3, 2, 2, -0.03, 0);
	part_type_direction(_ptype3, 0, 359, 0, 0);
	part_type_gravity(_ptype3, 0, 270);
	part_type_orientation(_ptype3, 0, 359, 4, 0, false);
	part_type_colour3(_ptype3, $7FAAFF, $FFFFFF, $191919);
	part_type_alpha3(_ptype3, 1, 1, 0.078);
	part_type_blend(_ptype3, false);
	part_type_life(_ptype3, 60, 80);

	var _pemit3 = part_emitter_create(_ps);
	part_emitter_region(_ps, _pemit3, -32, 32, -32, 32, ps_shape_ellipse, ps_distr_linear);
	part_emitter_burst(_ps, _pemit3, _ptype3, 5);

	part_system_position(_ps, x, y);
}

boulder = false;
instance_destroy(other);


