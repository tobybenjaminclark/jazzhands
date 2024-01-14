/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_set_font(fntRaananaSmall);
draw_text(x + 10, y, symbol);
draw_text(x + 10, y+15, (string(current_time) + " / " + string(target_time)));
