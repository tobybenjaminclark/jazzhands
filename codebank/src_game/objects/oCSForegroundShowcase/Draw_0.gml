
/* Draw Background */
var _sw = sprite_get_width(spr_black_box);
var _sh = sprite_get_height(spr_black_box);
var _xsc = (room_width + 10) / _sw;
var _ysc = (room_height / 2) / _sh;
draw_sprite_ext(spr_black_box, 0, -10, (room_height div 2) + 70, _xsc, _ysc, 0, c_white, 0.85);

draw_set_color(c_white);
draw_line(0, (room_height div 2) + 70, room_width, (room_height div 2) + 70);



// Draw the sprite stretched uniformly to fit the room dimensions
draw_sprite_ext(sprLightRays, 0, x, y, scale * 1.4, scale * 1.4, rot, c_white, 1);
draw_sprite_ext(sprite, 0, x, y, scale, scale, 0, c_white, 1);

draw_set_halign(fa_center)
draw_text(room_width div 2, room_height div 2, "Showcase!");

draw_set_font(fntTiny);
draw_set_color(c_gray);
draw_set_halign(fa_left);
draw_text(10, room_height - 22, "<Space> to skip.");
