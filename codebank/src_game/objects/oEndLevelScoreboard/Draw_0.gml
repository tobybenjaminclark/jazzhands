/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_color(c_white);
draw_set_font(fntCutsceneHeading);
draw_set_halign(fa_center);
draw_text(room_width div 2, 300, "Level Complete");
draw_text(room_width div 2, 500, string(accuracy * 100) + "% Accurate");