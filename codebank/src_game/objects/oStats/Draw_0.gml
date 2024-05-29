/// @description Draws Label to Layer
/// @author Toby Benjamin Clark
/// @date   14/01/2023

/* Draw the text to the screen */
draw_set_halign(fa_center);
draw_set_valign(fa_center);


// Draw level and circle
draw_circle(x, y, 65, true);
draw_set_font(fntRaanana);
draw_text(x, y + 5, "5");


// Draw label
draw_set_font(fntRaananaSmall);
draw_text(x, y + 115, "Music Level");