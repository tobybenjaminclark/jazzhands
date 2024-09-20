/// @description Display Planetary Text & Render Subplanets
/// @author Toby Benjamin Clark
/// @date   12/01/2023


/* Draw planet sprite */
if(player_level < world * 4){
	shader_set(shader_bw);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
	shader_reset();
	
	draw_sprite_ext(sprPadlock, 0, x, y, image_xscale * 0.7, image_yscale * 0.7, 0, c_white, 1);
}
else{
	draw_self();
}

/* Draw Text (if text is visible) */
if(text_alpha != 0)
{
	draw_set_alpha(text_alpha);
	draw_sprite_ext(sprPlanetSelector, 0, x, y, 0.29 + (0.02 * selector_scale), 0.29 + (0.02 * selector_scale), 0, c_white, text_alpha);
	
	/* Draw Planet */	
	draw_set_halign(fa_center);
	
	draw_set_font(fntLevelName);
	draw_text(x, y + 185, title);
	
	draw_set_font(fntLevelNameSmall);
	draw_text(x, y + 250, "[ENTER]");
	
	
	
	
	// Draw Level Headers
	/*
	var index = -1;
	for (var angle = start_angle; angle < start_angle + 91; angle += 30)
	{
		index++;
		px = x + lengthdir_x(230, angle);
		py = y + lengthdir_y(230, angle);
		
		if(player_level < world * 4 + index + 1){
			draw_sprite_ext(sprPadlock, 0, px, py, 0.1, 0.1, 0, c_white, text_alpha);
			
			shader_set(shader_bw);
			draw_sprite_ext(sprPlanetRecord1, image_index, px, py, 0.12, 0.12, 0, c_white, text_alpha);
			shader_reset();
		}
		else{
			draw_sprite_ext(sprPlanetRecord1, image_index, px, py, 0.12, 0.12, 0, c_white, text_alpha);
		}
			
		if(angle == 0)
		{
			draw_sprite_ext(sprPlanetSelector, 0, px, py, 0.1 + (0.02 * selector_scale), 0.1 + (0.02 * selector_scale), 0, c_white, text_alpha);

			draw_set_halign(fa_left);
			
			draw_set_font(fntRaananaSmall);
			draw_text(px + 80, py - 60, "W" + string(world) + "-L" + string(index + 1));
			
			draw_set_font(fntLevelName);
			draw_text(px + 80, py - 10, level_objects[index].level_data.level_name);

		}
	}
	*/
	draw_set_alpha(1);
}


