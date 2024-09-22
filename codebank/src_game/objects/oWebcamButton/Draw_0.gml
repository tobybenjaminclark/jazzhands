/// @description Insert description here
// You can write your code in this editor

draw_self(); // Draw the button's sprite

draw_set_color(c_white);
draw_set_halign(fa_left);

draw_set_font(fntLevelNameSmall);
draw_text(x, y, name)
if(global.chosen_camera == name){
	draw_set_font(fntLevelNameTiny);
	draw_text(x, y + 40, "[SELECTED]");
}