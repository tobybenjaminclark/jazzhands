/// @description Create and configure particle system that trails behind the mouse

// Create the particle system
_ps = part_system_create();
part_system_draw_order(_ps, true);

// Create the particle type
var _ptype1 = part_type_create();
part_type_sprite(_ptype1, spr_semiquaver, false, true, true);
part_type_size(_ptype1, 1, 1.5, -0.02, 0);
part_type_scale(_ptype1, 1, 1);
part_type_speed(_ptype1, 1, 1.5, 0.1, 0);
part_type_direction(_ptype1, 0, 359, 0, 0);
part_type_gravity(_ptype1, 0, 270);
part_type_orientation(_ptype1, -45, 45, 5, 0, false);
part_type_colour3(_ptype1, $FFFFFF, $FFFFFF, $FFFFFF);
part_type_alpha3(_ptype1, 1, 0.7, 0);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 55, 55);

// Create the emitter
_pemit1 = part_emitter_create(_ps);
part_emitter_region(_ps, _pemit1, -32, 32, -32, 32, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(_ps, _pemit1, _ptype1, 1);
part_emitter_interval(_ps, _pemit1, 0.02, 0.09, time_source_units_seconds);

/* Previous Mouse Position */
pmx = 0;
pmy = 0;
