/* Draw Background */
var _sw = sprite_get_width(spr_black_box);
var _sh = sprite_get_height(spr_black_box);
var _xsc = (room_width + 10) / _sw;
var _ysc = (room_height / 2) / _sh;
draw_sprite_ext(spr_black_box, 0, -10, (room_height div 2) + 70, _xsc, _ysc, 0, c_white, 0.85);

draw_set_color(c_white);
draw_line(0, (room_height div 2) + 70, room_width, (room_height div 2) + 70);

/* Draw Foreground */
var room_w = room_width;
var room_h = room_height;

// Calculate the scaling factors for width and height
var scale_w = room_w / sprite_width;
var scale_h = room_h / sprite_height;

// Choose the smaller scaling factor to maintain aspect ratio
var scale_uniform = min(scale_w, scale_h);

// Draw the sprite stretched uniformly to fit the room dimensions
draw_sprite_ext(sprite_index, 0, x, 0, scale_uniform, scale_uniform, 0, c_white, 1);
draw_set_font(fntTiny);
draw_set_color(c_gray);
draw_set_halign(fa_left);
draw_text(10, room_height - 22, "<Space> to skip.");
