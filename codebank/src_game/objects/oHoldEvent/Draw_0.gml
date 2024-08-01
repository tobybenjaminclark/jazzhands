/// @description Handles Debug Drawing	
/// @author Toby Benjamin Clark
/// @date   14/01/2023


var _scale = 0.4;

var hw = sprite_width div 2;
var hh = sprite_height div 2;

// Draw bottom sprite
draw_line(x - hw, y - hh, x + hw, y - hh);
draw_sprite_ext(sprite_index, 0, x, y, _scale, _scale, 0, image_blend, 1);

// Draw top sprite
draw_sprite_ext(sprite_index, 0, lx, ly, _scale, _scale, 0, image_blend, 1);
draw_line(lx - hw, ly + hh, lx + hw, ly + hh);

// Draw Debugs
draw_text(x, y, "X Y");
draw_text(lx, ly, "LX LY");

// Collision Drawing
if(colliding) draw_set_color(c_green);
else if(missed) draw_set_color(c_red);
else draw_set_color(c_white);
draw_set_alpha(0.4)

var ay = y - sprite_height div 2;
var by = ly + sprite_height div 2;

draw_line(x, ay, lx, by);
draw_line(x + 1, ay, lx + 1, by);
draw_line(x - 1, ay, lx - 1, by);
draw_line(x + 2, ay, lx + 2, by);
draw_line(x - 2, ay, lx - 2, by);
draw_line(x + 3, ay, lx + 3, by);
draw_line(x - 3, ay, lx - 3, by);

draw_set_alpha(1)
draw_line(x + 4, ay, lx + 4, by);
draw_line(x - 4, ay, lx - 4, by);

draw_set_alpha(1)

draw_set_color(c_white);

// draw_set_font(fntDebug);
// draw_text(x + 10, y, symbol);
// draw_text(x + 10, y+15, (string(current_time) + " / " + string(target_time)));
