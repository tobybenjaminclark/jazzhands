/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(bg_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

draw_set_color(c_white);
draw_set_halign(fa_center);

if(display_step >= 0){
	draw_set_font(fntScoreboardSmall);
	draw_text(room_width div 2, 100, global.current_level);
	
	draw_set_font(fntScoreboard);
	draw_text(room_width div 2, 150, parent.beatmap_structure.level_data.level_name);
}

/* New font */
draw_set_font(fntScoreboardSmall);
	
/* Draw some other data! */
draw_set_color(c_white)
var _o = 500;

/* Draw total beats */
if(display_step >= 1) {
	draw_set_halign(fa_left)
	draw_text(room_width div 2 - _o, 250, "Total Beats");
	draw_set_halign(fa_right)
	draw_text(room_width div 2 + _o, 250, string(global.total_beats));
}

/* Draw missed beats */
if(display_step >= 2) {
	draw_set_halign(fa_left)
	draw_text(room_width div 2 - _o, 325, "Beats Missed");
	draw_set_halign(fa_right)
	draw_text(room_width div 2 + _o, 325, string(global.total_beats - global.hit_beats));
}

/* Draw beats hit */
if(display_step >= 3) {
	draw_set_halign(fa_left)
	draw_text(room_width div 2 - _o, 400, "Beats Hit");
	draw_set_halign(fa_right)
	draw_text(room_width div 2 + _o, 400, string(global.hit_beats));
}


if(display_step >= 4)
{

	/* Draw accuracy label */
	draw_set_halign(fa_left);
	draw_text(room_width div 2 - _o, 475, "Accuracy");
	draw_set_halign(fa_right);
	draw_text(room_width div 2 + _o, 475, string(iaccuracy_display) + "%");

	/* Set accuracy color */
	if(iaccuracy_display < pass_accuracy){draw_set_color(c_red);}
	if(iaccuracy_display >= pass_accuracy){draw_set_color(c_lime);}
	
	/* Draw dot holes */
	var _r = 7;
	var _o = 3;
	draw_set_color(c_white);
	for (var _i = 0; _i < 100; _i++){
		draw_circle(room_width div 2 - (50 * (_r + _o)) + _i * (_r + _o), 550, _r div 2, true); 	
	}

	/* Draw dots */
	for (var _i = 0; _i < iaccuracy_display; _i++){
		draw_circle(room_width div 2 - (50 * (_r + _o)) + _i * (_r + _o), 550, _r div 2, false); 	
	}
}

if(display_step >= 5){
	if(has_post_cutscene){
		draw_text(room_width div 2 + _o, 600, "Play post cutscene");
	}
	else {
		draw_text(room_width div 2 + _o, 600, "NO POST CUTSCENE");
	}
}

