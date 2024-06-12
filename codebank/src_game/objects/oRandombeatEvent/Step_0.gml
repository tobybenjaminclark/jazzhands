/// @description Handles Beat Behaviour
/// @author Toby Benjamin Clark
/// @date   14/01/2023

/* Particles */
time_since_last_symbol_change++;
if(time_since_last_symbol_change >= 10){
	time_since_last_symbol_change = 0;
	sprite_i = irandom_range(0, 6);
	switch sprite_i{
		case 0:
			sprite_index = sprSymbolClosedFistBase;
			break;
		case 1:
			sprite_index = sprSymbolOpenPalmBase;
			break;
		case 2:
			sprite_index = sprSymbolPointUpBase;
			break;
		case 3:
			sprite_index = sprSymbolThumbsDownBase;
			break;
		case 4:
			sprite_index = sprSymbolThumbsUpBase;
			break;
		case 5:
			sprite_index = sprSymbolVictoryBase;
			break;
	}
}

if(y > parent.kill_line - RANDOMBEAT_SAFEZONE_OFFSET){
	sprite_index = original_sprite;
}

/* Game Pause Logic */
if (parent.paused) paused = true;
if (paused && !parent.paused)
{
        paused = false;
        target_time += (parent.unpaused_time - parent.paused_time);
} 


/* Game Start Logic */
if (parent.start_time != 0 && !set)
{
    set = true;
    start_time = parent.start_time;
    target_time = start_time + time;
    moving = true;
}


/* Move Symbol if moving & not paused */
if (moving && !paused && !dead)
{
	
	/* Moving Logic */
	// sx = starting x
	// tx = final x
	// Ensure current_time is within the bounds of 0 to target_time
	var clamped_time = clamp(current_time, 0, target_time);

	// Calculate the interpolation factor (a value between 0 and 1)
	var t = clamped_time / target_time;

	// Interpolate between sx and tx
	x = lerp(sx, tx, t);
	
	
    y = (parent.kill_line - (sprite_height / 2)) - ((target_time - current_time) / movement_factor);
	
	/* Symbol Death Transition */
    if (y >= (parent.kill_line) || current_time >= target_time)
	{
		if((side == "LEFT" && global.left_hand == symbol) || (side == "RIGHT" && global.right_hand == symbol))
		{
			/* Hit (Good!) */
			part_particles_create(_ps, x, y, _ptype2, 30);
			audio_play_sound(snd_metronome, 0, false);
			ds_list_add(parent.combo_list, COMBO_BEAT);
			parent.level_score += 100;
			image_blend = make_color_rgb(100, 255, 100);
		}
		else
		{
			/* Fail */
			part_particles_create(_ps, x, y, _ptype1, 25);
			audio_play_sound(snd_vibrate, 0, false);
			ds_list_clear(parent.combo_list);
			image_blend = make_color_rgb(255, 100, 100);
		}
		
		dead = true;
	}
}	



/* Symbol Death Logic */
if(dead)
{
	if(image_xscale > 0.2){image_xscale -= 0.02;}
	if(image_yscale > 0.2){image_yscale -= 0.02;}
	if(image_alpha > 0) image_alpha -= 0.005;
	
	moving = false;
	y = y - 1;
	if(x>room_width/2) x += 1;
	else x -= 1;
	if((x<0 || x>room_width) && (y<0 || y>room_height))
	{
		instance_destroy(self);
	}
}





