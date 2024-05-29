// Draw Event


draw_set_font(fntScore);
draw_set_alpha(0.5 + (0.5 * (timer / room_speed)));

draw_set_valign(fa_center);
draw_text(x, y, string(countdown));	

draw_circle(x, y, 60, true);
draw_circle(x, y, 61, true);
draw_circle(x, y, 62, true);
draw_circle(x, y, 63, true);
draw_set_alpha(1);