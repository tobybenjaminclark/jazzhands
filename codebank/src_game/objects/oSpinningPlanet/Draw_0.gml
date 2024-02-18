/// @description Display Planetary Text
/// @author Toby Benjamin Clark
/// @date   12/01/2023


/* Draw planet sprite */
draw_self();

/* Draw Text (if text is visible) */
if(text_alpha != 0)
{
	draw_set_alpha(text_alpha);
	draw_set_halign(fa_left);
	draw_set_font(fntRaanana);
	draw_text(x + 70, y - 25, title);
	draw_set_font(fntRaananaSmall);
	draw_text(x + 70, y + 25, description);
	
		
	for (var i = 0; i < array_length(levels); i++)
	{
		draw_text(x, y + ((i + 1) * 50), levels[i]);
	}
	
	draw_set_alpha(1);

}








