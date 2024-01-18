/// @description Handles Debug Drawing
/// @author Toby Benjamin Clark
/// @date   14/01/2023

draw_self();

draw_rectangle(x - 20, (y + sprite_width), x,  (y + sprite_width) - ((end_time - start_time) / movement_factor), false);

draw_set_font(fntRaananaSmall);
draw_text(x + 10, y, symbol);
draw_text(x + 10, y+15, (string(current_time) + " / " + string(target_time)));
