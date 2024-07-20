// Draw Event


draw_set_font(fntScore);
draw_set_halign(fa_center);
draw_set_alpha(0.5 + (0.5 * (current_time / end_time)));
draw_set_color(c_white);

draw_set_valign(fa_center);
draw_text(x, y, string(countdown));	

draw_circle(x, y, 45, true);
draw_circle(x, y, 46, true);
draw_circle(x, y, 47, true);
draw_set_alpha(1);