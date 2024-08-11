
if(tracking_beat){
	if twin.side == "LEFT" {
		x = (room_width div 2) - room_width div 3;
	} else {
		x = (room_width div 2) + room_width div 3;
	}
	y = twin.y - 300;
}

if(twin.dead && !exploded){
	exploded = true;
	if(twin.hit_this_beat) {
		//ps_coconut_good
		var _ps = part_system_create();
		part_system_draw_order(_ps, true);

		//Milk
		var _ptype1 = part_type_create();
		part_type_sprite(_ptype1, spr_semiquaver, false, true, false)
		part_type_size(_ptype1, 1, 1, -0.01, 0);
		part_type_scale(_ptype1, 1, 1);
		part_type_speed(_ptype1, 2, 2, 0, 0);
		part_type_direction(_ptype1, 0, 255, 0, 0);
		part_type_gravity(_ptype1, 0, 270);
		part_type_orientation(_ptype1, 0, 255, 4, 0, false);
		part_type_colour3(_ptype1, $43DB11, $72FF00, $FFFFFF);
		part_type_alpha3(_ptype1, 0.6, 1, 0);
		part_type_blend(_ptype1, false);
		part_type_life(_ptype1, 50, 80);

		var _pemit1 = part_emitter_create(_ps);
		part_emitter_region(_ps, _pemit1, -32, 32, -32, 32, ps_shape_rectangle, ps_distr_linear);
		part_emitter_burst(_ps, _pemit1, _ptype1, 25);

		//Coconut_1
		var _ptype2 = part_type_create();
		part_type_sprite(_ptype2, sprCoconutChunk, false, true, false)
		part_type_size(_ptype2, 0.12, 0.12, -0.0017, 0);
		part_type_scale(_ptype2, 1, 1);
		part_type_speed(_ptype2, 5, 5, -0.1, 0);
		part_type_direction(_ptype2, 128, 359, 0, 0);
		part_type_gravity(_ptype2, 0, 270);
		part_type_orientation(_ptype2, 0, 359, 15, 0, false);
		part_type_colour3(_ptype2, $FFFFFF, $FFFFFF, $FFFFFF);
		part_type_alpha3(_ptype2, 1, 0.69, 0);
		part_type_blend(_ptype2, false);
		part_type_life(_ptype2, 40, 80);

		var _pemit2 = part_emitter_create(_ps);
		part_emitter_region(_ps, _pemit2, -32, 32, -32, 32, ps_shape_rectangle, ps_distr_linear);
		part_emitter_burst(_ps, _pemit2, _ptype2, 1);

		//Coconut
		var _ptype3 = part_type_create();
		part_type_sprite(_ptype3, sprCoconutChunk, false, true, false)
		part_type_size(_ptype3, 0.12, 0.12, -0.0017, 0);
		part_type_scale(_ptype3, 1, 1);
		part_type_speed(_ptype3, 5, 5, -0.1, 0);
		part_type_direction(_ptype3, 0, 128, 0, 0);
		part_type_gravity(_ptype3, 0, 270);
		part_type_orientation(_ptype3, 0, 359, 15, 0, false);
		part_type_colour3(_ptype3, $FFFFFF, $FFFFFF, $FFFFFF);
		part_type_alpha3(_ptype3, 1, 0.671, 0);
		part_type_blend(_ptype3, false);
		part_type_life(_ptype3, 40, 80);

		var _pemit3 = part_emitter_create(_ps);
		part_emitter_region(_ps, _pemit3, -32, 32, -32, 32, ps_shape_rectangle, ps_distr_linear);
		part_emitter_burst(_ps, _pemit3, _ptype3, 1);

		part_system_position(_ps, x, y);
	}
	else {
		//ps_coconut_bad
		var _ps = part_system_create();
		part_system_draw_order(_ps, true);

		//Milk
		var _ptype1 = part_type_create();
		part_type_sprite(_ptype1, spr_semiquaver, false, true, false)
		part_type_size(_ptype1, 1, 1, -0.01, 0);
		part_type_scale(_ptype1, 1, 1);
		part_type_speed(_ptype1, 2, 2, 0, 0);
		part_type_direction(_ptype1, 0, 255, 0, 0);
		part_type_gravity(_ptype1, 0, 270);
		part_type_orientation(_ptype1, 0, 255, 4, 0, false);
		part_type_colour3(_ptype1, $0000FF, $000068, $FFFFFF);
		part_type_alpha3(_ptype1, 0.6, 1, 0);
		part_type_blend(_ptype1, false);
		part_type_life(_ptype1, 50, 80);

		var _pemit1 = part_emitter_create(_ps);
		part_emitter_region(_ps, _pemit1, -32, 32, -32, 32, ps_shape_rectangle, ps_distr_linear);
		part_emitter_burst(_ps, _pemit1, _ptype1, 25);

		//Coconut_1
		var _ptype2 = part_type_create();
		part_type_sprite(_ptype2, sprCoconutChunk, false, true, false)
		part_type_size(_ptype2, 0.12, 0.12, -0.0017, 0);
		part_type_scale(_ptype2, 1, 1);
		part_type_speed(_ptype2, 5, 5, -0.1, 0);
		part_type_direction(_ptype2, 128, 359, 0, 0);
		part_type_gravity(_ptype2, 0, 270);
		part_type_orientation(_ptype2, 0, 359, 15, 0, false);
		part_type_colour3(_ptype2, $FFFFFF, $FFFFFF, $FFFFFF);
		part_type_alpha3(_ptype2, 1, 0.69, 0);
		part_type_blend(_ptype2, false);
		part_type_life(_ptype2, 40, 80);

		var _pemit2 = part_emitter_create(_ps);
		part_emitter_region(_ps, _pemit2, -32, 32, -32, 32, ps_shape_rectangle, ps_distr_linear);
		part_emitter_burst(_ps, _pemit2, _ptype2, 1);

		//Coconut
		var _ptype3 = part_type_create();
		part_type_sprite(_ptype3, sprCoconutChunk, false, true, false)
		part_type_size(_ptype3, 0.12, 0.12, -0.0017, 0);
		part_type_scale(_ptype3, 1, 1);
		part_type_speed(_ptype3, 5, 5, -0.1, 0);
		part_type_direction(_ptype3, 0, 128, 0, 0);
		part_type_gravity(_ptype3, 0, 270);
		part_type_orientation(_ptype3, 0, 359, 15, 0, false);
		part_type_colour3(_ptype3, $FFFFFF, $FFFFFF, $FFFFFF);
		part_type_alpha3(_ptype3, 1, 0.671, 0);
		part_type_blend(_ptype3, false);
		part_type_life(_ptype3, 40, 80);

		var _pemit3 = part_emitter_create(_ps);
		part_emitter_region(_ps, _pemit3, -32, 32, -32, 32, ps_shape_rectangle, ps_distr_linear);
		part_emitter_burst(_ps, _pemit3, _ptype3, 1);

		part_system_position(_ps, x, y);	
	}
	instance_destroy(self);
}