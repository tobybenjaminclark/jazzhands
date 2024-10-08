/// @description Draws Label to Layer
/// @author Toby Benjamin Clark
/// @date   14/01/2023

/* Draw the text to the screen */
var current_label = label_list[current_label_index];
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_font(labelFont);
draw_set_valign(fa_top);
draw_text(x, y, current_label);

draw_set_font(fntLevelNameTiny);
draw_text(x, y + 50, "This shouldn't take longer than a minute...");