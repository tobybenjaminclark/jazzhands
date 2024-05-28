/// @description Handles Beat Behaviour
/// @author Toby Benjamin Clark
/// @date   14/01/2023

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
			audio_play_sound(snd_metronome, 0, false);
			parent.level_score += 100;
			image_blend = make_color_rgb(100, 255, 100);
		}
		else
		{
			image_blend = make_color_rgb(255, 100, 100);
		}
		
		dead = true;
	}
	/* TODO: Score Logic */
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





