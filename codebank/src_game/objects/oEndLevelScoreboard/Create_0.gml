/// @description Insert description here
// You can write your code in this editor

/* Setting alphas */
an1 = 0;
a0 = 0;
a1 = 0;
a2 = 0;
a3 = 0;
a4 = 0;
a5 = 0;
alpha_increase = 0.025;

/* Style accuracy */
is_green = false;

/* Check for post cutscene */
has_played_post_cutscene = false;
has_post_cutscene = false;
post_cutscene_path = "";
if parent.has_post_cutscene {
	has_post_cutscene = true;
	post_cutscene_path = parent.post_cutscene_path;
}

/* Log current step */
bg_alpha = 0;
current_step = 0;
pass_accuracy = 0.60;
has_played_end_accuracy_seq = false;
display_step = -1;

/* Calculate accuracy etc... determine if the player won or failed? */
accuracy = global.hit_beats / global.total_beats; 
accuracy = 0.8
iaccuracy = round(accuracy * 100);

iaccuracy_display = 0;

audio_play_sound(level_win, 1, false);
width = 0;
height = 0;


/* Make particle system */
//ps_greennote
_ps = part_system_create();
part_system_draw_order(_ps, true);

//Emitter
var _ptype1 = part_type_create();
part_type_sprite(_ptype1, spr_semiquaver, false, true, true)
part_type_size(_ptype1, 0.3, 0.5, 0, 0);
part_type_scale(_ptype1, 1, 1);
part_type_speed(_ptype1, 1, 2, 0, 0);
part_type_direction(_ptype1, 0, 359, 0, 0);
part_type_gravity(_ptype1, 0.2, 270);
part_type_orientation(_ptype1, 0, 355, 4, 0, false);
part_type_colour3(_ptype1, $7CB282, $00B202, $FFFFFF);
part_type_alpha3(_ptype1, 1, 1, 0);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 10, 40);

var _pemit1 = part_emitter_create(_ps);
part_emitter_region(_ps, _pemit1, -2.5, 2.5, -2.5, 2.5, ps_shape_ellipse, ps_distr_linear);
part_emitter_stream(_ps, _pemit1, _ptype1, 2);
part_emitter_interval(_ps, _pemit1, 0.02, 0.05, time_source_units_seconds);

part_system_position(_ps, -500, -500);