/// @description Insert description here
// You can write your code in this editor

// Draw black box etc...
/* Draw Background */
var _sw = sprite_get_width(spr_black_box);
var _sh = sprite_get_height(spr_black_box);
var _xsc = (room_width + 10) / _sw;
var _ysc = (room_height / 2) / _sh;
draw_sprite_ext(spr_black_box, 0, -10, (room_height div 2) + 260, _xsc, _ysc, 0, c_white, 0.85);

draw_set_color(c_white);
draw_line(0, (room_height div 2) + 260, room_width, (room_height div 2) + 260);

draw_set_font(fntTiny);
draw_set_color(c_gray);
draw_set_halign(fa_left);
draw_text(10, room_height - 22, "<Space> to skip.");