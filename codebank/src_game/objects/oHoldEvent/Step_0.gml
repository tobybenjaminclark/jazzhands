/// @description Handles Beat Behaviour
/// @author Toby Benjamin Clark
/// @date   14/01/2023

/* Game Pause Logic */
if (parent.paused) paused = true;
if (paused && !parent.paused)
{
        paused = false;
        target_time += (parent.unpaused_time - parent.paused_time);
		target_time2 += (parent.unpaused_time - parent.paused_time);
}


/* Game Start Logic */
if (parent.start_time != 0 && !set)
{
    set = true;
    pstart_time = parent.start_time;
    target_time = pstart_time + start_time;
	target_time2 = pstart_time + end_time;
    moving = true;
}

// Handle respositioning
if(y + sprite_height > 0 && has_horizontal_shifted == false){
	if (side == "LEFT"){
		x = (room_width div 2) - 540;
		sx = x;
	}
	else if (side == "RIGHT"){
		x = (room_width div 2) + 540;
		sx = x;
	}
	has_horizontal_shifted = true;
}

/* Move Symbol if moving & not paused */
if (moving && !paused && !dead)
{
	
		
	/* Horizontal Moving Logic */
	// sx = starting x
	// tx = final x
	// Define the time at which the symbol should start moving
	var activation_time = target_time - 5000;  // Example: start moving when 90% of target_time is reached
	
	// Calculate the interpolation factor (a value between 0 and 1), starting from activation_time
	var t = 0;
	var _t = 0;
	if (current_time >= activation_time) {
	    t = (current_time - activation_time) / (target_time - activation_time);
		_t = (current_time - activation_time) / (target_time2 - activation_time);
	}

	/* Hack fucking fix, god forbid this stays in the game */
	x = lerp(sx, tx, t);
	lx = lerp(sx, tx, _t);
	
    y = (parent.kill_line - (sprite_height / 2)) - ((target_time - current_time) / movement_factor);
	ly = (parent.kill_line - (sprite_height / 2)) - ((target_time2 - current_time) / movement_factor);
	
	if(ly <= parent.kill_line && y >= parent.kill_line)
	{
		if((side == "LEFT" && global.left_hand == symbol) || (side == "RIGHT" && global.right_hand == symbol))
		{	
			if(!has_played_hit_sound){
				audio_play_sound(snd_metronome, 0, false);
				has_played_hit_sound = true;
			}
			
			if(missed == false) colliding = true;
			else colliding = false;
		}
		else
		{
			audio_play_sound(snd_vibrate, 0, false);
			colliding = false;
			missed = true;
			dead = true;
		}
	}
	else
	{
		colliding = false;	
	}

}


/* Symbol Death Transition */
if (ly >= parent.kill_line)
{	
	if(!missed)
	{
		image_blend = make_color_rgb(100, 255, 100);
		global.hit_beats += 1;
		parent.level_score += (100 * global.score_multiplier);
		ds_list_add(parent.combo_list, COMBO_HOLD);
	}
	else if(missed){
		ds_list_clear(parent.combo_list);
		image_blend = make_color_rgb(255, 100, 100);
	}
	dead = true;
}


/* Symbol Death Logic */
if(dead)
{
	if(image_xscale > 0.2){image_xscale -= 0.02;}
	if(image_yscale > 0.2){image_yscale -= 0.02;}
	if(image_alpha > 0) image_alpha -= 0.005;
	
	ly = ly - 1;
	if(x>room_width/2) lx += 1;
	else lx -= 1;
	
	moving = false;
	y = y - 1;
	if(x>room_width/2) x += 1;
	else x -= 1;
	if((x<0 || x>room_width) && (y<0 || y>room_height))
	{
		instance_destroy(self);
	}
}





