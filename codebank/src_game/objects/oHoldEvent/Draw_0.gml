/// @description Handles Debug Drawing	
/// @author Toby Benjamin Clark
/// @date   14/01/2023


// Colors
if(colliding) {draw_set_color(c_green);}
else if(missed) {draw_set_color(c_red);}
else {draw_set_color(c_white);}

if(dead){
	draw_set_alpha(image_alpha)
} else {
	draw_set_alpha(1)
}

var hw = (sprite_width div 2);
var hh = (sprite_height div 2);
var hws = hw * _scale;

// Draw bottom sprite
draw_line(x - hws, y - hh, x + hws, y - hh);
draw_line(x - hws, y - hh + 1, x + hws, y - hh + 1);
draw_sprite_ext(sprite_index, 0, x, y + 10, _scale, _scale, 0, c_white, draw_get_alpha());

// Draw top sprite
draw_sprite_ext(sprite_index, 0, lx, ly - 10, _scale, _scale, 0, c_white, draw_get_alpha());
draw_line(lx - hws, ly + hh, lx + hws, ly + hh);
draw_line(lx - hws, ly + hh + 1, lx + hws, ly + hh + 1);

if(!dead) {draw_set_alpha(0.4)}
else {draw_set_alpha(image_alpha / 2);}

var ay = y - sprite_height div 2;
var by = ly + sprite_height div 2;
draw_line(x, ay, lx, by);
draw_line(x + 1, ay, lx + 1, by);
draw_line(x - 1, ay, lx - 1, by);
draw_line(x + 2, ay, lx + 2, by);
draw_line(x - 2, ay, lx - 2, by);
draw_line(x + 3, ay, lx + 3, by);
draw_line(x - 3, ay, lx - 3, by);

if(!dead) {draw_set_alpha(1)}
draw_line(x + 4, ay, lx + 4, by);
draw_line(x - 4, ay, lx - 4, by);
draw_line(x + 5, ay, lx + 5, by);
draw_line(x - 5, ay, lx - 5, by);

if(!dead) {draw_set_alpha(1)}
draw_set_color(c_white);

