/// @description Insert description here
// You can write your code in this editor


draw_set_halign(fa_center);

draw_set_font(fntLevelName);
draw_text(room_width div 2, room_height div 2 - 500, heading);

if(number_of_matches_created <= 3 && intro_done == false && number_of_matches_created > 0) {
	draw_set_font(fntLevelNameSmall);
	draw_text(room_width div 2, room_height div 2 - 350, "Raise your hands infront of the camera view,\nand mimic the target gestures!");
}