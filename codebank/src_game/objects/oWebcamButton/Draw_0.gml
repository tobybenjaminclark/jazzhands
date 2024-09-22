/// @description Insert description here
// You can write your code in this editor

var _alpha = 1;

if(global.chosen_camera == name){
	draw_set_font(fntLevelNameTiny);
	draw_text(x + 60, y + 50, "[SELECTED]");
} else {
	_alpha = 0.8;
}

draw_set_alpha(_alpha);
draw_sprite_ext(sprWebcam, 0, x, y + 5, 0.10, 0.10, 0, c_white, _alpha); // Draw the button's sprite

draw_set_color(c_white);
draw_set_halign(fa_left);

draw_set_font(fntLevelNameSmall);
draw_text(x + 60, y, name)
draw_set_alpha(1.0);