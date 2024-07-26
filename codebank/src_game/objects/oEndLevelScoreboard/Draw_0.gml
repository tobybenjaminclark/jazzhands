/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_color(c_white);
draw_set_font(fntMenuTitle);
draw_set_halign(fa_center);
draw_text(room_width div 2, 100, parent.beatmap_structure.level_data.level_name);
draw_text(room_width div 2, 300, "Level Complete");

/* New font */
draw_set_font(fntCutsceneHeading);
	
/* Draw some other data! */
draw_set_color(c_white)
if(display_step >= 1) draw_text(room_width div 2, 350, string(global.total_beats) + " << total beats");
if(display_step >= 2) draw_text(room_width div 2, 400, string(global.hit_beats) + " << hit beats");
if(display_step >= 3) draw_text(room_width div 2, 450, string(parent.level_score) + " << hit beats");

if(display_step >= 4){ 

	/* Draw dot holes */
	var _r = 7;
	var _o = 3;
	draw_set_color(c_white);
	for (var _i = 0; _i < 100; _i++){
		draw_circle(room_width div 2 - (50 * (_r + _o)) + _i * (_r + _o), 600, _r div 2, true); 	
	}

	/* Set accuracy color */
	if(iaccuracy_display < pass_accuracy){draw_set_color(c_red);}
	if(iaccuracy_display >= pass_accuracy){draw_set_color(c_lime);}

	/* Draw accuracy label */
	draw_text(room_width div 2, 550, string(iaccuracy_display) + "% Accuracy");

	/* Draw dots */
	for (var _i = 0; _i < iaccuracy_display; _i++){
		draw_circle(room_width div 2 - (50 * (_r + _o)) + _i * (_r + _o), 600, _r div 2, false); 	
	}

	draw_text(room_width div 2, 650, string(pass_accuracy) + "% to pass.");

}


