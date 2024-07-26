/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_color(c_white);
draw_set_font(fntCutsceneHeading);
draw_set_halign(fa_center);
draw_text(room_width div 2, 100, parent.beatmap_structure.level_data.level_name);
draw_text(room_width div 2, 300, "Level Complete");


draw_text(room_width div 2, 400, string(iaccuracy_display) + "% Accurate");

var _r = 5;
var _o = 2;
for (var _i = 0; _i < iaccuracy_display; _i++){
	draw_circle(room_width div 2 - (50 * (_r + _o)) + _i * (_r + _o), 450, _r div 2, false); 	
}

draw_text(room_width div 2, 500, string(global.total_beats) + " << total beats");
draw_text(room_width div 2, 600, string(global.hit_beats) + " << hit beats");
