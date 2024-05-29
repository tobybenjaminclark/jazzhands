/// @description Display Planetary Text & Render Subplanets
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
	draw_text(x - 135, y + 5, title);
	draw_set_font(fntRaananaSmall);
	draw_text(x - 135, y + 65, description);
	
	
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
			draw_set_font(fntRaanana);
			draw_text(px + 30, py - 10, level_objects[index].level_data.level_name);
			draw_set_font(fntRaananaSmall)
			draw_text(px + 30, py + 35, level_objects[index].level_data.description);
		}
	}
	draw_set_alpha(1);
}


