/// @description Handles Debug Drawing
/// @author Toby Benjamin Clark
/// @date   14/01/2023


var _scale = 0.4;
draw_sprite_ext(sprite_index, 0, x, (y + sprite_width), _scale, _scale, 0, image_blend, 1);
draw_sprite_ext(sprite_index, 0, lx, ly + sprite_width, _scale, _scale, 0, image_blend, 1);

if(colliding) draw_set_color(c_green);
else if(missed) draw_set_color(c_red);
else draw_set_color(c_white);
draw_set_alpha(0.4)

draw_line(x, y, lx, ly);
draw_line(x + 1, y, lx + 1, ly);
draw_line(x - 1, y, lx - 1, ly);
draw_line(x + 2, y, lx + 2, ly);
draw_line(x - 2, y, lx - 2, ly);
draw_line(x + 3, y, lx + 3, ly);
draw_line(x - 3, y, lx - 3, ly);

draw_set_alpha(1)

draw_set_color(c_white);

// draw_set_font(fntDebug);
// draw_text(x + 10, y, symbol);
// draw_text(x + 10, y+15, (string(current_time) + " / " + string(target_time)));
