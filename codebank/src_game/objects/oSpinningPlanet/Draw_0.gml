/// @description Display Planetary Text
/// @author Toby Benjamin Clark
/// @date   12/01/2023


/* Draw planet sprite */
draw_self();

/* Draw Text (if text is visible) */
if(text_alpha != 0)
{
	draw_set_alpha(text_alpha);
	draw_set_halign(fa_right);
	draw_set_font(fntRaanana);
	draw_text(x - 100, y - 35, title);
	draw_set_font(fntRaananaSmall);
	draw_text(x - 100, y + 25, description);
	
	
	
	// Draw Level Headers
	var index = -1;
	for (var angle = start_angle; angle < start_angle + 91; angle += 30)
	{
		index++;
		px = x + lengthdir_x(230, angle);
		py = y + lengthdir_y(230, angle);
		draw_sprite_ext(sprPlanetRecord1, 0, px, py, 0.2, 0.2, 0, c_white, text_alpha);
		if(angle == 0)
		{
			draw_set_halign(fa_left);
			draw_text(px + 30, py, levels[index]);
		}
	}
	
	draw_set_alpha(1);
}




draw_text(x, y - 30, string(start_angle));







